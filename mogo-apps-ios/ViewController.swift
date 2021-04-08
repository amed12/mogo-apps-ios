//
//  ViewController.swift
//  mogo-apps-ios
//
//  Created by Achmad Fathullah on 29/03/21.
//

import UIKit

class ViewController: UIViewController{
    var containerView = UIView()
    @IBOutlet weak var BtnModal: UIButton!
    var slideUpView = UITableView()
    let slideUpViewHeight: CGFloat = 200
    let slideUpViewDataSource: [Int: (UIImage?, String)] = [
      0: (UIImage(named: "star"), "Save this tutorial"),
      1: (UIImage(named: "share"), "Share it"),
      2: (UIImage(named: "copy"), "Make a copy"),
      3: (UIImage(named: "applaud"), "Applaud it")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        slideUpView.isScrollEnabled = true
          slideUpView.delegate = self
          slideUpView.dataSource = self
          slideUpView.register(SlideUpViewCell.self,
                               forCellReuseIdentifier: "SlideUpViewCell")
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let window = UIApplication.shared.keyWindow
        containerView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.9)
      containerView.frame = self.view.frame
      
      window?.addSubview(containerView)
        
        let tapGesture = UITapGestureRecognizer(target: self,
                            action: #selector(slideUpViewTapped))
          containerView.addGestureRecognizer(tapGesture)
        
        containerView.alpha = 0
          UIView.animate(withDuration: 0.5,
                         delay: 0, usingSpringWithDamping: 1.0,
                         initialSpringVelocity: 1.0,
                         options: .curveEaseInOut, animations: {
            self.containerView.alpha = 0.8
          }, completion: nil)
        let screenSize = UIScreen.main.bounds.size
          slideUpView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: slideUpViewHeight)
          slideUpView.separatorStyle = .none
          window?.addSubview(slideUpView)
        UIView.animate(withDuration: 0.5,
                         delay: 0, usingSpringWithDamping: 1.0,
                         initialSpringVelocity: 1.0,
                         options: .curveEaseInOut, animations: {
            self.containerView.alpha = 0.8
            self.slideUpView.frame = CGRect(x: 0, y: screenSize.height - self.slideUpViewHeight, width: screenSize.width, height: self.slideUpViewHeight)
          }, completion: nil)
    
    }
    
    @objc func slideUpViewTapped() {
        let screenSize = UIScreen.main.bounds.size
          UIView.animate(withDuration: 0.5,
                         delay: 0, usingSpringWithDamping: 1.0,
                         initialSpringVelocity: 1.0,
                         options: .curveEaseInOut, animations: {
            self.containerView.alpha = 0
            self.slideUpView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.slideUpViewHeight)
          }, completion: nil)
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection
         section: Int) -> Int {
    slideUpViewDataSource.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath:
         IndexPath) -> UITableViewCell {
    guard let cell = tableView
      .dequeueReusableCell(withIdentifier: "SlideUpViewCell",
      for: indexPath) as? SlideUpViewCell
    else { fatalError("unable to deque SlideUpViewCell") }
  
  cell.iconView.image = slideUpViewDataSource[indexPath.row]?.0
  cell.labelView.text = slideUpViewDataSource[indexPath.row]?.1
  return cell
}
  func tableView(_ tableView: UITableView, heightForRowAt
         indexPath: IndexPath) -> CGFloat {
    return 50
  }
}
