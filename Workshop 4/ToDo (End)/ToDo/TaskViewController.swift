//
//  TaskViewController.swift
//  ToDo
//
//  Created by Jesse Tipton on 2/19/18.
//  Copyright © 2018 MattRuston. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func saveTask(_ sender: Any) {
        if let text = textField.text?.trimmingCharacters(in: .whitespaces), !text.isEmpty {
            let task = Task(name: text)
            DataManager.shared.add(task: task)
        }
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
