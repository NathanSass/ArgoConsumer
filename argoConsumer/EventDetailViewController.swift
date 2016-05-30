//
//  EventDetailViewController.swift
//  argoConsumer
//
//  Created by Nathan Sass on 5/29/16.
//  Copyright © 2016 RideArgo. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    @IBOutlet var eventDetailTitleLabel: UILabel!;
    var eventDetailTitle = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        eventDetailTitleLabel.text = eventDetailTitle
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
