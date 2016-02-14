//
//  AddEventViewController.swift
//  calendar2
//
//  Created by Aaron Saunders on 2/13/16.
//  Copyright © 2016 Aaron Saunders. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var pickEventDateBtn: UIButton!
    @IBOutlet weak var eventTitleText: UITextField!
    @IBOutlet weak var pickEventEndDate: UIButton!
    
    @IBOutlet weak var textViewDescription: UITextView!
    
    
    var datePickerView:UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textViewDescription.delegate = self
        eventTitleText.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func pickEventDate(sender: UIButton) {
        
        actionsheetDatePicker(sender.accessibilityLabel!)
        
    }
    
    func actionsheetDatePicker(whichDate:String) {
        
        datePickerView = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.DateAndTime
        
        let alertController = UIAlertController(title: "\n\n\n\n\n\n\n\n\n",
            message: "\n\n\nPick Date", preferredStyle: .ActionSheet)
        
        // create a generic handler to use on all actions to simplify code
        func noOpHandler(action:UIAlertAction) {
            print("User selected: \(action.title)")
            
            
            if action.title! == "Ok" {
                let date = self.datePickerView.date
                
                let dateFormatter: NSDateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "MM-dd-yyyy h:mm a"
                
                let fDate = dateFormatter.stringFromDate(date)
                print(fDate)
                
                
                if (whichDate == "startDate") {
                    self.pickEventDateBtn.setTitle(fDate, forState: .Normal)
                    self.pickEventDateBtn.setTitle(fDate, forState: .Highlighted)
                } else {
                    self.pickEventEndDate.setTitle(fDate, forState: .Normal)
                    self.pickEventEndDate.setTitle(fDate, forState: .Highlighted)
                }
                
            }
            
        }
        
        let okAction = UIAlertAction(title: "Ok", style: .Default, handler:noOpHandler)
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler:noOpHandler)
        alertController.addAction(cancelAction)
        
        alertController.view.addSubview(datePickerView)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    // MARK: - Fake Placeholder Text
    
    func setupTextViewDescription(){
        
        textViewDescription.text = "Enter the description for the Event "
        textViewDescription.textColor = UIColor.lightGrayColor()
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if textViewDescription.textColor == UIColor.lightGrayColor() {
            textViewDescription.text = nil
            textViewDescription.textColor = UIColor.blackColor()
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if textViewDescription.text.isEmpty {
            textViewDescription.text = "Enter the description for the Event "
            textViewDescription.textColor = UIColor.lightGrayColor()
        }
    }
    
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
