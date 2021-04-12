//
//  addWithdrawViewController.swift
//  mogo-apps-ios
//
//  Created by Paulina Maygania on 07/04/21.
//

import UIKit

class addWithdrawViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var addSavingTitle: UINavigationItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var monthSavingTitle: UILabel!
    
    @IBOutlet weak var amountCellView: UIView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amountField: UITextField!
    
    @IBOutlet weak var dateCellView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateField: UITextField!
    
    
    let datePicker = UIDatePicker()
    var amount = ""
 //   var source = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //       self.title = source == 0 ? "Add" : "Withdraw"

        borderView()
        createDatePicker()
        clearButton()
        // Do any additional setup after loading the view.
    }
    
    //bikin border
    func borderView(){
        let view = self
        view.amountCellView.layer.borderColor = UIColor.lightGray.cgColor
        view.amountCellView.layer.borderWidth = 0.5
        view.dateCellView.layer.borderColor = UIColor.lightGray.cgColor
        view.dateCellView.layer.borderWidth = 0.5
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
        
        dateField.inputAccessoryView = toolbar
        
        dateField.inputView = datePicker
    }

    
    @objc func dateChanged(){
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .medium
        
        dateField.text = dateFormat.string(from: datePicker.date)
        
    }
        
    
    @objc func tapOnDoneBut(){
        dateField.resignFirstResponder()
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == amountField {
            print("Hello World")
            amountField.text = "IDR \(textField.text!)"
            dateField.becomeFirstResponder()
        } else {
            print("World Hello")
            textField.resignFirstResponder()
        }
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == amountField {
//            amountField.text = "IDR \(textField.text!)"
//            dateField.becomeFirstResponder()
//        } else {
//            textField.resignFirstResponder()
//        }
//        return true
//    }
    
    func clearButton(){
        amountField.clearButtonMode = .always
        amountField.clearButtonMode = .whileEditing
    }
    
    @IBAction func saveButtonAction(_ sender: UIBarButtonItem) {
        print(amountField.text!)
        print(dateField.text!)
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
