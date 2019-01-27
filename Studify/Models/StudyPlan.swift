//
//  StudyPlan.swift
//  Studify
//
//  Created by Rodrigo Paschoaletto on 27/01/2019.
//  Copyright © 2019 Rodrigo Paschoaletto. All rights reserved.
//

import Foundation
import RealmSwift

class StudyPlan: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var subject: String = ""
    @objc dynamic var remindAt: Date? = nil
    @objc dynamic var done: Bool = false
}
