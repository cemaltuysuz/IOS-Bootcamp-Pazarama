//
//  DetailVC.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var detailTextField: UITextField!
    var resp:Responsibility?
    var detailPresenter:ViewToPresenterDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let r = resp {
            detailTextField.text = r.responsibility!
        }
        
        DetailRouter.createModule(ref: self)
    }
    
    @IBAction func updateButton(_ sender: Any) {
        if let newContent = detailTextField.text , let r = resp {
            detailPresenter?.updateTheResponsibility(
                resp: Responsibility(
                    responsibilityId: r.responsibilityId!,
                    responsibility: newContent)
            )
        }
    }
}
