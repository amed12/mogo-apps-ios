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
//        if typeTitle.text == "Withdraw"{
//            typeTitle.textColor = UIColor(red: 255, green: 69, blue: 58, alpha: 1.00)
//        } else {
//            typeTitle.textColor = UIColor(red: 22, green: 121, blue: 110, alpha: 1.00)
//        }
        date.text = transaction.date
        amount.text = String(transaction.amount)
    }

}


