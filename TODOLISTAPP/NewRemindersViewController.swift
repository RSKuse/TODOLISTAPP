//
//  NewRemindersViewController.swift
//  TODOLISTAPP
//
//  Created by Reuben Simphiwe Kuse on 2023/07/18.
//

import Foundation
import UIKit

class NewRemindersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    lazy var newReminderTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "New Reminders"
        setupTableViewUI()
        registerCells()
    }
    
    func setupTableViewUI() {
        view.addSubview(newReminderTableView)

        newReminderTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        newReminderTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        newReminderTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        newReminderTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    func registerCells() {
        newReminderTableView.register(NewReminderTableViewCell.self, forCellReuseIdentifier: "NewReminderTableViewCellID")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newReminderCell = tableView.dequeueReusableCell(withIdentifier: "NewReminderTableViewCellID", for: indexPath) as! NewReminderTableViewCell
        return newReminderCell
        
    }
    
}
