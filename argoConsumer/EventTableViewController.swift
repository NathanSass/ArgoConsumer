//
//  EventTableViewController.swift
//  argoConsumer
//
//  Created by Nathan Sass on 5/27/16.
//  Copyright © 2016 RideArgo. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController {
    
    var eventArr = [
        [
            "id": 87,
            "name": "Preloaded event",
            "street": "1234 Farm street",
            "place": "Farmville",
            "costSplit": "private"
        ]
    ]
    
    func updateIP() {
        
        let userID = "12"
        let getEndpoint = "http://localhost:3000/api/user/" + userID + "/events"
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: getEndpoint)!
        
        // Make the POST call and handle it in a completion handler
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            do {
                if let ipString = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                    
                    // Parse the JSON to get the IP
                    let response = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
                    
                    
                    var events: [Dictionary<String, NSObject>] = []
                    
                    
                    for event in response {

                        
                        guard let name = event["name"] as? String,
                            let id = event["id"] as? Int,
                            let street = event["street"] as? String,
                            let costSplit = event["cost_split"] as? String,
//                            let startDate = event["start_date"] as? NSDate,
                            let place = event["place"] as? String else {
                                return;
                        }

                        
                        let currentEvent = [
                            "id": id,
                            "name": name,
                            "street": street,
//                            "startDate": startDate,
                            "place": place,
                            "costSplit": costSplit
                        ]

                        
                        events.append(currentEvent as! Dictionary<String, NSObject> )
                    }
                    
                    self.eventArr = events
                    
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        self.tableView.reloadData()
                        return
                    })
                    
                    // Update the label
                }
            } catch {
                print("bad things happened")
            }
        }).resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateIP()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return eventArr.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,
                                                               forIndexPath: indexPath) as! EventTableViewCell
        // Configure the cell...
        
        cell.eventTitleLabel.text = eventArr[indexPath.row]["name"] as? String
        cell.eventPlaceLabel.text = eventArr[indexPath.row]["place"] as? String
        // Add date here
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showEventDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! EventDetailViewController
//                var event = eventArr[indexPath.row]
//                print(eventArr[indexPath.row]["name"])
                destinationController.event = eventArr[indexPath.row]
//                destinationController.eventDetailTitle = (eventArr[indexPath.row]["name"] as? String)!
            }
        }
    }

}
