//
//  ViewController.swift
//  EventKit提醒事件
//
//  Created by student on 2021/6/3.
//
import EventKit
import UIKit

class ViewController: UIViewController {
    let eventStore = EKEventStore()
    

    override func viewDidLoad() {
        super.viewDidLoad()
     authoried()
        // Do any additional setup after loading the view.
    }


}

extension ViewController{
    func authoried() {
        eventStore.requestAccess(to: .reminder) { (grant, error) in
            if grant&&error == nil{
                print("授权成功")
            }
            else{
                print("授权失败")
            }
        }
        
        eventStore.requestAccess(to: .event) { (grant, error) in
            if grant&&error == nil{
                print("授权成功")
            }
            else{
                print("授权失败")
            }
        }

    }
    
    func addReminder() {

        let reminder = EKReminder(eventStore: eventStore)
        reminder.title = "eat tonight"
        reminder.dueDateComponents = Calendar.current.dateComponents([.minute,.hour,.day,.month,.year], from: Date())
        reminder.calendar = eventStore.defaultCalendarForNewReminders()
        do {
            try eventStore.save(reminder, commit: true)
            
        } catch  {
            print(error)
        }
        
        
    }
    
    func querryReminder() {
        let predicart = eventStore.predicateForReminders(in: nil)
        
        eventStore.fetchReminders(matching: predicart) { (reminder) in
            if let reminder = reminder{
                for reminder in reminder where reminder.isCompleted == false {
                    print(reminder.title)
                }
            }
        }
    }
    
    func deleteReminder() {
        let predicart = eventStore.predicateForReminders(in: nil)
        
        eventStore.fetchReminders(matching: predicart) { (reminder)
            in
            if let reminder = reminder?.last{
                do {
                    try self.eventStore.remove(reminder, commit: true)
                    
                } catch  {
                    print(error)
                }
            }

            
        }
    }
    
    func updateReminder() {
        let predicart = eventStore.predicateForReminders(in: nil)
        
        eventStore.fetchReminders(matching: predicart) { (reminder)
            in
            if let reminder = reminder?.last{
                reminder.title = "中午要吃饭"
                do {
                    try self.eventStore.save(reminder, commit: true)
                    
                } catch  {
                    print(error)
                }
            }

            
        }
    }
}
