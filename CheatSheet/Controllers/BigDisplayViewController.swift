//
//  BigDisplayViewController.swift
//  CheatSheet
//
//  Created by Ekow Buadu on 8/2/18.
//  Copyright © 2018 Ekow Buadu. All rights reserved.
//

import UIKit

class BigDisplayViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var previousVC = TaskListTableViewController()
    var toDos : [ToDoCoreData] = []{
        didSet{
            BigCollectView.reloadData()
        }
    }
    
    


    @IBOutlet weak var BigCollectView: UICollectionView!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toRoot", sender: self)
    }
    
    
    @IBAction func unwindToBigDisplay(segue:UIStoryboardSegue) {
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // BigCollectView?.register(BigCollectionViewCell.self, forCellWithReuseIdentifier: "cell1")
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return toDos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = BigCollectView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! BigCollectionViewCell
        
        if indexPath.row == 0 {
            cell.backgroundColor = UIColor(red: 0x43 / 0xFF, green: 0x89 / 0xFF, blue: 0xAC / 0xFF, alpha: 0xFF / 0xFF)
            if toDos.isEmpty {
                cell.taskLabel.text = "Empty"
            }
            else {
                cell.taskLabel.text = toDos[0].name
            }
        }
        else if indexPath.row == 1 {
            cell.backgroundColor = UIColor(red: 0x4B / 0xFF, green: 0x9A / 0xFF, blue: 0xC1 / 0xFF, alpha: 0xFF / 0xFF)
            if toDos.isEmpty {
                cell.taskLabel.text = "Empty"
            }
            else {
                cell.taskLabel.text = toDos[1].name
            }
        }
        else if indexPath.row == 2 {
            cell.backgroundColor = UIColor(red: 0x5B / 0xFF, green: 0xB9 / 0xFF, blue: 0xE9 / 0xFF, alpha: 0xFF / 0xFF)
            if toDos.isEmpty {
                cell.taskLabel.text = "Empty"
            }
            else {
                cell.taskLabel.text = toDos[2].name
            }
        }
        cell.layer.cornerRadius = 40.0
        
        cell.indexLabel.text = String(indexPath.row + 1)
        
        
        return cell
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
        
    }
 //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
   
    
    
        // TODO: proper unwrapping
        /* if toDos.isEmpty {
         //   topTaskLabel.text = "None"
            print("1")
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
        */
    }
    

    

    
 /* if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
    

        }

        try? context.save()
        
        navigationController?.popViewController(animated: true)
    }

*/

