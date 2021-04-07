//
//  CreateGoalController.swift
//  mogo-apps-ios
//
//  Created by Carlos Gamaliel Manurung on 07/04/21.
//

import UIKit

class CreateGoalController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
        
    @IBOutlet weak var tableCreateGoals: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        tableCreateGoals.register(UINib(nibName: "CreateGoalHeaderCell", bundle: nil), forCellReuseIdentifier: "createGoalHeaderId")
        tableCreateGoals.register(UINib(nibName: "CreateGoalInputCell", bundle: nil), forCellReuseIdentifier: "createGoalInputId")
        tableCreateGoals.register(UINib(nibName: "CreateGoalActionCell", bundle: nil), forCellReuseIdentifier: "createGoalActionIdentifier")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return UIView()
        case 1:
            let bgView = UIView(frame: CGRect(x: 0, y: 0, width: tableCreateGoals.frame.size.width, height: 33))
            bgView.backgroundColor = .systemGroupedBackground
            let sectionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: bgView.frame.size.width, height: bgView.frame.size.height))
            sectionLabel.text = "GOAL INFORMATION"
            sectionLabel.font = .systemFont(ofSize: 16)
            sectionLabel.textColor = .lightGray
            bgView.addSubview(sectionLabel)
            return bgView
        case 2:
            let bgView = UIView(frame: CGRect(x: 0, y: 0, width: tableCreateGoals.frame.size.width, height: 33))
            bgView.backgroundColor = .systemGroupedBackground

            return bgView
        case 3:
            let bgView = UIView(frame: CGRect(x: 0, y: 0, width: tableCreateGoals.frame.size.width, height: 33))
            bgView.backgroundColor = .systemGroupedBackground
            let sectionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: bgView.frame.size.width, height: bgView.frame.size.height))
            sectionLabel.text = "SAVING PREFERENCE"
            sectionLabel.font = .systemFont(ofSize: 16)
            sectionLabel.textColor = .lightGray
            bgView.addSubview(sectionLabel)
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
            return 44
        case 2:
            return 22
        case 3:
            return 44
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
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 1:
            return 55
        case 2:
            return 55
        case 3:
            return 55
        default:
            return 55
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let Cell = (tableView.dequeueReusableCell(withIdentifier: "createGoalHeaderId", for: indexPath) as? CreateGoalHeaderCell)!
            Cell.buttonIcon.addTarget(self, action: #selector(openIconGallery), for: .touchUpInside)
            return Cell
        case 1:
            let Cell = (tableView.dequeueReusableCell(withIdentifier: "createGoalInputId", for: indexPath) as? CreateGoalInputCell)!
            Cell.titleLabel.text = "Goal Name"
            return Cell
        case 2:
            let Cell = (tableView.dequeueReusableCell(withIdentifier: "createGoalInputId", for: indexPath) as? CreateGoalInputCell)!
            switch indexPath.row {
            case 0:
                Cell.titleLabel.text = "Goal Budget"
            case 1:
                Cell.titleLabel.text = "Target Date"
            case 2:
                Cell.titleLabel.text = "Montly Saving"
            default:
                Cell.titleLabel.text = "Goal Name"
            }
            return Cell
        case 3:
            let Cell = (tableView.dequeueReusableCell(withIdentifier: "createGoalActionIdentifier", for: indexPath) as? CreateGoalActionCell)!
            switch indexPath.row {
            case 0:
                Cell.titleLabel.text = "Saving Frequence"
                Cell.buttonTarget.addTarget(self, action: #selector(freqAction), for: .touchUpInside)
            case 1:
                Cell.titleLabel.text = "Saving Date"
                Cell.buttonTarget.addTarget(self, action: #selector(dateAction), for: .touchUpInside)
            case 2:
                Cell.titleLabel.text = "Saving Time"
                Cell.buttonTarget.addTarget(self, action: #selector(timeAction), for: .touchUpInside)
            default:
                Cell.titleLabel.text = "Goal Name"
            }
            return Cell
        default:
            let Cell = (tableView.dequeueReusableCell(withIdentifier: "createGoalInputId", for: indexPath) as? CreateGoalInputCell)!
            return Cell
        }
     }
    
    
    @objc func freqAction() {
        print("A")
    }
    
    @objc func dateAction() {
        print("B")
    }
    
    @objc func timeAction() {
        print("C")
    }
    
    @objc func openIconGallery() {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
