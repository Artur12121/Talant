//
//  CustomUIimageView.swift
//  InstagramClone1
//
//  Created by Дмитрий Папушин on 01.05.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import UIKit

class CustomUIimageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    private func configure() {
        
       contentMode = .scaleAspectFill
       backgroundColor = .lightGray
       clipsToBounds = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
