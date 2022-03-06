//
//  LoginViewController.swift
//  macaroons
//
//  Created by Stanislav Tereshchenko on 08.02.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    


   
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])

        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        loginButton.layer.cornerRadius = 20
        loginButton.clipsToBounds = true
        
        let emailImage = UIImage(systemName: "envelope")
        addLeftImageTo(textField: emailTextField, andImage: emailImage!)
        
        let lockImage = UIImage(systemName: "lock")
        addLeftImageTo(textField: passwordTextField, andImage: lockImage!)
        

        enablePasswordToggle().self
        
    }
    
    @IBAction func loginButtonTochDown(_ sender: Any) {
        allertNotification()
        allertPasswordNotification()
        checkPasswordCount()
    }
    
    func addLeftImageTo(textField: UITextField, andImage img: UIImage) {
        
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 66.0, height: 66.0))
        
        leftImageView.image = img
        textField.leftView = leftImageView
        textField.leftViewMode = .always
        
    }
    
    func addRightImageTo(textField: UITextField, andImage img: UIImage) {
        
        let rightImageView = UIImageView(
            frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height)
        )
        
        rightImageView.image = img
        textField.rightView = rightImageView
        textField.rightViewMode = .always
    }
    
    let button = UIButton(type: .custom)
    
    func enablePasswordToggle() {

        button.setImage(UIImage(systemName: "eye.slash"), for: .normal )
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        passwordTextField.rightView = button
        passwordTextField.rightViewMode = .whileEditing
        button.alpha = 0.7
      
          }
    
    func showAllert() {
        
        let allert = UIAlertController(title: "Ooops", message: "Login requires email and password", preferredStyle: UIAlertController.Style.alert)
        allert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(allert, animated: true, completion: nil)
        
    }
    
    func allertNotification() {
        
        if let emailText = emailTextField.text, emailText.isEmpty {
            showAllert()
        } else {
            
        }
    }
    
    func allertPasswordNotification() {
        
        if let passwordText = passwordTextField.text, passwordText.isEmpty {
            showAllert()
        }
    }
    
    func showAllert1() {
        
        let allert = UIAlertController(title: "Ooops", message: "Password must contain minimum 6 characters", preferredStyle: UIAlertController.Style.alert)
        allert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(allert, animated: true, completion: nil)
        
    }
    
    func checkPasswordCount() {
        
        let passwordCount = passwordTextField.text
        if  passwordCount!.count < 6 {
            showAllert1()
        }
    }
    
    var buttonClick = true
    
    @IBAction func togglePasswordView(_ sender: Any) {
        
        if (buttonClick == true) {
            
            passwordTextField.isSecureTextEntry = false
            
        } else {
            
            passwordTextField.isSecureTextEntry = true
            
        }
        
        buttonClick = !buttonClick
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
