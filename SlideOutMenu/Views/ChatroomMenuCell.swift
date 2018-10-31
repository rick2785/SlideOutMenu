//
//  ChatroomMenuCell.swift
//  SlideOutMenu
//
//  Created by Rickey Hrabowskie on 10/9/18.
//  Copyright © 2018 Rickey Hrabowskie. All rights reserved.
//

import UIKit

class ChatroomMenuCell: UITableViewCell {
    
    let bgView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.2035659254, green: 0.5564914346, blue: 0.4896094799, alpha: 1)
        v.layer.cornerRadius = 5
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        addSubview(bgView)
        bgView.fillSuperview(padding: .init(top: 0, left: 8, bottom: 0, right: 8))
        sendSubviewToBack(bgView)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        bgView.isHidden = !selected
        
//        contentView.backgroundColor = selected ? .orange : .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
