//
//  LoginController.swift
//  InstagramClone1
//
//  Created by Дмитрий Папушин on 23.11.2019.
//  Copyright © 2019 Дмитрий Папушин. All rights reserved.
//

import UIKit
import Firebase
class LoginController: UIViewController {

    
    // MARK: - Properties
    
    fileprivate let logoContainerView: UIView = {
        let view = UIView()
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Лого новый").withRenderingMode(.alwaysOriginal))
        logoImageView.contentMode = .scaleAspectFill
        
        view.addSubview(logoImageView)
        logoImageView.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 0, left: 20, bottom: 0, right: 0), size: .init(width: 200, height: 200))
        logoImageView.centerInSuperview()
        view.backgroundColor = UIColor.rgb(red: 95, green: 125, blue: 225)
        return view
    }()
    
    fileprivate let emailTextField = UITextField.setupTextField(placeholder: "Логин...", hideText: false)
    fileprivate let passwordTextField = UITextField.setupTextField(placeholder: "Пароль...", hideText: true)
    fileprivate let loginButton = UIButton.setupButton(title: "Вход", color: UIColor.rgb(red: 95, green: 125, blue: 225))
    
    fileprivate let dontHaveAccountbutton: UIButton = {
        let button = UIButton(type: .system)
        // первая часть кнопки
        let attributedTitle = NSMutableAttributedString(string: "", attributes: [.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor.lightGray])
        // вторая часть кнопки
        attributedTitle.append(NSAttributedString(string: "", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .heavy), .foregroundColor: UIColor.rgb(red: 95, green: 125, blue: 225)]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(goToSignUP), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Handlers
    
    @objc fileprivate func goToSignUP() {
        let signUPcontroller = SignUPController()
        let navController = UINavigationController(rootViewController: signUPcontroller)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)

            }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        setupTapGesture()
        
        handlers()
    }
    
    fileprivate func handlers() {
        emailTextField.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    
    // MARK: - HandleLogin
    
    @objc fileprivate func handleLogin() {
        
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, err) in
            
            if let err = err {
                print("Failed to login with error:", err.localizedDescription)
                return
            }
            
            print("Successfuly signed user in")
            
            let maintabVC = MainTabVC()
            maintabVC.modalPresentationStyle = .fullScreen
            self.present(maintabVC, animated: true, completion: nil)
            
        }
    }
    
    @objc fileprivate func formValidation() {
        guard
        emailTextField.hasText,
        passwordTextField.hasText
         else {
            self.loginButton.isEnabled = false
            self.loginButton.backgroundColor = UIColor.rgb(red: 95, green: 125, blue: 225)
                return
        }
        
        loginButton.isEnabled = true
        loginButton.backgroundColor = UIColor.rgb(red: 95, green: 125, blue: 225)
    }

    
    fileprivate func configureViewComponents() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
        view.addSubview(logoContainerView)
        logoContainerView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: 0, height: 350))
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.anchor(top: logoContainerView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 40, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 180))
        
        view.addSubview(dontHaveAccountbutton)
        dontHaveAccountbutton.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 40, bottom: 10, right: 40))
    }
    
    // MARK: - Keyboard
    
    fileprivate func setupTapGesture() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss)))
    }
    
    @objc fileprivate func handleTapDismiss() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
//    DispatchQueue.main.async {
//
//        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
//
//        if let mainTabVC = keyWindow?.rootViewController as? MainTabVC {
//            
//            mainTabVC.configure()
//        }
//            
//            self.dismiss(animated: true, completion: nil)
//    }
    
//    DispatchQueue.main.async {
//     
//    let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
//     
//    if let homeController = keyWindow?.rootViewController as? HomeController {
//     
//    homeController.configure()
//     
//    }
//    }


}
