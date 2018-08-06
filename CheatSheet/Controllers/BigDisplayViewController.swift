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

    @IBOutlet weak var bigCollectView: UICollectionView!
    
    
    
    
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
        // TODO: proper unwrapping
        if toDos.isEmpty {
            topTaskLabel.text = "None"
        } else {
            topTaskLabel.text = toDos[0].name
            if let item = toDos[0].type {
                switch item {
                case "Academics":
                    bigCollectView.backgroundColor = UIColor(red: 0xCE / 0xFF, green: 0x56 / 0xFF, blue: 0x3C / 0xFF, alpha: 0xFF / 0xFF)
                case "Extracurriculars":
                    bigCollectView.backgroundColor = UIColor(red: 0x4C / 0xFF, green: 0xA7 / 0xFF, blue: 0xB4 / 0xE9, alpha: 0xFF / 0xFF)
                case "Other":
                    bigCollectView.backgroundColor = UIColor(red: 0x87 / 0xFF, green: 0xB4 / 0xFF, blue: 0x4D / 0xFF, alpha: 0xFF / 0xFF)
                default:
                    bigCollectView.backgroundColor = UIColor(red: 0xCE / 0xFF, green: 0x56 / 0xFF, blue: 0x3C / 0xFF, alpha: 0xFF / 0xFF)
                    print("no return")
                }
            }
        }
        
    }
    
}
    

    
 /* if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
    

        }

        try? context.save()
        
        navigationController?.popViewController(animated: true)
    }

*/

