//
//  PersonDetailViewController.swift
//  iOS-exam
//
//  Created by Hung Ricky on 2018/7/31.
//  Copyright © 2018年 Hung Ricky. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    @IBOutlet weak var personDetailTableView: UITableView!

    var person: Person!
    var personArray: [[String?]]!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        personArray = person.personToArray()
        personDetailTableView.dataSource = self
        personDetailTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK - UITableViewDataSource
extension PersonDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return personArray[0].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return personArray[0][section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.personDetail, for: indexPath) as! PersonDetailTableViewCell
        
        // Configure the cell...
        cell.textLabel?.text = personArray[1][indexPath.section]
        
        return cell
    }
    
}

// MARK - UITableViewDelegate
extension PersonDetailViewController: UITableViewDelegate {
    
}

