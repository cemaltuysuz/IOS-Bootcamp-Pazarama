//
//  ViewController.swift
//  DateAndTime Picker
//
//  Created by cemal tüysüz on 19.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hourF: UITextField!
    @IBOutlet weak var dateF: UITextField!
    
    var datePicker:UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        dateF.inputView = datePicker
        
        datePicker?.addTarget(self, action: #selector(self.showDatePicker(datepicker:)), for: .valueChanged)
    }

    @objc func showDatePicker(datepicker:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        var data = dateFormatter.string(from: datepicker.date)
        dateF.text = data
    }

}

