//
//  ProgressDrawer.swift
//  mogo-apps-ios
//
//  Created by Ivan Kelvin Trisno on 08/04/21.
//

import UIKit

class ProgressDrawer: UIView {
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    
    private var startPoint = CGFloat(-Double.pi / 2) // This make sure we start from 90 degree, circle mean 360 then we should start from 90.
    private var endPoint = CGFloat(3 * Double.pi / 2) // This make sure we fulfil the circle space to 360 degree
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createCircularPath()
    }
    
    func createCircularPath() {
        // created circularPath for circleLayer and progressLayer
        // In order to create the circle we need to draw the path, using UIBezierPath, make sure you learn UIBezierPath after this
//        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 80, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: -17, y: -11), radius: 55, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        
        // circleLayer path defined to circularPath
        circleLayer.path = circularPath.cgPath
        // aesthetics
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 20.0
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = UIColor.init(cgColor: #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.937254902, alpha: 1)).cgColor
        // added circleLayer to layer
        layer.addSublayer(circleLayer)
        // progressLayer path defined to circularPath
        progressLayer.path = circularPath.cgPath
        // aesthetics
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .square
        progressLayer.lineWidth = 20.0
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.init(cgColor: #colorLiteral(red: 0.0862745098, green: 0.4745098039, blue: 0.431372549, alpha: 1)).cgColor
        // added progressLayer to layer
        layer.addSublayer(progressLayer)
    }
    
    
    func progressAnimation(duration: TimeInterval) {
        // created circularProgressAnimation with keyPath
        // There are propertys animation in CAAnimation that we can use such as "strokeEnd", etc.
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        // set the end time
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = 0.5
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}
