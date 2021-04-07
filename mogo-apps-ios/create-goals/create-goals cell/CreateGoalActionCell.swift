//
//  CreateGoalActionCell.swift
//  mogo-apps-ios
//
//  Created by Carlos Gamaliel Manurung on 07/04/21.
//

import UIKit

class CreateGoalActionCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonTarget: UIButton! {
        didSet {
            buttonTarget.layer.cornerRadius = 5.0
            buttonTarget.backgroundColor = .systemGroupedBackground
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
