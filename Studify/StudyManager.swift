//
//  StudyManager.swift
//  Studify
//
//  Created by Rodrigo Paschoaletto on 27/01/2019.
//  Copyright © 2019 Rodrigo Paschoaletto. All rights reserved.
//

import Foundation

class StudyManager {
    static let shared = StudyManager()
    let ud = UserDefaults.standard
    var studyPlans: [StudyPlan] = []
    
    private init() {
        if let data = ud.data(forKey: "studyPlans"), let plans = try?
            JSONDecoder().decode([StudyPlan].self, from: data) {
            self.studyPlans = plans
        }
    }
    
    func save() {
        if let data = try? JSONEncoder().encode(studyPlans) {
            ud.set(data, forKey: "studyPlans")
        }
    }
    
    func setupPlan(_ plan: StudyPlan) {
        studyPlans.append(plan)
        save()
    }
    
    func remove(at index: Int) {
        studyPlans.remove(at: index)
        save()
    }
}
