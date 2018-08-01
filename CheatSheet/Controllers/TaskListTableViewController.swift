//
//  TaskListTableViewController.swift
//  CheatSheet
//
//  Created by Ekow Buadu on 7/31/18.
//  Copyright © 2018 Ekow Buadu. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    var toDos: [ToDo] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDos = createToDos()
        // Do any additional setup after loading the view.
    }
    
    func createToDos() -> [ToDo] {
        let eggs = ToDo()
        eggs.name = "Buy Eggs"
        eggs.important = true
        
        let dog = ToDo()
        dog.name = "Walk Dog"
        
        let cheese = ToDo()
        cheese.name = "Eat Cheese"
        
        return [eggs, cheese, dog]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskListTableViewCell", for: indexPath)
        let item = toDos[indexPath.row]
        
        if item.important {
            cell.textLabel?.text = "❗️" + item.name
        } else {
            cell.textLabel?.text = item.name
        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDoViewController {
            addVC.previousVC = self
        }
        if let completeVC = segue.destination as? CompleteTaskViewController {
            if let toDo = sender as? ToDo {
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
                
            }
         }
    }
}

