//
//  DisplayGroupViewController.swift
//  CheatSheet
//
//  Created by Ekow Buadu on 7/26/18.
//  Copyright © 2018 Ekow Buadu. All rights reserved.
//

import UIKit

class DisplayGroupViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let alist = ["Task A", "Task B", "Task C", "Task D", "Task E"]
    let blist = ["Task taco", "Task burrito", "Task C", "Task D", "Task E"]
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (alist.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "displayGroupTableViewCell", for: indexPath) as! DisplayGroupTableViewCell
        cell.taskTitleLabel.text = alist[indexPath.row]
        return cell
    }
}
