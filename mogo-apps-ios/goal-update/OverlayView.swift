//
//  OverlayView.swift
//  mogo-apps-ios
//
//  Created by Ivan Kelvin Trisno on 09/04/21.
//

import UIKit
import Foundation

class OverlayView: UIViewController {
    
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var imageResult: UIImageView!
    
    @IBOutlet weak var statusResult: UILabel!
    
    @IBOutlet weak var descriptionResult: UILabel!
    
    @IBOutlet weak var buttonView: UIView!
    
    var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Terima data
        generateText()
        ////
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        headerView.roundCorners(.allCorners, radius: 10)
        buttonView.roundCorners(.allCorners, radius: 10)
    }
    
    func generateText(){
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor(cgColor: #colorLiteral(red: 0.0862745098, green: 0.4745098039, blue: 0.431372549, alpha: 1)), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        if flag >= 0 && flag <= 3 {
            headerLabel.text = "Goals Update"
            var description = ""
            let a = "Trip to Sumba"
            let b = "12 April 2025."
            if flag == 0 {
                imageResult.image = UIImage(named: "happy_hands")
                statusResult.text = "Good Job!"
                description = "If If you stay on track, you could achieve \(a) by \(b)"
            } else if flag == 1 {
                imageResult.image = UIImage(named: "shocked")
                statusResult.text = "Oops, you saved IDR 1.000.000 less!"
                description = "To achieve \(a) goal on time, you need to start saving \(b) or change the target date."
            } else if flag == 2 {
                imageResult.image = UIImage(named: "rich")
                statusResult.text = "Whoa, you saved IDR 1.000.000 more!"
                description = "If you keep saving like this, you could achieve \(a) by \(b)"
            } else if flag == 3 {
                imageResult.image = UIImage(named: "sad")
                statusResult.text = "Ah, ok..."
                description = "To achieve \(a) goal on time, you need to save \(b) starting next month."
            }
            let result = NSMutableAttributedString(string: description)
            result.addAttributes(attributes, range: NSRange(location: (description.index(of: a)?.utf16Offset(in: description))!, length: a.count))
            result.addAttributes(attributes, range: NSRange(location: (description.index(of: b)?.utf16Offset(in: description))!, length: b.count))
            descriptionResult.attributedText = result
        } else {
            var status = ""
            let c = "iPhone 12"
            headerLabel.text = "Congratulations!"
            imageResult.image = UIImage(named: "cool")
            status = "You have achieved \(c) goal!"
            descriptionResult.text = "Now you can find the goal in Completed section."
            let result = NSMutableAttributedString(string: status)
            result.addAttributes(attributes, range: NSRange(location: (status.index(of: c)?.utf16Offset(in: status))!, length: c.count))
            statusResult.attributedText = result
        }
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
    }
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        // Not allowing the user to drag the view upward
        guard translation.y >= 0 else { return }
        
        // setting x as 0 because we don't want users to move the frame side ways!! Only want straight up or down
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                self.dismiss(animated: true, completion: nil)
            } else {
                // Set back to original position of the view controller
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
    }
    
    @IBAction func okButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension StringProtocol {
    func index<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.lowerBound
    }
    func endIndex<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.upperBound
    }
    func indices<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Index] {
        ranges(of: string, options: options).map(\.lowerBound)
    }
    func ranges<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...]
                .range(of: string, options: options) {
                result.append(range)
                startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}
