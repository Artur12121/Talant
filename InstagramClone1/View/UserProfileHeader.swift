//
//  UserProfileHeader.swift
//  InstagramClone1
//
//  Created by Дмитрий Папушин on 01.04.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

extension UIImageView {
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 1
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.30
        pulse.damping = 1.0

        layer.add(pulse, forKey: "pulse")
    }
}

class UserProfileHeader: UICollectionViewCell {
    // step 1
    
    var user: User? {
    
    didSet {
    
    let fullname = user?.name
        nameLabel.text = fullname
        
        guard let url = URL(string: user?.profiliImage ?? "") else {return}
        profileImageView.sd_setImage(with: url, completed: nil)
    }
    
    }
    
    // MARK: - Properties
    
    let profileImageView = CustomUIimageView(frame: .zero)
    
    let nameLabel: UILabel = {
        let label = UILabel()
        //label.text = "Avtondil"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    
    lazy var followingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        
        let attributedText = NSMutableAttributedString(string: "0\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])

        label.attributedText = attributedText
        
        // add gesture recognizer
//        let followTap = UITapGestureRecognizer(target: self, action: #selector(handleFollowingTapped))
//        followTap.numberOfTapsRequired = 1
//        label.isUserInteractionEnabled = true
//        label.addGestureRecognizer(followTap)
        return label
    }()
    

    let gridButton: UIButton = {
        let button = UIButton(type: .system)
       
        return button
    }()
    
    let listButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        return button
    }()
    
    let bookmarkButton: UIButton = {
        let button = UIButton(type: .system)

        button.tintColor = UIColor(white: 0, alpha: 0.2)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        configureUI()
    }
    
    // MARK: - Configure UI
    
    fileprivate func configureUserStatistics() {
        
        let stackView = UIStackView(arrangedSubviews: [followingLabel])
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: profileImageView.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 12, bottom: 0, right: 12), size: .init(width: 0, height: 50))
    }
    
    fileprivate func configureBottomToolBar() {
        
        let topDividerView = UIView()
        topDividerView.backgroundColor = .lightGray
        
        let bottomDividerView = UIView()
        bottomDividerView.backgroundColor = .lightGray
        
        let stackView = UIStackView(arrangedSubviews: [gridButton, listButton, bookmarkButton])
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        addSubview(topDividerView)
        addSubview(bottomDividerView)
        
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 50))
        
        topDividerView.anchor(top: stackView.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0.5))
        
        bottomDividerView.anchor(top: stackView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0.5))
        
    }
    
    fileprivate func configureUI() {
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 12, bottom: 0, right: 0), size: .init(width: 80, height: 80))
        profileImageView.layer.cornerRadius = 80 / 2
        
        
        addSubview(nameLabel)
        nameLabel.anchor(top: profileImageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 20, bottom: 0, right: 0))
        
        configureUserStatistics()
        
 
        
        configureBottomToolBar()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
