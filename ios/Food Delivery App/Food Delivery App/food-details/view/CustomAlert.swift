//
//  CustomAlert.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 11.01.2022.
//

import Foundation
import UIKit
import Lottie

class MyAlert {
    
    struct AlertValues {
        static let backgroundAlphaTo : CGFloat = 0.6
    }
    
    private var myTargetView : UIView?
    private var anim:AnimationView?
    
    private let backgroundView:UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0
        return backgroundView
    }()
    
    private let alertView:UIView = {
       let alert = UIView()
        alert.backgroundColor = .white
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 12
        return alert
    }()
    
    func showAlert (with title:String,
                    message:String,
                    viewController:UIViewController){
        guard let targetView = viewController.view else {
            return
        }
        myTargetView = targetView
        
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        targetView.addSubview(alertView)
        
        // AlertView Design
        alertView.frame = CGRect(x: 40,
                                 y: -300,
                                 width: targetView.frame.size.width-80,
                                 height: 300)
        // Title Label Design
        let titleLabel = UILabel(
            frame: CGRect(
                x: 0,
                y: 0,
                width: alertView.frame.size.width,
                height: 80)
        )
        titleLabel.text = title
        titleLabel.textAlignment = .center
        alertView.addSubview(titleLabel)
        
        anim = AnimationView(name: "success_anim")
        anim!.frame = CGRect(x: 70, y: 70, width: 200, height: 200)
        
        alertView.addSubview(self.anim!)
        
        // Ok Button
        let button = UIButton(frame: CGRect( x: 0,
                                             y: alertView.frame.size.width-69,
                                             width: alertView.frame.size.width,
                                            height: 35))
        button.setTitle("Tamam", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.addTarget(self,
                         action: #selector(self.dismissAlert),
                         for: .touchUpInside)
        
        alertView.addSubview(button)
        
        
        
        
        
        UIView.animate(withDuration: 0.25,
                       animations: {
            self.backgroundView.alpha = AlertValues.backgroundAlphaTo
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.25, animations: {
                    self.alertView.center = targetView.center
                    self.anim?.animationSpeed = 1
                    self.anim?.loopMode = .loop
                    self.anim?.play()
                })
            }
            
        })
    }
    
    @objc func dismissAlert(){
        guard let targetView = myTargetView else {
            return
        }
        
        UIView.animate(withDuration: 0.25,
                       animations: {
            self.alertView.frame = CGRect(x: 40,
                                     y: targetView.frame.size.height,
                                     width: targetView.frame.width-80,
                                     height: 300)
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.25, animations: {
                    self.backgroundView.alpha = 0
                    
                },completion: { done in
                    self.anim?.stop()
                    self.alertView.removeFromSuperview()
                    self.backgroundView.removeFromSuperview()
                    
                })
            }
            
        })
    }
}
