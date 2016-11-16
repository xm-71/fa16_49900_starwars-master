//
//  PlanetsTableViewController.swift
//  StarWarsAPI
//
//  Created by Rob Elliott on 11/11/16.
//  Copyright © 2016 Rob Elliott. All rights reserved.
//

import UIKit

class PlanetsTableViewController: UITableViewController {
    
    override func viewWillAppear(animated: Bool) {
        APIManager.sharedInstance.retrieveAllDataForModel("planets")
    }
    
    override func viewDidLoad() {
        //reg as a listener for the notifcationcent
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.catchNotification), name: "PeopleDataRetrieved", object: nil)
    }
    
    // table view controller methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StarWarsDataStore.sharedInstance.allPlanets.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // this code runs once for each table cell
        
        let cell = tableView.dequeueReusableCellWithIdentifier("planetCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = StarWarsDataStore.sharedInstance.allPlanets[indexPath.row].name as String?
        
        return cell
    }
    
    func catchNotification(){
        
        print("Planets data was retrieved")
        
        tableView.reloadData()
        
    }
    
}
