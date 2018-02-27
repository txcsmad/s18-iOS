//
//  ViewController.swift
//  ToDo
//
//  Created by Matthew Ruston on 2/12/18.
//  Copyright © 2018 MattRuston. All rights reserved.
//

import UIKit

struct Task {
    let name: String
    var done: Bool
    
    init(name: String) {
        self.name = name
        done = false
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.numberOfTasks()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath)
        
        let task = DataManager.shared.getTask(at: indexPath.row)
        let check = task.done ? "☑️" : "⬜️"
        cell.textLabel?.text = "\(check) \(task.name)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DataManager.shared.toggleTask(at: indexPath.row)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Remove") {
            (action, indexPath) in
            DataManager.shared.removeTask(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [deleteAction]
    }
}













