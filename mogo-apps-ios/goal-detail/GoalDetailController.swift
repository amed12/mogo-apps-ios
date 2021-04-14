//
//  GoalDetailController.swift
//  mogo-apps-ios
//
//  Created by Ivan Kelvin Trisno on 08/04/21.
//

import UIKit

protocol SecondViewControllerDelegate: class {
    func updateValue(value: Int)
}

class GoalDetailController: UIViewController , SendEditGoalToDetail {
    
    weak var delegate: SecondViewControllerDelegate?
    
    var circleProgressView: ProgressDrawer2!
    var circularViewDuration: TimeInterval = 2
    var budget: Double = 12000000
    var saving: Double = 12000000
    var result: Double = 0.0
    var popUp = 0
    var flag = -1
    var flag2 = -1
    
    var goal = GoalObject(icon: "", name: "", goalBudget: 0, targetDate: "", amountSaving: 0, totalSaving: 0, isComplete: false, savingFrequency: "", savingDate: "", savingTime: "")
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var progressPercentage: UILabel!
    @IBOutlet weak var goalImage: UIImageView!
    @IBOutlet weak var goalTitle: UILabel!
    @IBOutlet weak var moneySavedValue: UILabel!
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var withdrawView: UIView!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var withdrawButton: UIButton!
    
    @IBOutlet weak var monthlySavingView: UIView!
    @IBOutlet weak var monthlySaving: UILabel!
    
    @IBOutlet weak var goalNameView: UIView!
    @IBOutlet weak var goalNameValue: UILabel!
    @IBOutlet weak var goalBudgetView: UIView!
    @IBOutlet weak var goalBudgetValue: UILabel!
    @IBOutlet weak var targetDateView: UIView!
    @IBOutlet weak var targetDateValue: UILabel!
    
    @IBOutlet weak var savingFrequencyView: UIView!
    @IBOutlet weak var savingFrequencyValue: UILabel!
    @IBOutlet weak var savingDateView: UIView!
    @IBOutlet weak var savingDateValue: UILabel!
    @IBOutlet weak var savingTimeView: UIView!
    @IBOutlet weak var savingTimeValue: UILabel!
    
