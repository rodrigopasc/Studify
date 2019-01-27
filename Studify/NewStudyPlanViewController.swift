//
//  NewStudyPlanViewController.swift
//  Studify
//
//  Created by Rodrigo Paschoaletto on 27/01/2019.
//  Copyright © 2019 Rodrigo Paschoaletto. All rights reserved.
//

import UIKit

class NewStudyPlanViewController: UIViewController {
    @IBOutlet weak var studyPlanTitle: UITextField!
    @IBOutlet weak var studyPlanSubject: UITextField!
    @IBOutlet weak var studyPlanDateTime: UIDatePicker!
    
    let studyManager = StudyManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func putOnSchedule(_ sender: UIButton) {
    }
}
