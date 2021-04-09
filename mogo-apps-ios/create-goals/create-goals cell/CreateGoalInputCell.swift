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
    
    
    var isDate: Bool = false
    var temp = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textInput.delegate = self
        setupDatePicker()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.placeholder == "IDR 10.000.000" || textField.placeholder == "IDR 1.000.000"{
            textInput.inputView = .none
            textField.becomeFirstResponder()
        } else if textField.placeholder == "Buy a house"{
            textField.inputView = .none
        } else {
            datePicker.becomeFirstResponder()
        }
    }
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
            if textField == textInput {
                if textField.placeholder == "IDR 10.000.000" || textField.placeholder == "IDR 1.000.000"{
                        textInput.text = "IDR \(textField.text!)"
                    } else {
                        datePicker.becomeFirstResponder()
                    }
            } else {
                textField.resignFirstResponder()
            }
        }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textInput {
            if textField.placeholder == "IDR 10.000.000" || textField.placeholder == "IDR 1.000.000"{
                    textInput.text = "IDR \(textField.text!)"
                } else {
                    datePicker.becomeFirstResponder()
                }
            } else {
                textField.resignFirstResponder()
            }
            return true
        }
    
    //function date picker
    var datePicker: UIDatePicker!
    
    func setupDatePicker() {
        
        
        self.datePicker = UIDatePicker.init(frame: CGRect(x: 0, y: 0, width: self.contentView.bounds.width, height: 150))
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(self.targetDatePicker), for: .allEvents)
        
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        self.textInput.inputView = datePicker
        let toolBar:UIToolbar = UIToolbar.init(frame: CGRect(x: 0, y: 0, width: self.contentView.bounds.width, height: 44))
        let spaceButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.tapOnDone))
        toolBar.setItems([spaceButton, doneButton], animated: true)
        self.textInput.inputAccessoryView = toolBar
    }
    
    @objc func targetDatePicker(){
        
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .medium
        self.textInput.text = dateFormat.string(from: datePicker.date)
    }
    
    @objc func tapOnDone() {
        textInput.resignFirstResponder()
    }
    
    @IBAction func imageAction(_ sender: UIButton) {
        if temp == 0{
            buttonLock.setImage(UIImage(named: "Lock"), for: .normal)
            temp = 1
            
        } else if temp == 1 {
            buttonLock.setImage(UIImage(named: "Unlock"), for: .normal)
            temp = 0
        }
        
    }
}

