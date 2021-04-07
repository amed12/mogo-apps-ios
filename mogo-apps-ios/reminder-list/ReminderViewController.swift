//
//  ReminderViewController.swift
//  mogo-apps-ios
//
//  Created by Ellrica Jana on 06/04/21.
//

import UIKit



class ReminderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var reminderTable: UITableView!
    
    
    var reminderTitleArray = ["Trip to Sumba", "Lamborghini Aventador", "Trip to New Zealand"]
    var reminderDetailArray = ["Add Saving IDR 500.000", "Add Saving IDR 1.000.000", "Add Saving IDR 2.500.000"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminderTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 59.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "reminderCellIdentifier", for: indexPath) as? ReminderViewCell)!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueToDetail", sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            reminderTitleArray.remove(at: indexPath.row)
            reminderDetailArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .fade)
            tableView.endUpdates()
        }
    }
    
}
