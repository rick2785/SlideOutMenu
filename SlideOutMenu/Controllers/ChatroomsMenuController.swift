//
//  ChatroomsMenuController.swift
//  SlideOutMenu
//
//  Created by Rickey Hrabowskie on 10/9/18.
//  Copyright © 2018 Rickey Hrabowskie. All rights reserved.
//

import UIKit

extension ChatroomsMenuController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            filteredResults = chatroomGroups
            tableView.reloadData()
            return
        }
        
        print(searchText)
//        var results = [[String]]()
//
//        chatroomGroups.forEach { (group) in
//            let filteredGroup = group.filter({ (chatroomName) -> Bool in
//                return chatroomName.lowercased().contains(searchText.lowercased())
//            })
//
//            results.append(filteredGroup)
//        }
        
        filteredResults = chatroomGroups.map({ (group) -> [String] in
            return group.filter { $0.lowercased().contains(searchText.lowercased())}
        })
        
//        print(results)
//        filteredResults = results
        tableView.reloadData()
    }
}

class ChatroomsMenuController: UITableViewController {
    
    let chatroomGroups = [
        ["general", "introductions"],
        ["jobs"],
        ["Brian Voong", "Steve Jobs", "Tim Cook", "Barack Obama"]
    ]
    
    var filteredResults = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredResults = chatroomGroups
        tableView.backgroundColor = .purple
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 0.2980392157, green: 0.2078431373, blue: 0.2862745098, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "UNREADS" : section == 1 ? "CHANNELS" : "DIRECT MESSAGES"
    }
    
    fileprivate class ChatroomHeaderLabel: UILabel {
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.insetBy(dx: 16, dy: 0))
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let text = section == 0 ? "UNREADS" : section == 1 ? "CHANNELS" : "DIRECT MESSAGES"
        
        let label = UILabel()
        label.text = text
        label.textColor = #colorLiteral(red: 0.4282991588, green: 0.364263773, blue: 0.4199032485, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.2980392157, green: 0.2078431373, blue: 0.2862745098, alpha: 1)
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return filteredResults.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredResults[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatroomMenuCell(style: .default, reuseIdentifier: nil)
        
        let text = filteredResults[indexPath.section][indexPath.row]
        cell.textLabel?.text = text
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        let attributedText = NSMutableAttributedString(string: "# ", attributes: [.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), .font: UIFont.systemFont(ofSize: 18, weight: .regular)])
        attributedText.append(NSAttributedString(string: text, attributes: [.foregroundColor: UIColor.white]))
        cell.textLabel?.attributedText = attributedText
        return cell
    }
}
