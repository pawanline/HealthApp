//
//  ViewController.swift
//  HealthApp
//
//  Created by Pawan Kumar on 27/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var loginImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.emailTextField.backgroundColor = UIColor.white
        self.passwordTextField.backgroundColor = UIColor.white
        self.emailTextField.layer.cornerRadius = 4.0
        self.emailTextField.layer.borderColor = UIColor.systemPurple.cgColor
        self.emailTextField.layer.borderWidth = 1.0
        self.emailTextField.layer.masksToBounds = true
        
        self.passwordTextField.layer.cornerRadius = 4.0
        self.passwordTextField.layer.borderColor = UIColor.systemPurple.cgColor
        self.passwordTextField.layer.borderWidth = 1.0
        self.passwordTextField.layer.masksToBounds = true
        
        self.loginButton.layer.cornerRadius = 16.0
        self.loginImageView.tintColor = UIColor.systemIndigo
    }

    
    // MARK: - IB ACTION
    // MARK: -
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        print("Login Button Clicked")
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let tabBarVC = storyboard.instantiateViewController(withIdentifier: "TabBarControllerVC")
//        self.navigationController?.pushViewController(tabBarVC, animated: false)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let mainTabBarController = storyboard.instantiateViewController(identifier: "TabBarControllerVC")
           
           // This is to get the SceneDelegate object from your view controller
           // then call the change root view controller function to change to main tab bar
           (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    
    
    @IBAction func createAccountTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CreateAccountVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

