//
//  CoreDataHelper.swift
//  CheatSheet
//
//  Created by Ekow Buadu on 8/8/18.
//  Copyright © 2018 Ekow Buadu. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    static func newToDo() -> ToDoCoreData {
        let aTask = NSEntityDescription.insertNewObject(forEntityName: "ToDoCoreData", into: context) as! ToDoCoreData
        
        return aTask
    }
    static func saveToDo() {
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    static func delete(aTask: ToDoCoreData) {
        context.delete(aTask)
        
        saveToDo()
    }
    static func retrieveToDos() -> [ToDoCoreData] {
        do {
            let fetchRequest = NSFetchRequest<ToDoCoreData>(entityName: "ToDoCoreData")
            let results = try context.fetch(fetchRequest)
            print("\(results)")
            return results
            
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            return []
        }
    }
}
