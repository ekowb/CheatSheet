//
//  ListGroupsTableViewController.swift
//  CheatSheet
//
//  Created by Ekow Buadu on 7/24/18.
//  Copyright © 2018 Ekow Buadu. All rights reserved.
//

import UIKit

class ListGroupsTableViewController: UITableViewController {
    
    var subject: [Groups] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let list = [academics.title, extracurriculars.title, lifeAndHealth.title, workAndFinance.title, other.title]
    let colors = [UIColor(red: 0xF3 / 0xFF, green: 0xB7 / 0xFF, blue: 0x45 / 0xFF, alpha: 0xFF / 0xFF),
                  UIColor(red: 0xCE / 0xFF, green: 0x56 / 0xFF, blue: 0x3C / 0xFF, alpha: 0xFF / 0xFF),
                  UIColor(red: 0x39 / 0xFF, green: 0x39 / 0xFF, blue: 0x39 / 0xFF, alpha: 0xFF / 0xFF),
                  UIColor(red: 0x87 / 0xFF, green: 0xB4 / 0xFF, blue: 0x4D / 0xFF, alpha: 0xFF / 0xFF),
                  UIColor(red: 0x4C / 0xFF, green: 0xA7 / 0xFF, blue: 0xB4 / 0xE9, alpha: 0xFF / 0xFF),]
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listGroupsTableViewCell", for: indexPath) as! ListGroupsTableViewCell
        if indexPath.row == 1 {
            
        }
        
        cell.groupTitleLabel1?.text = list[indexPath.row]
        cell.groupTitleView.backgroundColor = colors[indexPath.row]
        return cell
    }
}
