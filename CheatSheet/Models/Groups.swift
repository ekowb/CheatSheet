//
//  Groups.swift
//  CheatSheet
//
//  Created by Ekow Buadu on 7/26/18.
//  Copyright © 2018 Ekow Buadu. All rights reserved.
//

import Foundation

class GroupList {
    var groupsList: [GroupList] = []
}

struct Groups {
    var title = ""
    var tasks = [String]()
}

var currentGroup = GroupList()

// groups
let general = Groups(title: "General", tasks: ["0", "1", "2", "3", "4"])
let academics = Groups(title: "Academics", tasks: ["1", "2", "3", "4", "5"])
let extracurriculars = Groups(title: "Extracurriculars", tasks: ["6", "7", "8", "9", "10"])
let lifeAndHealth = Groups(title: "Life & Health", tasks: ["11", "12", "13", "14", "15"])
let workAndFinance = Groups(title: "Work & Finance", tasks: ["16", "17", "18", "19", "20"])
let other = Groups(title: "Other", tasks: ["21", "22", "23", "24", "25"])


// predicates
let pred1 = NSPredicate(format: "title contains %@", academics.title)
let pred2 = NSPredicate(format: "title contains %@", extracurriculars.title)
let pred3 = NSPredicate(format: "title contains %@", lifeAndHealth.title)
let pred4 = NSPredicate(format: "title contains %@", workAndFinance.title)
let pred5 = NSPredicate(format: "title contains %@", other.title)


