//
//  ViewController.swift
//  calendar2
//
//  Created by Aaron Saunders on 2/13/16.
//  Copyright © 2016 Aaron Saunders. All rights reserved.
//

import UIKit


//
// for help with the layout
// http://stackoverflow.com/questions/18174980/creating-a-percentage-based-ios-layout
//
class ViewController: UIViewController {

    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var tableView: EventViewController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = EventViewController()
        tableView.delegate = EventViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

//
// Seperate functions to support the calendar
//
extension ViewController: FSCalendarDataSource, FSCalendarDelegate  {
    
    
    func calendarCurrentMonthDidChange(calendar: FSCalendar!) {
        print("\(calendar)")
    }
    
    func calendar(calendar: FSCalendar!, didSelectDate date: NSDate!) {
        NSLog("calendar did select date \(calendar.stringFromDate(date))")
    }
    
    func calendar(calendar: FSCalendar!, numberOfEventsForDate date: NSDate!) -> Int {
        let day = calendar.dayOfDate(date)
        return day % 5 == 0 ? day/5 : 0;
    }
    
    func calendar(calendar: FSCalendar!, hasEventForDate date: NSDate!) -> Bool {
        return false
    }
}


