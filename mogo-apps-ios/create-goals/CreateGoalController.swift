//
//  CreateGoalController.swift
//  mogo-apps-ios
//
//  Created by Carlos Gamaliel Manurung on 07/04/21.
//

import UIKit

class CreateGoalController: UIViewController, UITableViewDelegate, UITableViewDataSource, CreateGoalHeaderCellDelegate  {
        
    @IBOutlet weak var tableCreateGoals: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableCreateGoals.separatorColor = .black
        setupView()
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
            let bgView = UIView(frame: CGRect(x: 0, y: 0, width: tableCreateGoals.frame.size.width, height: 33))
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
            return 33
//        case 3:
//            return 33
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
//        case 3:
//            return 1
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
//        case 3:
//            return 20
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
                Cell.textInput.addTarget(self, action: #selector(targetAction), for: .touchUpInside)
            case 2:
                Cell.titleLabel.text = "Montly Saving"
                Cell.textInput.placeholder = "IDR 1.000.000"
            default:
                Cell.titleLabel.text = "Goal Name"
            }
            return Cell
        case 3:
            let Cell = (tableView.dequeueReusableCell(withIdentifier: "createGoalActionIdentifier", for: indexPath) as? CreateGoalActionCell)!
            switch indexPath.row {
            case 0:
                Cell.titleLabel.text = "Saving Frequency"
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
        case 4:
            let Cell = (tableView.dequeueReusableCell(withIdentifier: "buttonFooterIdentifier", for: indexPath) as? ButtonFooterCell)!
            return Cell
            
        default:
            let Cell = (tableView.dequeueReusableCell(withIdentifier: "createGoalInputId", for: indexPath) as? CreateGoalInputCell)!
            return Cell
        }
     }
    
    
    
    @objc func targetAction() {
        print("A")
    }
    
    @objc func freqAction() {
        print("B")
    }
    
    @objc func dateAction() {
        print("C")
    }
    
    @objc func timeAction() {
        print("D")
    }
    
    
    func openCollectionGallery(status: Bool) {
        let storyboardDestination = UIStoryboard(name: "Icon", bundle: nil)
        guard let destinationVC = storyboardDestination.instantiateInitialViewController() else { return }
        self.present(destinationVC, animated: true, completion: nil)
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
