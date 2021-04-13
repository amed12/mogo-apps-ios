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
    var listGoal :[GoalObject] = []
    var segmentActive = 0
    var isProductEmpty = false
    var scenario = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func unwindToFirstViewController(_ sender: UIStoryboardSegue) {
        }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        segmentActive = sender.selectedSegmentIndex
        if segmentActive == 0 {
            switch scenario {
            case 0:
                generateDummyEmpty()
            default:
                generateDummyEmpty()
            }
        }else {
            switch scenario {
            case 0:
                generateDummyEmpty()
            default:
                generateDummyEmpty()
            }
        }
        goalTableView.reloadData()
    }
    
    private func setupView(){
        goalTableView.register(UINib(nibName: "EmptyDataGoalCell", bundle: nil), forCellReuseIdentifier: "IdGoalNoData")
        goalTableView.register(UINib(nibName: "HomeViewCell", bundle: nil), forCellReuseIdentifier: "GoalCellIdentifier")
        switch scenario {
        case 0:
            generateDummyEmpty()
        default:
            generateDummyActive()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isProductEmpty ? 1 : listGoal.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return listGoal.count == 0 && isProductEmpty ? 230 : 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isProductEmpty {
            let cell = goalTableView.dequeueReusableCell(withIdentifier: "IdGoalNoData", for: indexPath) as? EmptyDataGoalCell
            if segmentActive == 1 {
                cell?.EmptyLabel.text = "You don’t have any completed goal yet. Keep saving to complete your active goal!"
            } else{
                cell?.EmptyLabel.text = "You don’t have any active goal yet, let’s start by press the ‘Add Goal’ button!  "
            }
            return cell!
        }else{
            let cell = goalTableView.dequeueReusableCell(withIdentifier: "GoalCellIdentifier", for: indexPath) as? HomeViewCell
            let data = listGoal[indexPath.row]
            cell?.GoalTitle.text = "\(data.name)"
            cell?.GoalDate.text = "\(data.targetDate)"
            cell?.GoalBudget.text = "\(data.goalBudget)"
            cell?.GoalImage.image = UIImage(named: data.icon)
            var result: Double = 0.0
            var percent: Double = 0.0
            percent = Double(data.totalSaving) / Double(data.goalBudget) * 100.0
            result = Double(data.totalSaving) / Double(data.goalBudget)
            cell?.GoalPercent.text = "\(percent) %"
            cell?.progressGoal.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            cell?.progressGoal.center = (cell?.progressGoal.center)!
            cell?.progressGoal.progressAnimation(toValue: result, duration: circularViewDuration)
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !listGoal.isEmpty {
            navigateToDetailGoal(goalObject: listGoal[indexPath.row])
        }
    }
    
    private func navigateToDetailGoal(goalObject: GoalObject) {
        print(goalObject)
    }
    
    func generateDummyActive()  {
        let goal1 = GoalObject(icon: "rich", name: "Trip to Labuan Bajo", goalBudget: 5000000, targetDate: "5-Mei-2022", amountSaving: 385000, totalSaving: 385000, isComplete: false, savingFrequency: "Monthly", savingDate: "14", savingTime: "12:00")
        let goal2 = GoalObject(icon: "hardShocked", name: "Trip to Labuan Bajo", goalBudget: 12000000, targetDate: "5-Mei-2022", amountSaving: 1500000, totalSaving: 385000, isComplete: false, savingFrequency: "Monthly", savingDate: "14", savingTime: "12:00")
        let goal3 = GoalObject(icon: "happy", name: "Trip to Labuan Bajo", goalBudget: 5000000, targetDate: "5-Mei-2022", amountSaving: 385000, totalSaving: 385000, isComplete: false, savingFrequency: "Monthly", savingDate: "14", savingTime: "12:00")
        listGoal = [goal1,goal2,goal3]
        isProductEmpty = false
        goalTableView.reloadData()
    }
    
    func generateDummyComplete()  {
        let goal1 = GoalObject(icon: "hardShocked", name: "Trip to Labuan Bajo", goalBudget: 5000000, targetDate: "5-Mei-2022", amountSaving: 385000, totalSaving: 385000, isComplete: false, savingFrequency: "Monthly", savingDate: "14", savingTime: "12:00")
        let goal2 = GoalObject(icon: "skull", name: "Trip to Labuan Bajo", goalBudget: 5000000, targetDate: "5-Mei-2022", amountSaving: 385000, totalSaving: 385000, isComplete: false, savingFrequency: "Monthly", savingDate: "14", savingTime: "12:00")
        listGoal = [goal1,goal2]
        isProductEmpty = false
        goalTableView.reloadData()
    }
    
    func generateDummyEmpty()  {
        listGoal = []
        isProductEmpty = true
        goalTableView.reloadData()
    }
}
