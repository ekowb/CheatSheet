//
//  TaskListTableViewController.swift
//  CheatSheet
//
//  Created by Ekow Buadu on 7/31/18.
//  Copyright © 2018 Ekow Buadu. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    var toDos: [ToDoCoreData] = []
    
    

    
    @IBAction func displayButtonTapped(_ sender: Any) {

            performSegue(withIdentifier: "unwindSegueToBigDisplay", sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
        tableView.reloadData()

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
    
    func getToDos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataToDos = try? context.fetch(ToDoCoreData.fetchRequest()) as? [ToDoCoreData] {
                if let thetoDos = coreDataToDos {
                    toDos = thetoDos
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskListTableViewCell", for: indexPath)
        let item = toDos[indexPath.row]
        
        if let name = item.name {
            if item.important {
                cell.textLabel?.text = "❗️" + name
            } else {
                cell.textLabel?.text = name
            }
            switch item.type {
            case "Academics":
                cell.backgroundColor = UIColor(red: 0xCE / 0xFF, green: 0x56 / 0xFF, blue: 0x3C / 0xFF, alpha: 0xFF / 0xFF)
            case "Extracurriculars":
                cell.backgroundColor = UIColor(red: 0x4C / 0xFF, green: 0xA7 / 0xFF, blue: 0xB4 / 0xE9, alpha: 0xFF / 0xFF) 
            case "Other":
                cell.backgroundColor = UIColor(red: 0x87 / 0xFF, green: 0xB4 / 0xFF, blue: 0x4D / 0xFF, alpha: 0xFF / 0xFF)
            default:
                print("no return")
            }
 
            
        }
       // print("\(item)")
        
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
            if let task = sender as? ToDoCoreData {
                completeVC.selectedToDo = task
                completeVC.previousVC = self
                
            }
         }
      
    }

 
}

