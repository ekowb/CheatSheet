//
//  BigDisplayViewController.swift
//  CheatSheet
//
//  Created by Ekow Buadu on 8/2/18.
//  Copyright © 2018 Ekow Buadu. All rights reserved.
//

import UIKit

class BigDisplayViewController: UIViewController {
    
    
    var previousVC = TaskListTableViewController()
    var toDos : [ToDoCoreData] = []

    @IBOutlet weak var topTaskLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toRoot", sender: self)
    }
    
    @IBAction func unwindToBigDisplay(segue:UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        // Do any additional setup after loading the view.
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
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
        topTaskLabel.text = "Top Task: \(toDos[0].name ?? "")"
    }
    

    
 /*  if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
        if let titleText = titleTextField.text {
            if titleText.isEmpty {
                toDo.name = "No Title"
            } else {
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
            }

        }

        try? context.save()
        
        navigationController?.popViewController(animated: true)
    }
 */

}
