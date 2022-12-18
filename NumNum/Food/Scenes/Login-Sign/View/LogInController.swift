//
//  LogInController.swift
//  NumNum
//
//  Created by Ekrem Alkan on 17.12.2022.
//

import UIKit
import Firebase

class LogInController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //MARK: - SignIn Method Firebase
    
    @IBAction func logInBtnTapped(_ sender: Any) {
        if emailTextField.text != nil && passwordTextField.text != nil {
            
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { data, error in
                if error != nil {
                    DuplicateFuncs.alertMessage(title: "Hata!", message: "Email ya da şifre hatalı.", vc: self)
                } else {
                    let controller = self.storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UITabBarController
                    controller.modalPresentationStyle = .fullScreen
                    self.present(controller, animated: true, completion: nil)
                }
            }
            
        }
        
    }
    
    @IBAction func toSignUpVC(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SignUpController") as! SignUpController
        self.present(controller, animated: true)
    }
    
    
    
    
}
