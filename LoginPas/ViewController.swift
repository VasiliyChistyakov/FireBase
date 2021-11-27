//
//  ViewController.swift
//  LoginPas
//
//  Created by Чистяков Василий Александрович on 20.11.2021.
//

import UIKit
import Firebase

class ViewController: UIViewController, CAAnimationDelegate {
    
    var shapeLayerSV: CAShapeLayer!{
        didSet{
            shapeLayerSV.lineWidth = 20
            shapeLayerSV.lineCap = CAShapeLayerLineCap.round
            shapeLayerSV.fillColor = nil
            shapeLayerSV.strokeEnd = 1
            let color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            shapeLayerSV.strokeColor = color
        }
    }
    
    var overShapeLayerSV: CAShapeLayer!{
        didSet{
            overShapeLayerSV.lineWidth = 20
            overShapeLayerSV.lineCap = CAShapeLayerLineCap.round
            overShapeLayerSV.fillColor = nil
            overShapeLayerSV.strokeEnd = 0
            let color = #colorLiteral(red: 0.9982330203, green: 0.6840890646, blue: 0.4381240904, alpha: 1).cgColor
            overShapeLayerSV.strokeColor = color
        }
    }

    @IBOutlet weak var userEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userEmail.isHidden = true
        shapeLayerSV = CAShapeLayer()
        view.layer.addSublayer(shapeLayerSV)
        
        overShapeLayerSV = CAShapeLayer()
        view.layer.addSublayer(overShapeLayerSV)
        
        configShapeLayer(shapeLayerSV)
        configShapeLayer(overShapeLayerSV)
        
        startAnimation()
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.shapeLayerSV.isHidden = true
        self.overShapeLayerSV.isHidden = true
        
        self.userEmail.isHidden = false
        
        guard let email = email else { return }
        self.userEmail.text = " Welcome, \(email)!"
    }
    
    var email: String? {
        return Auth.auth().currentUser?.email
    }
    
    func configShapeLayer(_ shapeLayer: CAShapeLayer ){
        shapeLayer.frame = view.bounds
        let path = UIBezierPath(arcCenter: view.center, radius: 150, startAngle: -( .pi / 2), endAngle: .pi * 2, clockwise: true)
        shapeLayer.path = path.cgPath
    }
    
    func startAnimation() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1.5
        animation.duration = 2
        
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.fillMode = .both
        animation.isRemovedOnCompletion = false
        
        animation.delegate = self
        
        overShapeLayerSV.add(animation, forKey: nil)
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        do {
           try Auth.auth().signOut()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}

