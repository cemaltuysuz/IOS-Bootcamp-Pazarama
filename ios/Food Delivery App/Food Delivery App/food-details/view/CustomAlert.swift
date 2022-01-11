//
//  CustomAlert.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 11.01.2022.
//

import Foundation
import UIKit

class MyAlert {
    
    struct Constants {
        static let backgroundAlphaTo : CGFloat = 0.6
    }
    
    private var myTargetView : UIView?
    
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
        
        // Message Label Design
        let messageLabel = UILabel(
            frame: CGRect(
                x: 0,
                y: 80,
                width: alertView.frame.size.width,
                height: 30)
        )
        messageLabel.text = message
        messageLabel.textAlignment = .left
        messageLabel.numberOfLines = 0
        alertView.addSubview(messageLabel)
        
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
            self.backgroundView.alpha = Constants.backgroundAlphaTo
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.25, animations: {
                    self.alertView.center = targetView.center
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
                    self.alertView.removeFromSuperview()
                    self.backgroundView.removeFromSuperview()
                    
                })
            }
            
        })
    }
}
