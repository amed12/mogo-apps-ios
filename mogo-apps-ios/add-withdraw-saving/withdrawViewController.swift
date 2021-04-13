//
//  withdrawViewController.swift
//  mogo-apps-ios
//
//  Created by Paulina Maygania on 12/04/21.
//

import UIKit

class withdrawViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var cancelButton2: UIBarButtonItem!
    @IBOutlet weak var addSavingTitle2: UINavigationItem!
    @IBOutlet weak var saveButton2: UIBarButtonItem!
    
    @IBOutlet weak var monthSavingTitle2: UILabel!
    
    @IBOutlet weak var amountCellView2: UIView!
    @IBOutlet weak var amountLabel2: UILabel!
    @IBOutlet weak var amountField2: UITextField!
    
    @IBOutlet weak var dateCellView2: UIView!
    @IBOutlet weak var dateLabel2: UILabel!
    @IBOutlet weak var dateField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            datePicker.addTarget(self, action: #selector(self.dateChanged), for: .allEvents)
            
            
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
            dateFormat.dateStyle = .medium
            
            dateField2.text = dateFormat.string(from: datePicker.date)
            
        }
            
        
        @objc func tapOnDoneBut(){
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
        
//        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//            if textField == amountField2 {
//                amountField2.text = "IDR \(textField.text!)"
//                dateField2.becomeFirstResponder()
//            } else {
//                textField.resignFirstResponder()
//            }
//            return true
//        }
        
        func clearButton(){
            amountField2.clearButtonMode = .always
            amountField2.clearButtonMode = .whileEditing
        }
        
        @IBAction func saveButtonAction2(_ sender: UIBarButtonItem) {
            print(amountField2.text!)
            print(dateField2.text!)
        }
       
    /*
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if !textField.text!.isEmpty {
                let tempString = string
                var prevString = textField.text!
                let newString: () = prevString.append(tempString)
                textField.text = "IDR \(newString)"
            }
            return true
        }
         */
        
        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

        
        
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


