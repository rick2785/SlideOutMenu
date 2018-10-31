//
//  ListsController.swift
//  SlideOutMenu
//
//  Created by Rickey Hrabowskie on 10/6/18.
//  Copyright © 2018 Rickey Hrabowskie. All rights reserved.
//

import UIKit

class ListsController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.title = "Lists"
        navigationController?.navigationBar.prefersLargeTitles = true 
        
        let label = UILabel()
        label.text = "Lists"
        label.font = UIFont.boldSystemFont(ofSize: 64)
        label.frame = view.frame
        label.textAlignment = .center
        
        view.addSubview(label)
    }
}
