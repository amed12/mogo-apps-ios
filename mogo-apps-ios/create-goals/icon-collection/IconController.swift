//
//  IconController.swift
//  mogo-apps-ios
//
//  Created by Carlos Gamaliel Manurung on 07/04/21.
//

import UIKit

class IconController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var iconCollection: UICollectionView!
    
    var ImageArray = ["cool", "embarrassed", "happy_hands", "happy", "hardShocked", "rich", "sad", "shocked", "skull"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollection()
    }
    
    private func setupCollection() {
        iconCollection.register(UINib(nibName: "IconCollectionCell", bundle: nil), forCellWithReuseIdentifier: "iconCollectionIdentifier")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = (iconCollection.dequeueReusableCell(withReuseIdentifier: "iconCollectionIdentifier", for: indexPath) as? IconCollectionCell)!
        //panggil image
        Cell.iconImage.image = UIImage(named: ImageArray[indexPath.row])
        return Cell
    }
}
