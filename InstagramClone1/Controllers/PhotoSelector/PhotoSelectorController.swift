//
//  PhotoSelectorController.swift
//  InstagramClone1
//
//  Created by Дмитрий Папушин on 21.04.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import UIKit

// MARK: - Lesson 2

class PhotoSelectorController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .purple
        
        navButtons()
    }
    
    fileprivate func navButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.leftBarButtonItem?.tintColor = .red
        
    }
    
    @objc fileprivate func handleNext() {
        print("Try to go next...")
    }
    
    @objc fileprivate func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
}
