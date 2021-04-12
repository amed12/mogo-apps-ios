//
//  SavingHistoryScreen.swift
//  mogo-apps-ios
//
//  Created by Feby Eliana on 06/04/21.
//

import UIKit

class SavingHistoryScreen: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var SavingHistoryTable: UITableView!
    
    var transactions: [Transaction] = []
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        transactions = createArray()

        // Do any additional setup after loading the view.
    }
    
    //navigation to goal detail
    @IBAction func test(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func createArray() -> [Transaction] {
        // get data dari coredata
        let tr1 = Transaction(typeTitle:"Withdraw", date:"21 May 2021", amount: 12345)
        let tr2 = Transaction(typeTitle:"Add", date:"21 May 2021", amount: 12345)
        return [tr1,tr2]
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let transaction = transactions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavingHistoryCell") as! SavingHistoryCell
        cell.setTransaction(transaction: transaction)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.popViewController(animated: true)
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        54.0
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
