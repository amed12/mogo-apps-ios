//
//  HomeCell.swift
//  mogo-apps-ios
//
//  Created by Achmad Fathullah on 07/04/21.
//

import UIKit

class HomeCell: UITableViewCell {
    @IBOutlet weak var GoalImage: UIImageView!
    
    @IBOutlet weak var GoalTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var GoalBudget: UILabel!
    @IBOutlet weak var GoalTargetDate: UILabel!
    @IBOutlet weak var GoalProgress: UIView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
