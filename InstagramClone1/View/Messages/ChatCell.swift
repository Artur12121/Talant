//
//  ChatCell.swift
//  InstagramClone1
//
//  Created by Дмитрий Папушин on 27.05.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import UIKit

class ChatCell: UICollectionViewCell {
    
    fileprivate let profileImageView = CustomUIimageView(frame: .zero)
    
    fileprivate let textView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .clear
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.isScrollEnabled = false
        tv.isEditable = false
        tv.textColor = .black
        tv.text = "Hello world"
        return tv
    }()
    
    fileprivate let bubbleMessageContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemFill
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUIElements()
    }
    
    fileprivate func configureUIElements() {
        
        addSubview(profileImageView)
        profileImageView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: -8, right: 0), size: .init(width: 32, height: 32))
        profileImageView.layer.cornerRadius = 32 / 2
        
        addSubview(bubbleMessageContainerView)
        bubbleMessageContainerView.layer.cornerRadius = 12
        
        bubbleMessageContainerView.anchor(top: topAnchor, leading: profileImageView.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 12, bottom: 0, right: 0))
        bubbleMessageContainerView.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
        
        bubbleMessageContainerView.addSubview(textView)
        textView.anchor(top: bubbleMessageContainerView.topAnchor, leading: bubbleMessageContainerView.leadingAnchor, bottom: bubbleMessageContainerView.bottomAnchor, trailing: bubbleMessageContainerView.trailingAnchor)
        
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
