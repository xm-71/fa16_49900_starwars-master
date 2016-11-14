//
//  PeopleTableViewController.swift
//  StarWarsAPI
//
//  Created by Rob Elliott on 11/11/16.
//  Copyright © 2016 Rob Elliott. All rights reserved.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    
    override func viewWillAppear(animated: Bool) {
        APIManager.sharedInstance.retrieveAllDataForModel("people")
    }
    

}
