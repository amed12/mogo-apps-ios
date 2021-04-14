//
//  HomeController.swift
//  mogo-apps-ios
//
//  Created by Achmad Fathullah on 05/04/21.
//

import UIKit

class HomeController :UIViewController,UITableViewDataSource,UITableViewDelegate, SendCreateGoalController , SecondViewControllerDelegate{
    
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
        print(scenario)
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func updateValue(value: Int) {
        scenario = value
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
            case 1:
                generateDummyScenario1()
            case 2:
                generateDummyScenario2()
            case 3:
                generateDummyScenario3()
            case 4:
                generateDummyScenario4()
            case 5:
                generateDummyScenario5()
            case 6:
                generateDummyScenario6()
            case 7:
                generateDummyScenario7()
            default:
                generateDummyEmpty()
            }
        }else {
            switch scenario {
            case 0:
                generateDummyEmpty()
            case 1:
                generateDummyEmpty()
            case 2:
                generateDummyEmpty()
            case 3:
                generateDummyEmpty()
            case 4:
                generateDummyEmpty()
            case 5:
                generateDummyEmpty()
            case 6:
                generateDummyCompleteScenario6()
            case 7:
                generateDummyEmpty()
            default:
                generateDummyEmpty()
            }
        }
        goalTableView.reloadData()
    }
    
    private func setupView(){
        print("Flag 1 = \(scenario)")
        goalTableView.register(UINib(nibName: "EmptyDataGoalCell", bundle: nil), forCellReuseIdentifier: "IdGoalNoData")
        goalTableView.register(UINib(nibName: "HomeViewCell", bundle: nil), forCellReuseIdentifier: "GoalCellIdentifier")
        switch scenario {
        case 0:
            generateDummyEmpty()
        case 1:
            generateDummyScenario1()
        case 2:
            generateDummyScenario2()
        case 3:
            generateDummyScenario3()
        case 4:
            generateDummyScenario4()
            MoneyGoalStatus.text = "IDR 2.000.000"
        case 5:
            generateDummyScenario5()
            MoneyGoalStatus.text = "IDR 1.500.000"
        case 6:
            generateDummyScenario6()
            MoneyGoalStatus.text = "IDR 4.500.000"
        case 7:
            SegmentedGoal.selectedSegmentIndex = 0
            generateDummyScenario7()
            MoneyGoalStatus.text = "IDR 3.000.000"
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
                cell?.EmptyLabel.text = "You don’t have any active goal yet, let’s start by press the ‘Add Goal’ button!"
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
            let formatedValue = String(format: "%.0f", percent)
            cell?.GoalPercent.text = "\(formatedValue) %"
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
//        print(goalObject)
        let storyboard = UIStoryboard(name: "GoalDetail", bundle: nil)
        let navGD = (storyboard.instantiateViewController(identifier: "goalDetail") as? GoalDetailController)!
        navGD.flag2 = scenario
        navGD.goal = goalObject
        navGD.delegate = self
        self.navigationController?.pushViewController(navGD, animated: true)
    }
    
    func generateDummyActive()  {
        let goal1 = GoalObject(icon: "rich", name: "Trip to Labuan Bajo", goalBudget: 5000000, targetDate: "5-Mei-2022", amountSaving: 385000, totalSaving: 385000, isComplete: false, savingFrequency: "Monthly", savingDate: "14", savingTime: "12:00")
        let goal2 = GoalObject(icon: "hardShocked", name: "Trip to Labuan Bajo", goalBudget: 12000000, targetDate: "5-Mei-2022", amountSaving: 1500000, totalSaving: 385000, isComplete: false, savingFrequency: "Monthly", savingDate: "14", savingTime: "12:00")
        let goal3 = GoalObject(icon: "happy", name: "Trip to Labuan Bajo", goalBudget: 5000000, targetDate: "5-Mei-2022", amountSaving: 385000, totalSaving: 385000, isComplete: false, savingFrequency: "Monthly", savingDate: "14", savingTime: "12:00")
        listGoal = [goal1,goal2,goal3]
        isProductEmpty = false
        goalTableView.reloadData()
    }
    
    func generateDummyScenario1()  {
        let goal1 = GoalObject(icon: "rocket", name: "Trip to Labuan Bajo", goalBudget: 4500000, targetDate: "Jan 5, 2022", amountSaving: 500000, totalSaving: 0, isComplete: false, savingFrequency: "Monthly", savingDate: "28", savingTime: "12:00")
        listGoal = [goal1]
        isProductEmpty = false
        goalTableView.reloadData()
    }
    
    func generateDummyScenario2()  {
        let goal1 = GoalObject(icon: "rocket", name: "Trip to Labuan Bajo", goalBudget: 4500000, targetDate: "Jan 5, 2022", amountSaving: 500000, totalSaving: 0, isComplete: false, savingFrequency: "Monthly", savingDate: "28", savingTime: "12:00")
        let goal2 = GoalObject(icon: "iphone", name: "iPhone 12", goalBudget: 12000000, targetDate: "Dec 20, 2021", amountSaving: 1500000, totalSaving: 0, isComplete: false, savingFrequency: "Weekly", savingDate: "Sunday", savingTime: "18:00")
        listGoal = [goal1,goal2]
        isProductEmpty = false
        goalTableView.reloadData()
    }
    
    func generateDummyScenario3()  {
        let goal1 = GoalObject(icon: "rocket", name: "Trip to Labuan Bajo", goalBudget: 4500000, targetDate: "Jan 5, 2022", amountSaving: 500000, totalSaving: 0, isComplete: false, savingFrequency: "Monthly", savingDate: "28", savingTime: "12:00")
        let goal2 = GoalObject(icon: "iphone", name: "iPhone 12", goalBudget: 12000000, targetDate: "Dec 20, 2021", amountSaving: 1500000, totalSaving: 0, isComplete: false, savingFrequency: "Weekly", savingDate: "Sunday", savingTime: "18:00")
        let goal3 = GoalObject(icon: "shoes", name: "Shoes", goalBudget: 2700000, targetDate: "Jan 1, 2022", amountSaving: 300000, totalSaving: 0, isComplete: false, savingFrequency: "Monthly", savingDate: "15", savingTime: "18:00")
        listGoal = [goal1,goal2,goal3]
        isProductEmpty = false
        goalTableView.reloadData()
    }
    
    func generateDummyScenario4()  {
        let goal1 = GoalObject(icon: "rocket", name: "Trip to Labuan Bajo", goalBudget: 4500000, targetDate: "Jan 5, 2022", amountSaving: 500000, totalSaving: 2000000, isComplete: false, savingFrequency: "Monthly", savingDate: "28", savingTime: "12:00")
        let goal2 = GoalObject(icon: "iphone", name: "iPhone 12", goalBudget: 12000000, targetDate: "Dec 20, 2021", amountSaving: 1500000, totalSaving: 0, isComplete: false, savingFrequency: "Weekly", savingDate: "Sunday", savingTime: "18:00")
        let goal3 = GoalObject(icon: "shoes", name: "Shoes", goalBudget: 2700000, targetDate: "Jan 1, 2022", amountSaving: 300000, totalSaving: 0, isComplete: false, savingFrequency: "Monthly", savingDate: "15", savingTime: "18:00")
        listGoal = [goal1,goal2,goal3]
        isProductEmpty = false
        goalTableView.reloadData()
    }
    
    func generateDummyScenario5()  {
        let goal1 = GoalObject(icon: "rocket", name: "Trip to Labuan Bajo", goalBudget: 4500000, targetDate: "Jan 5, 2022", amountSaving: 500000, totalSaving: 1500000, isComplete: false, savingFrequency: "Monthly", savingDate: "28", savingTime: "12:00")
        let goal2 = GoalObject(icon: "iphone", name: "iPhone 12", goalBudget: 12000000, targetDate: "Dec 20, 2021", amountSaving: 1500000, totalSaving: 0, isComplete: false, savingFrequency: "Weekly", savingDate: "Sunday", savingTime: "18:00")
        let goal3 = GoalObject(icon: "shoes", name: "Shoes", goalBudget: 2700000, targetDate: "Jan 1, 2022", amountSaving: 300000, totalSaving: 0, isComplete: false, savingFrequency: "Monthly", savingDate: "15", savingTime: "18:00")
        listGoal = [goal1,goal2,goal3]
        isProductEmpty = false
        goalTableView.reloadData()
    }
    
    func generateDummyScenario6()  {
        let goal2 = GoalObject(icon: "iphone", name: "iPhone 12", goalBudget: 12000000, targetDate: "Dec 20, 2021", amountSaving: 1500000, totalSaving: 0, isComplete: false, savingFrequency: "Weekly", savingDate: "Sunday", savingTime: "18:00")
        let goal3 = GoalObject(icon: "shoes", name: "Shoes", goalBudget: 2700000, targetDate: "Jan 1, 2022", amountSaving: 300000, totalSaving: 0, isComplete: false, savingFrequency: "Monthly", savingDate: "15", savingTime: "18:00")
        listGoal = [goal2,goal3]
        isProductEmpty = false
        goalTableView.reloadData()
    }
    
    func generateDummyScenario7()  {
        let goal1 = GoalObject(icon: "rocket", name: "Trip to Labuan Bajo", goalBudget: 4500000, targetDate: "Jan 5, 2022", amountSaving: 500000, totalSaving: 3500000, isComplete: false, savingFrequency: "Monthly", savingDate: "28", savingTime: "12:00")
        let goal2 = GoalObject(icon: "iphone", name: "iPhone 12", goalBudget: 12000000, targetDate: "Dec 20, 2021", amountSaving: 1500000, totalSaving: 0, isComplete: false, savingFrequency: "Weekly", savingDate: "Sunday", savingTime: "18:00")
        let goal3 = GoalObject(icon: "shoes", name: "Shoes", goalBudget: 2700000, targetDate: "Jan 1, 2022", amountSaving: 300000, totalSaving: 0, isComplete: false, savingFrequency: "Monthly", savingDate: "15", savingTime: "18:00")
        listGoal = [goal1,goal2,goal3]
        isProductEmpty = false
        goalTableView.reloadData()
    }
    
    func generateDummyCompleteScenario6()  {
        let goal1 = GoalObject(icon: "rocket", name: "Trip to Labuan Bajo", goalBudget: 4500000, targetDate: "Jan 5, 2022", amountSaving: 500000, totalSaving: 4500000, isComplete: true, savingFrequency: "Monthly", savingDate: "28", savingTime: "12:00")
        listGoal = [goal1]
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
    
    @IBAction func createGoal(_ sender: UIButton) {
        let cgVC = UIStoryboard(name: "CreateGoals", bundle: nil)
        let vc = (cgVC.instantiateViewController(identifier: "createGoalID") as? CreateGoalController)!
        vc.delagate = self
        vc.checkScenario = scenario
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func CreateGoalToHome(Value: Int) {
        scenario = Value
        setupView()
    }
}
