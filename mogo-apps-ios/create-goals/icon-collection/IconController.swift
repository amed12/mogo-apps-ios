//
//  IconController.swift
//  fix-mogo
//
//  Created by Carlos Gamaliel Manurung on 10/04/21.
//

import UIKit


class IconController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    @IBOutlet weak var iconCollection: UICollectionView!
    
//    weak var delagate: IconControllerDelegate?
    var imageSend = ""
    
    var imageArray = ["iphone", "rocket", "shoes", "cool", "embarrassed", "happy_hands", "happy", "hardShocked", "rich", "sad", "shocked", "skull"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        // Do any additional setup after loading the view.
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
        imageSend = imageArray[indexPath.item]
    }
    
    @IBAction func buttonCancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
