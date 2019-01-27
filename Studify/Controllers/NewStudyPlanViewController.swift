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
    }
    
    func save(studyPlanToSave: Object) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(studyPlanToSave)
        }
        
        navigationController!.popViewController(animated: true)
    }
}
