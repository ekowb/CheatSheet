//
//  CompleteTaskViewController.swift
//  CheatSheet
//
//  Created by Ekow Buadu on 8/1/18.
//  Copyright © 2018 Ekow Buadu. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    var previousVC = TaskListTableViewController()
    var selectedToDo : ToDoCoreData?


    @IBOutlet weak var taskDisplayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDisplayLabel.text = selectedToDo?.name
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0x22 / 0xFF, green: 0x28 / 0xFF, blue: 0x2C / 0xFF, alpha: 0xFF / 0xFF)
        let textAttributes = [NSAttributedStringKey.foregroundColor : UIColor(red: 0xF0 / 0xFF, green: 0xC1 / 0xFF, blue: 0x42 / 0xFF, alpha: 0xFF / 0xFF)]
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0xF0 / 0xFF, green: 0xC1 / 0xFF, blue: 0x42 / 0xFF, alpha: 0xFF / 0xFF)
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        // Do any additional setup after loading the view.
    }
    
    func finishTask() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theToDo = selectedToDo {
                //TODO:
                context.delete(theToDo)
                try! context.save()
            }
        }
    }
    
    
    
    @IBAction func completeButtonTapped(_ sender: UIButton) {
        finishTask()
        
     /*   if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theToDo = selectedToDo {
                //TODO:
                context.delete(theToDo)
                try! context.save()
                */
                navigationController?.popViewController(animated: true)
        }
        
        
        /*
        var index = 0
        for toDo in previousVC.toDos {
            if toDo.name == selectedToDo.name {
                previousVC.toDos.remove(at: index)
                previousVC.tableView.reloadData()
                navigationController?.popViewController(animated: true)
                break
            }
         
            index += 1
        }
 */
    }
