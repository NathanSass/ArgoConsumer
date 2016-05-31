//
//  EventTableViewCell.swift
//  argoConsumer
//
//  Created by Nathan Sass on 5/27/16.
//  Copyright © 2016 RideArgo. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet var eventTitleLabel: UILabel!
    @IBOutlet var eventStreetLabel: UILabel!
    @IBOutlet var eventPlaceLabel: UILabel!
    @IBOutlet var eventCostSplitLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
