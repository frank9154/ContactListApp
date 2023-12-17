//
//  DetailViewController.swift
//  ContactListApp
//
//  Created by Александр Соколов on 17.12.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let person = person {
            nameLabel.text = person.fullName
            emailLabel.text = person.email
            phoneLabel.text = person.phone
        }
    }
    

}
