//
//  ReminderViewController.swift
//  mogo-apps-ios
//
//  Created by Ellrica Jana on 06/04/21.
//

import UIKit



class ReminderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var reminderTable: UITableView!
    
    var reminders: [Reminder] = []
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Saving Reminder"
        reminders = createArray()
//        showMiracle()
    }
    
    @IBAction func unwindToFirstViewController(_ sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? addWithdrawViewController {
            let newAmountString = sourceViewController.amountField.text!.components(separatedBy: " ")
            let amount = Double(newAmountString[1])!
            DispatchQueue.main.async {
                if amount == 300000.0{
                    self.showMiracle(value: 0,descriptionDialog: "1 January 2022")
                }else if amount == 200000.0{
                    self.showMiracle(value: 1,descriptionDialog: "IDR 312.500/month")
                }else if amount == 500000.0{
                    self.showMiracle(value: 2,descriptionDialog: "5 December 2021")
                }
                
            }
        }
    }
    
    func showMiracle(value :Int, descriptionDialog:String) {
        let slideVC = OverlayView()
        // Kirim data 0 - 4
        slideVC.flag = value
        slideVC.a = "Shoes"
        slideVC.b = descriptionDialog
        slideVC.c = "200.000"
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        self.present(slideVC, animated: true, completion: nil)
    }
    
    func createArray() -> [Reminder] {
        
        let reminder1 = Reminder(reminderTitle: "Shoes", reminderDetail: "Add Saving IDR 300.000")
        return [reminder1]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 59.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reminder = reminders[indexPath.row]
        let cell = (tableView.dequeueReusableCell(withIdentifier: "reminderCellIdentifier", for: indexPath) as? ReminderViewCell)!
        cell.setReminder(reminder: reminder)
        return cell
    
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "segueAddWithdraw", sender: self)
//    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            reminders.remove(at: indexPath.row)
          //reminderDetailArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .fade)
            tableView.endUpdates()
        }
    }
}
extension ReminderViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
