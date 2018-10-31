//
//  CustomMenuHeaderView.swift
//  SlideOutMenu
//
//  Created by Rickey Hrabowskie on 10/2/18.
//  Copyright © 2018 Rickey Hrabowskie. All rights reserved.
//

import UIKit

class CustomMenuHeaderView: UIView {
    
    let nameLabel = UILabel()
    let usernameLabel = UILabel()
    let statsLabel = UILabel()
    let profileImageView = ProfileImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupComponentProps()
        setupStackView()
    }
    
    fileprivate func setupComponentProps() {
        nameLabel.text = "Rickey Hrabowskie"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        usernameLabel.text = "@rickmoss84"
        statsLabel.text = "42 Following 7091 Followers"
        profileImageView.image = #imageLiteral(resourceName: "user_photo")
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.layer.cornerRadius = 48 / 2
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = .red
        
        setupStatsAttributedText()
    }
    
    fileprivate func setupStatsAttributedText() {
        statsLabel.font = UIFont.systemFont(ofSize: 14)
        let attributedText = NSMutableAttributedString(string: "42 ", attributes: [.font: UIFont.systemFont(ofSize: 17, weight: .medium)])
        attributedText.append(NSAttributedString(string: "Following ", attributes: [.foregroundColor: UIColor.black]))
        attributedText.append(NSAttributedString(string: "7091 ", attributes: [.font: UIFont.systemFont(ofSize: 17, weight: .medium)]))
        attributedText.append(NSAttributedString(string: "Followers", attributes: [.foregroundColor: UIColor.black]))
        
        statsLabel.attributedText = attributedText
    }
    
    fileprivate func setupStackView() {
        let rightSpacerView = UIView()
        let arrangedSubviews = [
//            UIView(),
            UIStackView(arrangedSubviews: [profileImageView, rightSpacerView]),
            nameLabel,
            usernameLabel,
            SpacerView(space: 16),
            statsLabel
        ]
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.spacing = 4
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
