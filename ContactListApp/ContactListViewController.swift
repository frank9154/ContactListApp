//
//  ContactListViewController.swift
//  ContactListApp
//
//  Created by Александр Соколов on 16.12.2023.
//

import UIKit

final class ContactListViewController: UITableViewController {

    
    //@IBOutlet weak var tableView: UITableViewCell!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var people = [Person]()
        let dataStore = DataStore()
        
        /*
        tableView.delegate = self
        tableView.dataSource = self
         */
        
        for _ in 1...20 {
            let randomPerson = dataStore.generateRandomPerson()
            people.append(randomPerson)
            
            
            // Uncomment the following line to preserve selection between presentations
            // self.clearsSelectionOnViewWillAppear = false
            
            // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
            // self.navigationItem.rightBarButtonItem = self.editButtonItem
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return people.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
            let person = people[indexPath.row]
            cell.textLabel?.text = person.fullName
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedPerson = people[indexPath.row]
            showPersonDetails(person: selectedPerson)
        }
        
        func showPersonDetails(person: Person) {
            let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            detailViewController.person = person
            navigationController?.pushViewController(detailViewController, animated: true)
        }
        
        
        /*
         // MARK: - Table view data source
         
         override func numberOfSections(in tableView: UITableView) -> Int {
         // #warning Incomplete implementation, return the number of sections
         return 0
         }
         
         override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         // #warning Incomplete implementation, return the number of rows
         return 0
         }
         
         
         */
        /*
         override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
         
         // Configure the cell...
         
         return cell
         }
         */
        
        /*
         // Override to support conditional editing of the table view.
         override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
         return true
         }
         */
        
        /*
         // Override to support editing the table view.
         override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
         // Delete the row from the data source
         tableView.deleteRows(at: [indexPath], with: .fade)
         } else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
         }
         */
        
        /*
         // Override to support rearranging the table view.
         override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
         
         }
         */
        
        /*
         // Override to support conditional rearranging of the table view.
         override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the item to be re-orderable.
         return true
         }
         */
        
        
        //MARK: - Navigation
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            //if segue.identifier == "showDetailSegue" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let detailViewController = segue.destination as? DetailViewController
                    //let selectedPerson = people[indexPath.row]
                    detailViewController?.person = people[indexPath.row]
                }
            }
        

    }

