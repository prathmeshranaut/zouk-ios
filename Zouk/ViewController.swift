//
//  ViewController.swift
//  Zouk
//
//  Created by Aayush Ranaut on 10/24/15.
//  Copyright © 2015 Prathmesh Ranaut. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dobPicker: UIDatePicker!
    
    @IBOutlet weak var textfieldjobdate: UITextField!
    
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
    
    func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        textfieldjobdate.text = dateFormatter.stringFromDate(sender.date)
    }

    @IBAction func endEditing(sender: AnyObject) {
        textfieldjobdate.resignFirstResponder();
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

