//
//  CustomInputAccessoryView.swift
//  InstagramClone1
//
//  Created by Дмитрий Папушин on 05.08.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import UIKit

class CustomInputAccessoryView: UIView {
    
    let messageInputText: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 18)
        tv.isScrollEnabled = false
        return tv
    }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(handleSendMessage), for: .touchUpInside)
        return button
    }()
    
    let placeholder: UILabel = {
        let label = UILabel()
        label.text = "Enter message..."
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    @objc func handleSendMessage() {
        print("Try to send message")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupShadow(opacity: 0.1, radius: 8, offset: .init(width: 0, height: -8), color: .systemGray)
        autoresizingMask = .flexibleHeight
        configureUIElements()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextChange), name: UITextView.textDidChangeNotification, object: nil)
        
    }
    
    @objc func handleTextChange() {
        placeholder.isHidden = messageInputText.text.count != 0
    }
    
    override var intrinsicContentSize: CGSize {
        return .zero
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func configureUIElements() {
        addSubview(sendButton)
        addSubview(messageInputText)
        
        sendButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 8), size: .init(width: 50, height: 50))
        
        messageInputText.anchor(top: topAnchor, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: sendButton.leadingAnchor, padding: .init(top: 12, left: 4, bottom: 8, right: 8))
        
        addSubview(placeholder)
        placeholder.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: sendButton.leadingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 16))
        placeholder.centerYAnchor.constraint(equalTo: sendButton.centerYAnchor).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
