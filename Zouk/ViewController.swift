//
//  ViewController.swift
//  Zouk
//
//  Created by Aayush Ranaut on 10/24/15.
//  Copyright © 2015 Prathmesh Ranaut. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    let pickerData = ["Salaried",
        "Self Employed Business",
        "Self Employed Professional",
        "Salaried Doctor"]
    
    @IBOutlet weak var textfieldjobdate: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeOfEmploymentTextField: UITextField!
    @IBOutlet weak var salaryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func dp(sender: UITextField) {
        let datePickerView  : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("handleDatePicker:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    
    @IBAction func typeOfEmployment(sender: AnyObject) {
        let pickerView : UIPickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        self.typeOfEmploymentTextField.inputView = pickerView
    }
    
    func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        textfieldjobdate.text = dateFormatter.stringFromDate(sender.date)
    }

    @IBAction func endEditing(sender: AnyObject) {
        textfieldjobdate.resignFirstResponder()
        nameTextField.resignFirstResponder()
        typeOfEmploymentTextField.resignFirstResponder()
        salaryTextField.resignFirstResponder()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Datasource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeOfEmploymentTextField.text = pickerData[row]
    }

    
}

