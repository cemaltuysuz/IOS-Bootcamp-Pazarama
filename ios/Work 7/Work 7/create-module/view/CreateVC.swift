//
//  CreateVC.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import UIKit

class CreateVC: UIViewController {
    
    @IBOutlet weak var createTextField: UITextField!
    var presenter:ViewToPresenterCreateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        CreateRouter.createModule(ref: self)
    }
    
    @IBAction func createButton(_ sender: Any) {
        if let content = createTextField.text {
            presenter?.createTheResponsibility(content: content)
        }
    }
}
