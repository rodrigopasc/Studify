//
//  StudyPlan.swift
//  Studify
//
//  Created by Rodrigo Paschoaletto on 27/01/2019.
//  Copyright © 2019 Rodrigo Paschoaletto. All rights reserved.
//

import Foundation

class StudyPlan: Codable {
    let title: String
    let subject: String
    let remind_at: Date
    var notification: String
    var done: Bool = false
    
    init(title: String, subject: String, remind_at: Date, notification: String, done: Bool) {
        self.title = title
        self.subject = subject
        self.remind_at = remind_at
        self.notification = notification
        self.done = done
    }
}
