//
//  HomeController.swift
//  mogo-apps-ios
//
//  Created by Achmad Fathullah on 05/04/21.
//

import UIKit

class HomeController :UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var LabelSaved: UILabel!
    @IBOutlet weak var MoneyGoalStatus: UILabel!
    @IBOutlet weak var AddGoalButton: MyButton!
    @IBOutlet weak var SegmentedGoal: UISegmentedControl!
    @IBOutlet weak var goalTableView: UITableView!
    var circleProgressView: ProgressDrawer!
    var circularViewDuration: TimeInterval = 2
    var productArray = ["iPhone X", "iPhone 11", "iPhone SE", "iPhone 12", "iPhone 6+", "iPhone 6", "iPhone 8", "iPhone 6 Plus", "iPhone 11 Pro", "iPhone 11 Pro Max", "iPhone 12 Pro", "iPhone 12 Pro Max"]
    struct DataGoal {
        var imageGoal : String
        var titleGoal : String
        var dateGoal : String
        var budgetGoal : Int
    }
    var segmentActive = 0
    var isProductEmpty = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        segmentActive = sender.selectedSegmentIndex
        goalTableView.reloadData()
    }
    
    private func setupView(){
        goalTableView.register(UINib(nibName: "EmptyDataGoalCell", bundle: nil), forCellReuseIdentifier: "IdGoalNoData")
        goalTableView.register(UINib(nibName: "HomeViewCell", bundle: nil), forCellReuseIdentifier: "GoalCellIdentifier")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return segmentActive == 0 ? 1 : 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return segmentActive == 0 ? 230 : 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if segmentActive == 0 {
            let cell = goalTableView.dequeueReusableCell(withIdentifier: "IdGoalNoData", for: indexPath) as? EmptyDataGoalCell
            return cell!
        }else{
            let cell = goalTableView.dequeueReusableCell(withIdentifier: "GoalCellIdentifier", for: indexPath) as? HomeViewCell
            let dataGoalDummy = DataGoal(imageGoal: "MoneyGoal", titleGoal: "Trip Bali", dateGoal: "12/02/2020", budgetGoal: 23000)
            cell?.GoalTitle.text = "\(dataGoalDummy.titleGoal)"
            cell?.GoalDate.text = "\(dataGoalDummy.dateGoal)"
            cell?.GoalBudget.text = "\(dataGoalDummy.budgetGoal)"
            cell?.progressGoal.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            cell?.progressGoal.center = (cell?.progressGoal.center)!
            cell?.progressGoal.progressAnimation(toValue: 0.5, duration: circularViewDuration)
            return cell!
            
        }
    }
}
