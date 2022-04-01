//
//  TableVCTableViewController1.swift
//  SearchBarTest
//
//  Created by Kaile Ying on 3/31/22.
//

import UIKit

class TableVCTableViewController1: UITableViewController, UISearchBarDelegate {
    let data = ["PS5", "PS4", "Nintendo Switch", "Iphone13", "Iphone12", "Iphone4s", "Ipad2", "Logitech G502", "G903", "HUAWEI"]
    var filteredData: [String]!


    @IBOutlet weak var Searchbar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Searchbar.delegate = self
        
        filteredData = data

}

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        cell.textLabel?.text = filteredData[indexPath.row]
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        
        if searchText == "" {
            filteredData = data
        }
        
        else {
            

            for item in data{
                if item.lowercased().contains( searchText.lowercased()){
                    filteredData.append(item)
                }
            }
        }
        
        self.tableView.reloadData()
    }

}

