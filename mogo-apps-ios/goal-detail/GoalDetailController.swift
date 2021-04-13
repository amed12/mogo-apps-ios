//
//  GoalDetailController.swift
//  mogo-apps-ios
//
//  Created by Ivan Kelvin Trisno on 08/04/21.
//

import UIKit

class GoalDetailController: UIViewController {
    var circleProgressView: ProgressDrawer2!
    var circularViewDuration: TimeInterval = 2
    var budget: Double = 12000000
    var saving: Double = 12000000
    var result: Double = 0.0
    
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
        
//        addButton.addTarget(self, action: #selector(addPage), for: .touchUpInside)
//        withdrawButton.addTarget(self, action: #selector(withdrawPage), for: .touchUpInside)
        
        setupView()
        progressPercentage.text = "\(String(format: "%.0f", (saving/budget) * 100))%"
        drawCircleView()
        addCornerRadius()
        addBorders()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.identifier)
        
        if segue.destination is addWithdrawViewController {
            print("Hello World")
            let vc = segue.destination as? addWithdrawViewController
            vc?.amountField.placeholder = String(format: "IDR %.0f", goal.amountSaving)
            vc?.dateField.placeholder = goal.targetDate
       
        } else if segue.destination is withdrawViewController {
            print("World Hello")
           let vc = segue.destination as? withdrawViewController
           vc?.amountField2.placeholder = String(format: "IDR %.0f", goal.amountSaving)
           vc?.dateField2.placeholder = goal.targetDate
       }
    }

//    @objc func addPage() {
//        let storyboard = UIStoryboard(name: "addWithdrawStoryboard", bundle: nil)
//        let navVC = (storyboard.instantiateViewController(identifier: "addSaving") as? addWithdrawViewController)!
//        self.present(navVC, animated: true, completion: nil)
//    }
//
//    @objc func withdrawPage() {
//        let storyboard = UIStoryboard(name: "withdraw", bundle: nil)
//        let navVC = (storyboard.instantiateViewController(identifier: "withdrawSaving") as? withdrawViewController)!
//        self.present(navVC, animated: true, completion: nil)
//    }
    
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
 
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        if result >= 1 {
            showAlert(title: "Edit Goal")
        }
    }
    
    
    @IBAction func withdrawButton(_ sender: UIButton) {
        if result >= 1 {
            showAlert(title: "Withdraw Goal")
        }
    }
    
    
    func showAlert(title: String) {
        let alert = UIAlertController(title: "\(title)", message: "Changing the value of completed goal may affect the goal status.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            print("Undefined")
        }))
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { (action) in
            print("Undefined")
        }))
        present(alert, animated: true)
    }
    

    
    
    @IBAction func unwindToFirstViewController(_ sender: UIStoryboardSegue) {
        
    }
    
//     navigation to saving history
    @IBAction func toHistory(_ sender: UIButton) {
        let shStoryboard = UIStoryboard(name: "SavingHistory", bundle: nil)
        let vc = (shStoryboard.instantiateViewController(identifier: "savingHistoryID") as? SavingHistoryScreen)!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
