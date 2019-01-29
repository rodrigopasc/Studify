//
//  NewStudyPlanViewController.swift
//  Studify
//
//  Created by Rodrigo Paschoaletto on 27/01/2019.
//  Copyright © 2019 Rodrigo Paschoaletto. All rights reserved.
//

import UIKit
import UserNotifications
import RealmSwift

class NewStudyPlanViewController: UIViewController {
    @IBOutlet weak var titleToSave: UITextField!
    @IBOutlet weak var subjectToSave: UITextField!
    @IBOutlet weak var dateTimeToSave: UIDatePicker!
    
    let notificationContent = UNMutableNotificationContent()
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateTimeToSave.minimumDate = Date()
        self.hideKeyboard()
    }
    
    @IBAction func putOnSchedule(_ sender: UIButton) {
        let newStudyPlan = StudyPlan()
        newStudyPlan.title = titleToSave.text!
        newStudyPlan.subject = subjectToSave.text!
        newStudyPlan.remindAt = dateTimeToSave.date
        newStudyPlan.done = false
        newStudyPlan.id = String(Date().timeIntervalSince1970)
        save(studyPlanToSave: newStudyPlan)
        setupNotification(id: newStudyPlan.id, title: newStudyPlan.title, body: newStudyPlan.subject, remindAt: newStudyPlan.remindAt!)
        navigationController!.popViewController(animated: true)
    }
    
    func save(studyPlanToSave: Object) {
        try! realm.write {
            realm.add(studyPlanToSave)
        }
    }
    
    func setupNotification(id: String, title: String, body: String, remindAt: Date) {
        notificationContent.title = "It is time to study \(title)! 🤓"
        notificationContent.body = "Get your stuff and we shall learn \(body)"
        notificationContent.categoryIdentifier = "Studify"
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: remindAt)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: id, content: notificationContent, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
