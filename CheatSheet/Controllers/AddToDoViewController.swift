//
//  AddToDoViewController.swift
//  CheatSheet
//
//  Created by Ekow Buadu on 7/31/18.
//  Copyright © 2018 Ekow Buadu. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var previousVC = ListGroupsTableViewController()

    @IBOutlet weak var typeOptionsControl: UISegmentedControl!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
      /*  let toDo = ToDo()
        
        if let titleText = titleTextField.text {
            toDo.name = titleText
            toDo.important = importantSwitch.isOn
            
            previousVC.toDos.append(toDo)
            previousVC.tableView.reloadData()
            
            navigationController?.popViewController(animated: true)
        }
 */
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
            
            
            
            if let titleText = titleTextField.text {
                if titleText.isEmpty {
                    toDo.name = "No Title"
                } else {
                    toDo.name = titleText
                    toDo.important = importantSwitch.isOn
                }
               switch typeOptionsControl.selectedSegmentIndex {
                case 0:
                    toDo.type = "Academics"
                case 1:
                    toDo.type = "Extracurriculars"
                case 2:
                    toDo.type = "Other"
                default:
                    print("unexpected segmented index")
                }
 

            }
            try? context.save()
            
            performSegue(withIdentifier: "unwindSegueToTaskList", sender: self)
            
            navigationController?.popViewController(animated: true)
        }
        
        
        

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
