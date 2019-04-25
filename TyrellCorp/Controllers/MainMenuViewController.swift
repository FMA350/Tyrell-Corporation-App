//
//  MainMenuViewController.swift
//  TyrellCorp
//
//  Created by Francesco Maria Moneta (BFS EUROPE) on 23/04/2019.
//  Copyright © 2019 wipro.com. All rights reserved.
//

import UIKit

class MainMenuViewController : UIViewController {
    let cellId = "cellId"
    var userData : UserData = {
       return UserData(email: "", password: "", statusCode: 0)
        
    }()
    
    var rowElements : [String]{
        get{
            if userData.statusCode == NEW_HIRE {
                return ["Mandatory Voight-Kamph test"]
            }
            else if userData.statusCode == DANGEORUS_ANDROID {
                return ["SYSTEM LOCKDOWN IN PLACE", "SYSTEM LOCKDOWN IN PLACE", "SYSTEM LOCKDOWN IN PLACE", "SYSTEM LOCKDOWN IN PLACE", "SYSTEM LOCKDOWN IN PLACE", "SYSTEM LOCKDOWN IN PLACE", "SYSTEM LOCKDOWN IN PLACE","SYSTEM LOCKDOWN IN PLACE"]
            }
            else {
                return ["Target list", "Android traking utility", "Comm. Subsystems", "Police warranty link"]
            }
        }
    }
    
    var backgroundLogo : UIImageView = {
        let img = UIImage(named: "tyrellLogo")
        let imageView = UIImageView(image: img)
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        imageView.alpha = 0.35
        return imageView
    }()
    
    
    var titleLabel : UILabel = {
        let title = UILabel()
        title.text = "Tyrell Corp."
        title.translatesAutoresizingMaskIntoConstraints = false //Without this boolean, the whole thing falls apart...
        title.textColor = .replicantOrange
        title.font = title.font.withSize(36)
         title.backgroundColor = .clear
        title.textAlignment = .center
        return title
    }()

    var tableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.separatorColor = .replicantOrange
//        this won't work...
//        table.rowHeight = UITableView.automaticDimension
//        table.estimatedRowHeight = 44.0
        return table
    }()
    
    var logoutButton : UIButton = {
       let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logout", for: .normal)
        button.backgroundColor = .replicantOrange
        button.addTarget(self, action: #selector(logout), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)

          setupProperties()
          addSubviews()
          setConstrains()
    }
    
    func setupProperties(){
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    func addSubviews(){
        view.addSubview(backgroundLogo)
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        view.addSubview(logoutButton)
    }
    
    func setConstrains(){
        let x = UIScreen.main.bounds.width
        let y = UIScreen.main.bounds.height
        
        backgroundLogo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        backgroundLogo.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        backgroundLogo.widthAnchor.constraint(equalToConstant: x*0.9).isActive = true
        backgroundLogo.heightAnchor.constraint(equalTo: backgroundLogo.widthAnchor).isActive = true
        
        titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: x*0.2).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: y*0.1).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive   = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 5).isActive = true
        
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive   = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 5).isActive = true

        tableView.heightAnchor.constraint(greaterThanOrEqualToConstant: y*0.2).isActive = true //if less then this, tableview won't show!
        tableView.widthAnchor.constraint(equalToConstant: x*0.8).isActive = true
        
        logoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        logoutButton.widthAnchor.constraint(equalToConstant: x*0.9).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTest"{
            let nextVC = segue.destination as! TestViewController
            nextVC.userDataDelegate = self
        }
    }
    
    @objc func logout(){
        self.dismiss(animated: true, completion: nil)
    }

    
}

extension MainMenuViewController : UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension MainMenuViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return rowElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = rowElements[indexPath.row]
        cell.textLabel?.textColor = .replicantOrange
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.backgroundColor = .clear
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.textLabel?.text == "Mandatory Voight-Kamph test" {
            performSegue(withIdentifier: "toTest", sender: self)

        }
    }
}


extension MainMenuViewController : UserDataDelegate {
    func changeCurrentUserStatus(status: Int) {
        //TODO check that value is only between allowed values
        userData.statusCode = status
        saveUserData(userData: userData)
        self.tableView.reloadData()
    }
}




