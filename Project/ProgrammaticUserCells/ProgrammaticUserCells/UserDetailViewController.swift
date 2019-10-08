//
//  UserDetailViewController.swift
//  ProgrammaticUserCells
//
//  Created by Sam Roman on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    var user: User!
    

    lazy var nameLabel: UILabel = {
           var label = UILabel(frame: CGRect(x: 100, y: 350, width: 400, height: 400))
           return label
       }()

    lazy var phoneLabel: UILabel = {
           var label = UILabel(frame: CGRect(x: 150, y: 400, width: 400, height: 400))
            
           return label
       }()
    
    lazy var emailLabel: UILabel = {
        var label = UILabel(frame: CGRect(x: 100, y: 500, width: 400, height: 400))
         
        return label
    }()
    
    func setConstraints() {
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
        [nameLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor , constant: 0),
        nameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
        phoneLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor , constant: 0),
        phoneLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
        emailLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor , constant: 400),
        emailLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)])
        
    }
    
    
       
    
    override func viewDidLoad() {
        nameLabel.text = "\(user.name.title) \(user.name.first) \(user.name.last) "
        phoneLabel.text = "\(user.phone)"
        emailLabel.text = "\(user.email)"
        self.view.addSubview(nameLabel)
        self.view.addSubview(phoneLabel)
        self.view.addSubview(emailLabel)
        setConstraints()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
