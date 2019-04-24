//
//  MainMenuViewController.swift
//  TyrellCorp
//
//  Created by Francesco Maria Moneta (BFS EUROPE) on 23/04/2019.
//  Copyright © 2019 wipro.com. All rights reserved.
//

import UIKit



class MainMenuViewController : UIViewController {
    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), style: .grouped)
        
        view.addSubview(tableView)
        
       // setConstraints()
    }
    
    
    func setConstrains(){
        let horizontalConstraint = NSLayoutConstraint()
        horizontalConstraint.
    }
    
}
