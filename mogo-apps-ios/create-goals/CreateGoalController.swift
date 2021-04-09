//
//  CreateGoalController.swift
//  mogo-apps-ios
//
//  Created by Carlos Gamaliel Manurung on 07/04/21.
//

import UIKit


class CreateGoalController: UIViewController, UITableViewDelegate, UITableViewDataSource, CreateGoalHeaderCellDelegate, UIPickerViewDelegate, UIPickerViewDataSource, CreateGoalActionCellDelegate  {
    
        
    @IBOutlet weak var tableCreateGoals: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var frequencyArray = ["Monthly", "Weekly"]
    var monthArray = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"]
    var weekArray = ["senin","selasa","rabu","kamis","jumat","sabtu","mingu"]
    
    var datePicker: UIDatePicker!
    var isPickerHide = true
    var isMonth = false
    var isfreq = false
    var isWeek = false
    var freqSelection = ""
    var monthSelection = ""
    var weekSelection = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupPicker(isPickerShow: isPickerHide)
        self.tableCreateGoals.separatorColor = .darkGray
    }
    
    
    private func setupView() {
        tableCreateGoals.register(UINib(nibName: "CreateGoalHeaderCell", bundle: nil), forCellReuseIdentifier: "createGoalHeaderId")
        tableCreateGoals.register(UINib(nibName: "CreateGoalInputCell", bundle: nil), forCellReuseIdentifier: "createGoalInputId")
        tableCreateGoals.register(UINib(nibName: "CreateGoalActionCell", bundle: nil), forCellReuseIdentifier: "createGoalActionIdentifier")
        tableCreateGoals.register(UINib(nibName: "ButtonFooterCell", bundle: nil), forCellReuseIdentifier: "buttonFooterIdentifier")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let bgView = UIView(frame: CGRect(x: 0, y: 0, width: tableCreateGoals.frame.size.width, height: 22))
//            bgView.backgroundColor = .systemGroupedBackground
            return bgView
        case 1:
            let bgView = UIView(frame: CGRect(x: 0, y: 0, width: tableCreateGoals.frame.size.width, height: 33))
            bgView.backgroundColor = .systemGroupedBackground
            let sectionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: bgView.frame.size.width, height: bgView.frame.size.height))
            sectionLabel.text = "   GOAL INFORMATION"
            sectionLabel.font = .systemFont(ofSize: 13)
            sectionLabel.textColor = .lightGray
            bgView.addSubview(sectionLabel)
            return bgView
        case 2:
            let bgView = UIView(frame: CGRect(x: 0, y: 0, width: tableCreateGoals.frame.size.width, height: 22))
            bgView.backgroundColor = .systemGroupedBackground
            return bgView
        case 3:
            let bgView = UIView(frame: CGRect(x: 0, y: 0, width: tableCreateGoals.frame.size.width, height: 33))
            bgView.backgroundColor = .systemGroupedBackground
            let sectionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: bgView.frame.size.width, height: bgView.frame.size.height))
            sectionLabel.text = "   SAVING PREFERENCE"
            sectionLabel.font = .systemFont(ofSize: 13)
            sectionLabel.textColor = .lightGray
            bgView.addSubview(sectionLabel)
            return bgView
        case 4:
            let bgView = UIView(frame: CGRect(x: 0, y: 0, width: tableCreateGoals.frame.size.width, height: 22))
            bgView.backgroundColor = .systemGroupedBackground
            
            return bgView

        default:
            let bgView = UIView(frame: CGRect(x: 0, y: 0, width: tableCreateGoals.frame.size.width, height: 33))
            bgView.backgroundColor = .systemGroupedBackground
            
            return bgView
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 22
        case 1:
            return 33
        case 2:
            return 22
        case 3:
            return 30
        case 4:
            return 22
        default:
            return 22
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 3
        case 3:
            return 3
        case 4:
            return 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 1:
            return 44
        case 2:
            return 44
        case 3:
            return 44
        case 4:
            return 44
        default:
            return 44
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let Cell = (tableView.dequeueReusableCell(withIdentifier: "createGoalHeaderId", for: indexPath) as? CreateGoalHeaderCell)!
            Cell.delegate = self
            return Cell
        case 1:
            let Cell = (tableView.dequeueReusableCell(withIdentifier: "createGoalInputId", for: indexPath) as? CreateGoalInputCell)!
            Cell.titleLabel.text = "Goal Name"
            Cell.textInput.placeholder = "Buy a house"
            Cell.buttonLock.isHidden = true
            return Cell
        case 2:
            let Cell = (tableView.dequeueReusableCell(withIdentifier: "createGoalInputId", for: indexPath) as? CreateGoalInputCell)!
            switch indexPath.row {
            case 0:
                Cell.titleLabel.text = "Goal Budget"
                Cell.textInput.placeholder = "IDR 10.000.000"
            case 1:
                Cell.titleLabel.text = "Target Date"
                Cell.textInput.placeholder = "1 January 2021"
                Cell.isDate = true
            case 2:
                Cell.titleLabel.text = "Montly Saving"
                Cell.textInput.placeholder = "IDR 1.000.000"
            default:
                Cell.titleLabel.text = "Goal Name"
            }
            return Cell
        case 3:
            let Cell = (tableView.dequeueReusableCell(withIdentifier: "createGoalActionIdentifier", for: indexPath) as? CreateGoalActionCell)!
            Cell.delegate = self
            switch indexPath.row {
            case 0:
                Cell.titleLabel.text = "Saving Frequency"
                Cell.buttonTarget.setTitle(freqSelection, for: .normal)
                Cell.source = "freq"
                Cell.indexSelect = indexPath.row
            case 1:
                Cell.titleLabel.text = "Saving Date"
                Cell.buttonTarget.setTitle(isMonth ? monthSelection : weekSelection, for: .normal)
                Cell.source = isMonth ? "month" : "week"
                Cell.indexSelect = indexPath.row
            case 2:
                Cell.titleLabel.text = "Saving Time"
            default:
                Cell.titleLabel.text = "Goal Name"
            }
            return Cell
        case 4:
            let Cell = (tableView.dequeueReusableCell(withIdentifier: "buttonFooterIdentifier", for: indexPath) as? ButtonFooterCell)!
            Cell.buttonDelete.isHidden = true
            return Cell
        default:
            let Cell = (tableView.dequeueReusableCell(withIdentifier: "createGoalInputId", for: indexPath) as? CreateGoalInputCell)!
            return Cell
        }
     }
    
    private func setupPicker(isPickerShow: Bool) {
        pickerView.isHidden = isPickerShow
        pickerView.reloadAllComponents()
    }
    
    func showPicker(isShow: Bool, forValue: String) {
        print(forValue)
        if forValue == "month" {
            isMonth = true
            isfreq = false
            isWeek = false
        } else if forValue == "week" {
            isMonth = false
            isWeek = true
            isfreq = false
        } else {
            isfreq = true
            isMonth = false
            isWeek = false
        }
        setupPicker(isPickerShow: isShow ? false : true)
    }
    
    func openCollectionGallery(status: Bool) {
        let storyboardDestination = UIStoryboard(name: "Icon", bundle: nil)
        guard let destinationVC = storyboardDestination.instantiateInitialViewController() else { return }
        self.present(destinationVC, animated: true, completion: nil)
    }

    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print("numberOfRowsInComponent ismonth:\(isMonth), isfreq:\(isfreq)")
        if isMonth {
            return monthArray.count
        } else if isWeek {
            return weekArray.count
        } else {
            return frequencyArray.count
        }
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("titleForRow ismonth:\(isMonth), isfreq:\(isfreq)")
        if isMonth {
            return monthArray[row]
        } else if isWeek {
            return weekArray[row]
        } else {
            return frequencyArray[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("didSelectRow ismonth:\(isMonth), isfreq:\(isfreq)")
        if isMonth {
            monthSelection = monthArray[row]
        } else if isWeek {
            weekSelection = weekArray[row]
        } else {
            freqSelection = frequencyArray[row]
            if frequencyArray[row] == "Monthly" {
                isMonth = true
                isfreq = false
                isWeek = false
            } else {
                isMonth = false
                isfreq = false
                isWeek = true
            }
        }
        setupPicker(isPickerShow: true)
        tableCreateGoals.reloadData()
    }

    func setupDatePicker(){
        
        self.datePicker = UIDatePicker.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.height, height: 150))
        datePicker.datePickerMode = .time
        datePicker.addTarget(self, action: #selector(targetDateTime), for: .allEvents)
        
        
    }

    
    @objc func targetDateTime() {
        
    }
    
    
    //    var datePicker: UIDatePicker!
    //
    //    func setupDatePicker() {
    //
    //
    //        self.datePicker = UIDatePicker.init(frame: CGRect(x: 0, y: 0, width: self.contentView.bounds.width, height: 150))
    //        datePicker.datePickerMode = .time
    //        datePicker.addTarget(self, action: #selector(self.targetDatePicker), for: .allEvents)
    //
    //        if #available(iOS 13.4, *) {
    //            datePicker.preferredDatePickerStyle = .wheels
    //        }
    //        self.textInput.inputView = datePicker
    //        let toolBar:UIToolbar = UIToolbar.init(frame: CGRect(x: 0, y: 0, width: self.contentView.bounds.width, height: 44))
    //        let spaceButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    //        let doneButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.tapOnDone))
    //        toolBar.setItems([spaceButton, doneButton], animated: true)
    //        self.textInput.inputAccessoryView = toolBar
    //    }
    //
    //    @objc func targetDatePicker(){
    //
    //        let dateFormat = DateFormatter()
    //        dateFormat.dateStyle = .medium
    //        self.textInput.text = dateFormat.string(from: datePicker.date)
    //    }
    //
    //    @objc func tapOnDone() {
    //        textInput.resignFirstResponder()
    //    }
}
