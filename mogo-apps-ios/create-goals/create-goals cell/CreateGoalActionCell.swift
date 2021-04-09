//
//  CreateGoalActionCell.swift
//  mogo-apps-ios
//
//  Created by Carlos Gamaliel Manurung on 07/04/21.
//

import UIKit

protocol CreateGoalActionCellDelegate: class {
    func showPicker(isShow: Bool, forValue: String)
}

class CreateGoalActionCell: UITableViewCell {
    
    weak var delegate: CreateGoalActionCellDelegate?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonTarget: UIButton! {
        didSet {
            buttonTarget.layer.cornerRadius = 5.0
            buttonTarget.backgroundColor = .systemGroupedBackground
        }
    }
    
    let frequencyValue: [String] = ["monthly", "weekly"]
    var source = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonTarget.addTarget(self, action: #selector(pickerClicked), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func pickerClicked() {
        switch source {
        case "freq":
            self.delegate?.showPicker(isShow: true, forValue: source)
        case "month" :
            self.delegate?.showPicker(isShow: true, forValue: source)
        case "week":
            self.delegate?.showPicker(isShow: true, forValue: source)
        default:
            self.delegate?.showPicker(isShow: true, forValue: source)
        }
    }
    
}
