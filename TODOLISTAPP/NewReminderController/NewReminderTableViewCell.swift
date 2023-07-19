//
//  NewReminderTablewViewCell.swift
//  TODOLISTAPP
//
//  Created by Reuben Simphiwe Kuse on 2023/07/18.
//

import Foundation
import UIKit

class NewReminderTableViewCell: UITableViewCell {
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    func setupUI() {
        addSubview(titleLabel)
        addSubview(reminderTextField)
        
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
        
        reminderTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        reminderTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        reminderTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        reminderTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
