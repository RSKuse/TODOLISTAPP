//
//  NewRemindersViewController.swift
//  TODOLISTAPP
//  Created by Reuben Simphiwe Kuse on 2023/07/18.

import Foundation
import UIKit

class NewRemindersViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.black
        label.text = "Enter Reminder"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var reminderTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Reminder Name"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "New Reminder"
        setupUI()
        addCloseButton()
    }
    func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(reminderTextField)
        
        
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: reminderTextField.topAnchor, constant: -8).isActive = true
        
        reminderTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        reminderTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        reminderTextField.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    func addCloseButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Add",
            style: .done,
            target: self,
            action: #selector(addReminder))
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .plain,
            target: self,
            action: #selector(handleDismiss))
    }

    @objc func handleDismiss() {
        dismiss(animated: true)
    }
    
    @objc func addReminder() {
        guard let taskTitle = reminderTextField.text, !taskTitle.isEmpty else {
            return
        }
        let newTask = Task(title: taskTitle)
        if let viewController = presentingViewController as? ViewController {
            viewController.taskArray.append(newTask)
            viewController.taskTableView.reloadData()
        }

        dismiss(animated: true)
    }

    
}
