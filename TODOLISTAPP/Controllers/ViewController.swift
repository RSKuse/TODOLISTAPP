//
//  ViewController.swift
//  TODOLISTAPP
//
//  Created by Reuben Simphiwe Kuse on 2023/07/18.
//

import UIKit

/// 1. Closures
/// 2. didSet
/// 3. guard statement - help with handling cases where a variable can give you back an optional (nil or value e.g. nil / "")
/// 4. TextFieldDelegates - like TableViews, TextFields have delegate functions that handle specific things e.g. dismissing the keyboard using the `textFieldShouldReturn` function.
/// 5. `tableview.reloadData()` - this handles reloading the tableview when the data it uses is updated.
/// 6. UITextView - Multi-Line type e.g try this in your email/notes app much later.


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var taskArray: [Task] = [
        Task(title: "Pickup Ndalo"),
        Task(title: "Wash Car"),
        Task(title: "Charge Laptop for Loadshedding"),
        Task(title: "Do Laundry")
    ]
    
    lazy var taskTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var createTaskImageButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "icAdd")
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(createTaskButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reminders"
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        navigationItem.backBarButtonItem = backButton
        setupTableViewUI()
        registerCells()
    }
    
    func setupTableViewUI() {
        view.addSubview(taskTableView)
        view.addSubview(createTaskImageButton)
        
        taskTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        taskTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        taskTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        taskTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        createTaskImageButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        createTaskImageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -49).isActive = true  
    }
    
    func registerCells() {
        taskTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "TaskTableViewCellID")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let taskCell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCellID", for: indexPath) as! TaskTableViewCell
        let task = taskArray[indexPath.row]
        taskCell.titleLabel.text = task.title
        return taskCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         taskTableView.deselectRow(at: indexPath, animated: true)
         let detailReminderViewController = DetailReminderViewController()
         detailReminderViewController.task = taskArray[indexPath.row]
         navigationController?.pushViewController(detailReminderViewController, animated: true)
     }

    @objc func createTaskButtonPressed() {
        let newReminderViewController = NewRemindersViewController()
        
        // 3. Closure
        newReminderViewController.createdTask = { taskCreated in
            self.taskArray.append(taskCreated)
            self.taskTableView.reloadData() // tells the tableView to reload / update its UI.
        }
        
        let newReminderVC = UINavigationController(rootViewController: newReminderViewController)
        newReminderVC.modalPresentationStyle = .fullScreen
        present(newReminderVC, animated: true, completion: nil)
    }
}

