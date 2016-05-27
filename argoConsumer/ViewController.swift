//
//  ViewController.swift
//  argoConsumer
//
//  Created by Nathan Sass on 5/27/16.
//  Copyright © 2016 RideArgo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var userEvents = ["Caitlyn's Birthday", "Marcus Wedding", "AKC Dog Show"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int {
            // Return the number of rows in the section.
            return userEvents.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,
                                                               forIndexPath: indexPath)
        // Configure the cell...
        cell.textLabel?.text = userEvents[indexPath.row]
        return cell }


}

