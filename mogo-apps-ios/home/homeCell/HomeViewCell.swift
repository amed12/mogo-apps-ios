//
//  HomeViewCell.swift
//  mogo-apps-ios
//
//  Created by Achmad Fathullah on 07/04/21.
//

import UIKit

class HomeViewCell: UITableViewCell {

    @IBOutlet weak var progressGoal: ProgressDrawer!
    @IBOutlet weak var GoalImage: UIImageView!
    @IBOutlet weak var GoalTitle: UILabel!
    @IBOutlet weak var GoalDate: UILabel!
    @IBOutlet weak var GoalBudget: UILabel!
    @IBOutlet weak var GoalProgressView: UIView!
    @IBOutlet weak var GoalPercent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
