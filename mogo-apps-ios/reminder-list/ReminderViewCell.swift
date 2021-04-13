//
//  ReminderViewCell.swift
//  mogo-apps-ios
//
//  Created by Ellrica Jana on 07/04/21.
//

import UIKit

class ReminderViewCell: UITableViewCell {

    @IBOutlet weak var reminderTitle: UILabel!
    @IBOutlet weak var reminderDetail: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setReminder (reminder:Reminder){
        reminderTitle.text = reminder.reminderTitle
        reminderDetail.text = reminder.reminderDetail
    }

}
