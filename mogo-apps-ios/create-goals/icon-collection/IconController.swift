//
//  IconController.swift
//  fix-mogo
//
//  Created by Carlos Gamaliel Manurung on 10/04/21.
//

import UIKit


class IconController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    @IBOutlet weak var iconCollection: UICollectionView!
    
    var index = 0
    
    var imageArray = ["iphone", "rocket", "party", "cool", "embarrassed", "happy_hands", "happy", "hardShocked", "rich", "sad", "shocked", "skull"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func clickDone(_ sender: UIBarButtonItem) {
        moveBackPrevioous(imageArray[index])
    }
    
    private func setupCollection() {
        iconCollection.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "iconCollectionIdentifier")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (iconCollection.dequeueReusableCell(withReuseIdentifier: "iconCollectionIdentifier", for: indexPath) as? CollectionViewCell)!
        //panggil image
        cell.iconImage.image = UIImage(named: imageArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath.row
    }
    
   
    private func moveBackPrevioous(_ value:String) {
        
        let storyboard = UIStoryboard(name: "CreateGoals", bundle: nil)
        
        let navVC = (storyboard.instantiateViewController(identifier: "createGoalVc") as? CreateGoalController)!
        navVC.iconSelected = value
        self.navigationController?.pushViewController(navVC, animated: true)
    }

}
