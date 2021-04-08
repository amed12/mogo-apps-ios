//
//  CreateGoalInputCell.swift
//  mogo-apps-ios
//
//  Created by Carlos Gamaliel Manurung on 07/04/21.
//

import UIKit

class CreateGoalInputCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var buttonLock: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
            if textField == textInput {
    //            amountField.text = "IDR \(textField.text!)"
//                dateField.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == textInput {
                if textField.placeholder == "IDR 10.000.000" && textField.placeholder == "IDR 1.000.000"{
                    textInput.text = "IDR \(textField.text!)"
                }
//                dateField.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
            return true
        }
    
}
