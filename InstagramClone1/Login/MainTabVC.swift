//
//  MainTabVC.swift
//  InstagramClone1
//
//  Created by Дмитрий Папушин on 15.12.2019.
//  Copyright © 2019 Дмитрий Папушин. All rights reserved.
//

import UIKit
import Firebase


class MainTabVC: UITabBarController, UITabBarControllerDelegate {
    
    
    // MARK: - Lesson 2
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let index = viewControllers?.firstIndex(of: viewController)
        if index == 2 {
            
            let photoSelectorController = PhotoSelectorController(collectionViewLayout: UICollectionViewFlowLayout())
            let navcontroller = UINavigationController(rootViewController: photoSelectorController)
            present(navcontroller, animated: true, completion: nil)
            
            return false
        }
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        tabBar.tintColor = .black
        
        configure()
        //ifUserLogedIn()

    }
    
    func configure() {
       
       let feed = createNavController(viewController: FeedController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Мероприятия", selectedImage: #imageLiteral(resourceName: "icons8-история-деятельности-30"), unselectedImage: #imageLiteral(resourceName: "icons8-история-деятельности-30"))
        let search = createNavController(viewController: UIViewController(), title: "Рейтинг", selectedImage: #imageLiteral(resourceName: "icons8-медаль-за-третье-место-30"), unselectedImage: #imageLiteral(resourceName: "icons8-медаль-за-третье-место-30"))
        let profile = createNavController(viewController: UserProfileController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Профиль", selectedImage: #imageLiteral(resourceName: "profile_unselected"), unselectedImage: #imageLiteral(resourceName: "icons8-пользователь-30"))
        let newPost = createNavController(viewController: UIViewController(), title: "Связь", selectedImage: #imageLiteral(resourceName: "icons8-веб-камера-на-ноутбуке-30"), unselectedImage: #imageLiteral(resourceName: "icons8-веб-камера-на-ноутбуке-30"))
        let likes = createNavController(viewController: UIViewController(), title: "Выход", selectedImage: #imageLiteral(resourceName: "icons8-выход-30"), unselectedImage: #imageLiteral(resourceName: "icons8-выход-30"))
       
        
        viewControllers = [feed, profile, search, newPost, likes ]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if Auth.auth().currentUser == nil {
            
            let loginVC = LoginController()
            let navController = UINavigationController(rootViewController: loginVC)
            navController.modalPresentationStyle = .fullScreen
            self.present(navController, animated: false, completion: nil)
            
        } else {
            print("USER IS LOGGED IN")

        }
    }
    
//    fileprivate func ifUserLogedIn() {
//
//        if Auth.auth().currentUser == nil {
//            DispatchQueue.main.async {
//                let loginVC = LoginController()
//                let navController = UINavigationController(rootViewController: loginVC)
//                navController.modalPresentationStyle = .fullScreen
//                self.present(navController, animated: false, completion: nil)
//            }
//        } else {
//            print("USER IS LOGGED IN")
//            configure()
//        }
//    }

    fileprivate func createNavController(viewController: UIViewController, title: String, selectedImage: UIImage, unselectedImage: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        viewController.navigationItem.title = title
        
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        
        viewController.view.backgroundColor = .white

        return navController
    }

}
