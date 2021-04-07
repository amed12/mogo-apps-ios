//
//  ViewController.swift
//  mogo-apps-ios
//
//  Created by Achmad Fathullah on 29/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addbutton: UIButton!
    @IBOutlet weak var withdrawButton: UIButton!
    
    var sourceFrom = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func addaction(_ sender: UIButton) {
        sourceFrom = sender.tag
        showDetail(source: sender.tag)
    }
    
    @IBAction func withdrawAction(_ sender: UIButton) {
        sourceFrom = sender.tag
        showDetail(source: sender.tag)
    }
    
    func showDetail(source: Int) {
//        sourceFrom = source
        self.performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? addWithdrawViewController {
            destination.source = sourceFrom
        }
    }

}

