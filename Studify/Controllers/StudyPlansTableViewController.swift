//
//  StudyPlansTableViewController.swift
//  Studify
//
//  Created by Rodrigo Paschoaletto on 27/01/2019.
//  Copyright © 2019 Rodrigo Paschoaletto. All rights reserved.
//

import UIKit
import RealmSwift

class StudyPlansTableViewController: UITableViewController {
    let realm = try! Realm()
    
    let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy HH:mm"
        return df
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let studyPlans = realm.objects(StudyPlan.self)
        return studyPlans.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let studyPlan = realm.objects(StudyPlan.self)[indexPath.row]
        cell.textLabel?.text = studyPlan.title
        cell.detailTextLabel?.text = dateFormatter.string(from: (studyPlan.remindAt)!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let studyPlan = realm.objects(StudyPlan.self)[indexPath.row]
            try! realm.write {
                realm.delete(studyPlan)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
}
