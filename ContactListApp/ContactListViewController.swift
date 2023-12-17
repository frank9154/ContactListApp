//
//  ContactListViewController.swift
//  ContactListApp
//
//  Created by Александр Соколов on 16.12.2023.
//

import UIKit

final class ContactListViewController: UITableViewController {

    
    //@IBOutlet weak var tableView: UITableView!
    
    //private var contactList = Person.generateRandomPerson()
    
    
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

