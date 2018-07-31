//
//  PersonViewController.swift
//  iOS-exam
//
//  Created by Hung Ricky on 2018/7/31.
//  Copyright © 2018年 Hung Ricky. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet weak var personTableView: UITableView!
    var persons = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()

        personTableView.dataSource = self
        personTableView.delegate = self
        
        self.getPersonData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getPersonData() {
        
        guard let url = URL(string: RequestURL.server) else {
            self.showErrorMessage(message: ErrorMessage.urlNull.rawValue)
            return
        }

        if let cacheData = CacheManager.shared.getFromCache(key: url.absoluteString) as? Data {
            self.persons = self.parseJsonData(data: cacheData)

            OperationQueue.main.addOperation {
                self.personTableView.reloadData()
            }
            return
        } else {
            NetworkManager.getData(with: url) { (data, error) in
                var mockData = data
                if url.absoluteString == RequestURL.server {
                    mockData = RequestURL.testPersonJson
                } else
                if let error = error {
                    self.showErrorMessage(message: error)
                    return
                }

                if let urlData = mockData {
                    self.persons = self.parseJsonData(data: urlData)
                    CacheManager.shared.cache(object: urlData as AnyObject, key: url.absoluteString)

                    OperationQueue.main.addOperation {
                        self.personTableView.reloadData()
                    }
                }
            }
        }
    }
    
    // 運用Codable解析Json
    func parseJsonData(data: Data) -> [Person] {
        
        var personData = [Person]()
        let decoder = JSONDecoder()
        
        do {
            let personDataStore = try decoder.decode(PersonDataStore.self, from: data)
            personData = personDataStore.persons
        } catch {
            self.showErrorMessage(message: error.localizedDescription)
        }
        
        return personData
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueID.personDetail {
            let personDetailView = segue.destination as! PersonDetailViewController
            if let indexPath = personTableView.indexPathForSelectedRow {
                personDetailView.person = persons[indexPath.row]
            }
        }
    }

}

// MARK - UITableViewDataSource
extension PersonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.person, for: indexPath) as! PersonTableViewCell

        // Configure the cell...
        cell.firstNameLabel.text = persons[indexPath.row].firstName
        cell.lastNameLabel.text = persons[indexPath.row].lastName
        
        return cell
    }

}

// MARK - UITableViewDelegate
extension PersonViewController: UITableViewDelegate {
    
}
