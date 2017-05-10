//
//  StudentTableViewController.swift
//  ManageStudent
//
//  Created by healer on 5/6/17.
//  Copyright © 2017 healer. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController {

    let searchController = UISearchController(searchResultsController: nil)
    var FilteredStudents = [Student]()
     var Students = [Student(name: "Bui Tan Hien", university: "HCMUTE", description: "Student of FIT",yearOld: 22), Student(name: "Name1", university: "HCMUTE", description: "Student of FIT",yearOld: 22), Student(name: "Name2", university: "HCMUTE", description: "Student of FIT",yearOld: 22), Student(name: "Name3", university: "HCMUTE", description: "Student of FIT",yearOld: 22), Student(name: "Name4", university: "HCMUTE", description: "Student of FIT",yearOld: 22)]
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        searchController.searchResultsUpdater = self as UISearchResultsUpdating
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    override func viewWillAppear(_ animated: Bool) {
        if NewStudent.isLoadData {
            let student: Student = NewStudent.student
            Students.append(student)
            tableView.reloadData()
            NewStudent.isLoadData = false
        }
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All"){
        FilteredStudents = Students.filter{
            st in
            return st.getName().lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(searchController.isActive && searchController.searchBar.text != ""){
            return FilteredStudents.count
        }
        return Students.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for:
            indexPath) as! StudentTableViewCell
        let student : Student
        if(searchController.isActive && searchController.searchBar.text != ""){
            student = FilteredStudents[indexPath.row]
        }
        else{
            student = Students[indexPath.row]
        }
        cell.name.text = student .getName()
        cell.age.text = String(student.getYearOld())
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            Students.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // get student dragging
        
        let student = Students[fromIndexPath.row]
        // remove event dragging
        Students.remove(at: fromIndexPath.row)
        // insert event into new possition
        Students.insert(student, at: to.row)


    }
 

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "Detail"){
            if let index = self.tableView.indexPathForSelectedRow{
               let detail  = segue.destination as! StudentDetailViewController
                if(searchController.isActive && searchController.searchBar.text != ""){
                    detail.infoStudent = FilteredStudents[index.row]
                }
                else{
                    detail.infoStudent = Students[index.row]
                }
            }
        }
        
    }
    

}

extension StudentTableViewController: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
   
}
