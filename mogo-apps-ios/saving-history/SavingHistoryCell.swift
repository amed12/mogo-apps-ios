//
//  SavingHistoryCell.swift
//  mogo-apps-ios
//
//  Created by Feby Eliana on 06/04/21.
//

import UIKit

class SavingHistoryCell: UITableViewCell {

    @IBOutlet weak var typeTitle: UILabel! 
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    func setTransaction (transaction:Transaction){
        typeTitle.text = transaction.typeTitle
        if transaction.typeTitle == "Withdraw"{
            typeTitle.textColor = UIColor(red: 255/255, green: 69/255, blue: 58/255, alpha: 1.0)
        } else {
            typeTitle.textColor = UIColor(red: 22/255, green: 121/255, blue: 110/255, alpha: 1.00)
        }
        date.text = transaction.date
        amount.text = "IDR "+String(transaction.amount)
    }

}


