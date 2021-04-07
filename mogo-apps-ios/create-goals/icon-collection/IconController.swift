//
//  IconController.swift
//  mogo-apps-ios
//
//  Created by Carlos Gamaliel Manurung on 07/04/21.
//

import UIKit

class IconController: UIViewController {

    @IBOutlet weak var iconCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        iconCollection.register(UINib(nibName: <#T##String#>, bundle: <#T##Bundle?#>), forCellWithReuseIdentifier: <#T##String#>)
    }
    

}
