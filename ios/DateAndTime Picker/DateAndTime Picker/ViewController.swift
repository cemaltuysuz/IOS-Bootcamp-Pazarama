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
    var timePicker:UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        if #available(iOS 13.4, *){
            datePicker?.preferredDatePickerStyle = .wheels
        }
        dateF.inputView = datePicker
        
        datePicker?.addTarget(self, action: #selector(self.showDatePicker(datepicker:)), for: .valueChanged)
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        if #available(iOS 13.4, *){
            timePicker?.preferredDatePickerStyle = .wheels
        }
        hourF.inputView = timePicker
        
        timePicker?.addTarget(self, action: #selector(self.showTime(timePicker:)), for: .valueChanged)
        
        
        let touchDetect = UITapGestureRecognizer(target: self, action: #selector(self.detectTouch))
        
        // Detect touchs for close the text fields
        view.addGestureRecognizer(touchDetect)
    }

    @objc func showDatePicker(datepicker:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let data = dateFormatter.string(from: datepicker.date)
        dateF.text = data
    }
    
    @objc func showTime(timePicker:UIDatePicker){
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm"
        let data = timeFormatter.string(from: timePicker.date)
        hourF.text = data
    }
    
    @objc func detectTouch(){
        view.endEditing(true)
    }

}

