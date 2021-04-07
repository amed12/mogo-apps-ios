//
//  HomeController.swift
//  mogo-apps-ios
//
//  Created by Achmad Fathullah on 05/04/21.
//

import UIKit

class HomeController :UIViewController{
    @IBOutlet weak var LabelSaved: UILabel!
    @IBOutlet weak var MoneyGoalStatus: UILabel!
    @IBOutlet weak var AddGoalButton: MyButton!
    @IBOutlet weak var SegmentedGoal: UISegmentedControl!
    @IBOutlet weak var GoalTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setupView(){
        
    }
}
