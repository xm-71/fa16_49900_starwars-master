//
//  APIManager.swift
//  StarWarsAPI
//
//  Created by Rob Elliott on 11/11/16.
//  Copyright © 2016 Rob Elliott. All rights reserved.
//

import UIKit

class APIManager: NSObject {
    
    // MAKE THIS CLASS A SINGLETON
    static let sharedInstance = APIManager()
    
    // oject for sending an receiving htt request 
    let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    
    // a nsurlsessiondatatask to execute a "get" request and retrieve data into memory
    var dataTask: NSURLSessionDataTask?
    
    // function to retrieve data from our api
    
    func retrieveAllDataForModel(modelName:String){
    
        // cancel an existing connection if there is on
        if dataTask != nil {
        dataTask?.cancel()
        
        }
    // show that the network is busy in the status bar
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        // set up the search request
        
        let requestURL: NSURL = NSURL(string: "https://swapi.co/api/\(modelName)/?format=json")!
        
        
        //set up the data retrieval task
        //use a different completion handler for each model
        
        switch modelName {
            
        case "people":
            dataTask = defaultSession.dataTaskWithURL(requestURL, completionHandler: processRetrievedDataForPeople)
            
            
        
        default:
            dataTask = nil
        
        
        }
        
        
        
        //start the data retrieval
        
        dataTask?.resume()

    
    }
    
    func processRetrievedDataForPeople(data: NSData?, reponse: NSURLResponse?, error: NSError?) -> Void{
        
        // stop the ui activity indicator
        
        //check data for errors
        
        if let error = error {
        
        print("People data look up error \(error.localizedDescription)")
        
        }
        
        else if let httpResponce = reponse as? NSHTTPURLResponse {
        
            if httpResponce.statusCode == 200 {
        
        //check the reponse
        
        //process the data
        
        do {
        let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            
            //print(jsonData["results"])
            
            //loop through the retrieved data and create a person object for each element of the json array
            
            if let retrievedPeople = jsonData["results"] as? [[String: AnyObject]] {
            
                var peopleArray = [Person]()
                
                for thisPerson in retrievedPeople {
                 
                    let newPerson = Person()
                    newPerson.name = thisPerson["name"] as? NSString
                    
                    peopleArray.append(newPerson)
                    
                    print(newPerson.name!)
                    
                }//end for loop 
                
                StarWarsDataStore.sharedInstance.allPeople = peopleArray
            
            }
        
        }
        
        catch {
        
            print("Error serializing JSON: \(error)")
        
        }
            }//end status code
        }//end else if
    
    }


}