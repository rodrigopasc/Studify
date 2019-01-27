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
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateTimeToSave.minimumDate = Date()
    }
    
    @IBAction func putOnSchedule(_ sender: UIButton) {
        let newStudyPlan = StudyPlan()
        newStudyPlan.title = titleToSave.text!
        newStudyPlan.subject = subjectToSave.text!
        newStudyPlan.remindAt = dateTimeToSave.date
        newStudyPlan.done = false
        newStudyPlan.id = String(Date().timeIntervalSince1970)
        save(studyPlanToSave: newStudyPlan)
        setupNotification(id: newStudyPlan.id, subject: newStudyPlan.subject)
        navigationController!.popViewController(animated: true)
    }
    
    func save(studyPlanToSave: Object) {
        try! realm.write {
            realm.add(studyPlanToSave)
        }
    }
    
    func setupNotification(id: String, subject: String) {
        notificationContent.title = "É hora de estudar! 🤓"
        notificationContent.subtitle = "Chegou o momento de aprender \(subject)"
        notificationContent.categoryIdentifier = "Studify"
        
        let request = UNNotificationRequest(identifier: id, content: notificationContent, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
