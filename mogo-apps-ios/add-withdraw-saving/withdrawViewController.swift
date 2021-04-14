//
//  withdrawViewController.swift
//  mogo-apps-ios
//
//  Created by Paulina Maygania on 12/04/21.
//

import UIKit

class withdrawViewController: UIViewController, UITextFieldDelegate {
    
    var amountSaving = ""
    
//    @IBOutlet weak var cancelButton2: UIBarButtonItem!
//    @IBOutlet weak var addSavingTitle2: UINavigationItem!
//    @IBOutlet weak var saveButton2: UIBarButtonItem!
    
    @IBOutlet weak var monthSavingTitle2: UILabel!
    
    @IBOutlet weak var amountCellView2: UIView!
    @IBOutlet weak var amountLabel2: UILabel!
    @IBOutlet weak var amountField2: UITextField!
    
    @IBOutlet weak var dateCellView2: UIView!
    @IBOutlet weak var dateLabel2: UILabel!
    @IBOutlet weak var dateField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountField2.placeholder = amountSaving
        
        borderView()
        createDatePicker()
        clearButton()
        // Do any additional setup after loading the view.
    }


        let datePicker = UIDatePicker()
        var amount = ""
     //   var source = 0
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        }
        
   
        //bikin border
        func borderView(){
            let view = self
            
            view.amountCellView2.layer.borderColor = UIColor.lightGray.cgColor //ganti border color
            view.amountCellView2.layer.borderWidth = 0.5  //border width
        
            view.dateCellView2.layer.borderColor = UIColor.lightGray.cgColor
            view.dateCellView2.layer.borderWidth = 0.5
        }
        
        
        func createDatePicker(){
            datePicker.datePickerMode = .date
            datePicker.addTarget(self, action: #selector(self.dateChanged), for: .valueChanged)
            
            if #available(iOS 13.4, *){
                datePicker.preferredDatePickerStyle = .wheels
            }
            
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.tapOnDoneBut))
            doneButton.tintColor = UIColor(displayP3Red: 22/255, green: 121/255, blue: 110/255, alpha: 1.0)
            toolbar.setItems([spaceButton, doneButton], animated: true)
            
            dateField2.inputAccessoryView = toolbar
            
            dateField2.inputView = datePicker
        }

        
        @objc func dateChanged(){
            let dateFormat = DateFormatter()
//            dateFormat.dateStyle = .medium
            dateFormat.dateFormat = "MMM dd, yyyy"
            
            dateField2.text = dateFormat.string(from: datePicker.date)
        }
    
        @objc func tapOnDoneBut(){
            
            // then convert date to string again
            let dateFormatterResult = DateFormatter()
            dateFormatterResult.timeZone = TimeZone(abbreviation: "GMT")
            dateFormatterResult.locale = NSLocale.current
            dateFormatterResult.dateFormat = "MMM dd, yyyy"
            let stringDate = dateFormatterResult.string(from: datePicker.date)
            
            dateField2.text = stringDate
            dateField2.resignFirstResponder()

        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            if textField == amountField2 {
                amountField2.text = "IDR \(textField.text!)"
                dateField2.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
        }

        func clearButton(){
            amountField2.clearButtonMode = .always
            amountField2.clearButtonMode = .whileEditing
        }
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