    @IBOutlet weak var savingHistoryView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addIdentifier" {
            if let destVC = segue.destination as? UINavigationController{
                let targetController = destVC.topViewController as? addWithdrawViewController
                targetController?.amountSaving = String(format: "IDR %.0f", goal.amountSaving)
//                flag = 1
            }
        } else if segue.identifier == "withdrawIdentifier" {
            if let destVC = segue.destination as? UINavigationController{
                let targetController = destVC.topViewController as? withdrawViewController
                targetController?.amountSaving = String(format: "IDR %.0f", goal.amountSaving)
//                flag = 0
            }
        }
    }
    

    
    func setUp() {
        setupView()
        progressPercentage.text = "\(String(format: "%.0f", (saving/budget) * 100))%"
        drawCircleView()
        addCornerRadius()
        addBorders()
        notificationPopUp()
    }
    
    func drawCircleView() {
        result = saving / budget
        circleProgressView = ProgressDrawer2(frame: .zero)
        circleProgressView.result = result
        circleProgressView.center = progressView.center
        circleProgressView.progressAnimation(duration: circularViewDuration)
        progressView.addSubview(circleProgressView)
    }
    
    func addCornerRadius() {
        addView.layer.cornerRadius = 15
        withdrawView.layer.cornerRadius = 15
    }
    
    func addBorders() {
        profileView.layer.borderColor = UIColor.lightGray.cgColor
        profileView.layer.borderWidth = 0.5
        
        monthlySavingView.layer.borderColor = UIColor.lightGray.cgColor
        monthlySavingView.layer.borderWidth = 0.5
        
        goalNameView.layer.borderColor = UIColor.lightGray.cgColor
        goalNameView.layer.borderWidth = 0.5
        
        goalBudgetView.layer.borderColor = UIColor.lightGray.cgColor
        goalBudgetView.layer.borderWidth = 0.5
        
        targetDateView.layer.borderColor = UIColor.lightGray.cgColor
        targetDateView.layer.borderWidth = 0.5
        
        savingFrequencyView.layer.borderColor = UIColor.lightGray.cgColor
        savingFrequencyView.layer.borderWidth = 0.5
        
        savingDateView.layer.borderColor = UIColor.lightGray.cgColor
        savingDateView.layer.borderWidth = 0.5
        
        savingTimeView.layer.borderColor = UIColor.lightGray.cgColor
        savingTimeView.layer.borderWidth = 0.5
        
        savingHistoryView.layer.borderColor = UIColor.lightGray.cgColor
        savingHistoryView.layer.borderWidth = 0.5
    }
    
    func setupView() {
        // Progress Bar
        budget = goal.goalBudget
        saving = goal.totalSaving
        
        // Goal Detail
        goalImage.image = UIImage(named: "\(goal.icon)")
        goalTitle.text = goal.name
        moneySavedValue.text = String(format: "IDR %.0f", goal.totalSaving)
        monthlySaving.text = String(format: "IDR %.0f", goal.amountSaving)
        
        // Goal Detail - Information
        goalNameValue.text = goal.name
        goalBudgetValue.text = String(format: "IDR %.0f", goal.goalBudget)
        targetDateValue.text = goal.targetDate
        
        // Goal Detail - Saving Preference
        savingFrequencyValue.text = goal.savingFrequency
        savingDateValue.text = goal.savingDate
        savingTimeValue.text = goal.savingTime
        
    }
 
    func notificationPopUp() {
        
    }
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        if result >= 1 {
            showAlert(title: "Edit Goal")
        } else {
            editMoveAlert()
        }
    }
    
    func editMoveAlert(){
        let cgVC = UIStoryboard(name: "EditGoals", bundle: nil)
        let vc = (cgVC.instantiateViewController(identifier: "editGoalID") as? EditGoalsController)!
        vc.delegate = self
        vc.editGoal = goal
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func withdrawButton(_ sender: UIButton) {
        if result >= 1 {
            showAlert2(title: "Withdraw Goal")
        }
    }
    
//    var badParameters:Bool = true
//
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        if identifier == "withdrawIdentifier" {
//            if badParameters  {
//                 showAlert2(title: "Withdraw Goal")
//                 badParameters = false
//                 return false
//            }
//        }
//        return true
//    }
    
    var badParameters:Bool = true

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "withdrawIdentifier" {
            if badParameters  {
                 showAlert2(title: "Withdraw Goal")
                 return false
            }
        }
        return true
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    func showAlert(title: String) {
        let alert = UIAlertController(title: "\(title)", message: "Changing the value of completed goal may affect the goal status.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            print("Undefined")
        }))
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { (action) in
            self.editMoveAlert()
        }))
        present(alert, animated: true)
    }
    func showAlert2(title: String) {
        let alert = UIAlertController(title: "\(title)", message: "Changing the value of completed goal may affect the goal status.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            print("Undefined")
        }))
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { (action) in
            self.performSegue(withIdentifier: "withdrawIdentifier", sender: nil)
        }))
        present(alert, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("flag2 = \(flag2)")
        if flag == 1 {
            if result >= 1 {
                self.delegate?.updateValue(value: 6)
            } else {
                self.delegate?.updateValue(value: 4)
            }
        } else if flag == 0 {
            if result < 1 && flag2 == 6 {
                self.delegate?.updateValue(value: 7)
            } else {
                self.delegate?.updateValue(value: 5)
            }
        } else if flag == -1 {
            self.delegate?.updateValue(value: 3)
        }
    }
    
    @IBAction func unwindToFirstViewController(_ sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? addWithdrawViewController {
            let newAmountString = sourceViewController.amountField.text!.components(separatedBy: " ")
            let value = Double(newAmountString[1])!
            goal.totalSaving += value
            if value != 0 {
                flag = 1
            }
            
        } else if let sourceViewController = sender.source as? withdrawViewController {
            let newAmountString = sourceViewController.amountField2.text!.components(separatedBy: " ")
            let value = Double(newAmountString[1])!
            goal.totalSaving -= value
            if value != 0 {
                flag = 0
            }
        }
        
        setUp()
    }
    
    @objc func showMiracle() {
        let slideVC = OverlayView()
        // Kirim data 0 - 4
        slideVC.flag = 4
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        self.navigationController?.present(slideVC, animated: true, completion: nil)
    }
    
//     navigation to saving history
    @IBAction func toHistory(_ sender: UIButton) {
        let shStoryboard = UIStoryboard(name: "SavingHistory", bundle: nil)
        let vc = (shStoryboard.instantiateViewController(identifier: "savingHistoryID") as? SavingHistoryScreen)!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func EditToDetail(Value: GoalObject) {
        goalImage.image = UIImage(named: Value.icon)
        goalTitle.text = Value.name
        monthlySaving.text = "\(Value.amountSaving)"
        targetDateValue.text = Value.targetDate
        savingFrequencyValue.text = Value.savingFrequency
        savingDateValue.text = Value.savingDate
        savingTimeValue.text = Value.savingTime
    }
    
}
extension GoalDetailController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
