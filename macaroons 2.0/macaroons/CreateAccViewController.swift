//
//  CreateAccViewController.swift
//  macaroons
//
//  Created by Stanislav Tereshchenko on 13.02.2022.
//

import UIKit

class CreateAccViewController: UIViewController {

    @IBOutlet weak var fullNameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextfield: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        fullNameTextField.attributedPlaceholder = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        phoneTextField.attributedPlaceholder = NSAttributedString(string: "Phone", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password(Atleast 6 characters)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        confirmPasswordTextfield.attributedPlaceholder = NSAttributedString(string: "Confirm Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        signUpButton.layer.cornerRadius = 20
        signUpButton.clipsToBounds = true
        
        let personImage = UIImage(systemName: "person")
        addLeftImageTo(textField: fullNameTextField, andImage: personImage!)
        
        let phoneImage = UIImage(systemName: "iphone")
        addLeftImageTo(textField: phoneTextField, andImage: phoneImage!)
        
        let emailImage = UIImage(systemName: "envelope")
        addLeftImageTo(textField: emailTextField, andImage: emailImage!)
        
        let lockImage1 = UIImage(systemName: "lock")
        addLeftImageTo(textField: passwordTextField, andImage: lockImage1!)
        
        let lockImage2 = UIImage(systemName: "lock")
        addLeftImageTo(textField: confirmPasswordTextfield, andImage: lockImage2!)
    }
    
    @IBAction func signUpButtonTochDown(_ sender: Any) {
        
        checkName()
        checkPhone()
        checkEmail()
        checkPassword()
        checkConfirmPassword()
        checkPasswordCount()
        checkPasswordsMatch()
    }
     
    func showAllert1() {
        
        let allert = UIAlertController(title: "Ooops", message: "Name field must be filled", preferredStyle: UIAlertController.Style.alert)
        allert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(allert, animated: true, completion: nil)
        
    }
    
    func checkName() {
        
        if let nameText = fullNameTextField.text, nameText.isEmpty { 
            showAllert1()
        }
    
    }
    
    func showAllert2() {
        
        let allert = UIAlertController(title: "Ooops", message: "Phone field must be filled", preferredStyle: UIAlertController.Style.alert)
        allert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(allert, animated: true, completion: nil)
        
    }
    
    func checkPhone() {
        
        if let phoneText = phoneTextField.text, phoneText.isEmpty {
            showAllert2()
        }
    }
    
    func showAllert3() {
        
        let allert = UIAlertController(title: "Ooops", message: "Email field must be filled", preferredStyle: UIAlertController.Style.alert)
        allert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(allert, animated: true, completion: nil)
        
    }
    
    func checkEmail() {
        
        if let emailText = emailTextField.text, emailText.isEmpty {
            showAllert3()
        }
    }
    
    func showAllert4() {
        
        let allert = UIAlertController(title: "Ooops", message: "Password field must be filled", preferredStyle: UIAlertController.Style.alert)
        allert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(allert, animated: true, completion: nil)
        
    }
    
    func checkPassword() {
        
        if let passwordText = passwordTextField.text, passwordText.isEmpty {
            showAllert4()
        }
    }
    
    func showAllert5() {
        
        let allert = UIAlertController(title: "Ooops", message: "Confirm your password", preferredStyle: UIAlertController.Style.alert)
        allert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(allert, animated: true, completion: nil)
        
    }
    
    func checkConfirmPassword() {
        
        if let confirmPasswordText = confirmPasswordTextfield.text, confirmPasswordText.isEmpty {
            showAllert5()
        }
    }
    
    
    func showAllert6() {
        
        let allert = UIAlertController(title: "Ooops", message: "Passwords must be the same", preferredStyle: UIAlertController.Style.alert)
        allert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(allert, animated: true, completion: nil)
        
    }
    
    func checkPasswordsMatch() {
        
        if passwordTextField.text != confirmPasswordTextfield.text {
            showAllert6()
        } else {
            
        }
    }
    
    func showAllert7() {
        
        let allert = UIAlertController(title: "Ooops", message: "Password must contain minimum 6 characters", preferredStyle: UIAlertController.Style.alert)
        allert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(allert, animated: true, completion: nil)
        
    }
    
    func checkPasswordCount() {
         
        let passwordCount = passwordTextField.text
        let confirmPasswordCount = confirmPasswordTextfield.text
        
        if  passwordCount!.count < 6  && confirmPasswordCount!.count < 6 {
            showAllert7()
        }
    }
    
    
    func addLeftImageTo(textField: UITextField, andImage img: UIImage) {
        
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 66.0, height: 66.0))
        
        leftImageView.image = img
        textField.leftView = leftImageView
        textField.leftViewMode = .always
        
        enablePasswordToggle1().self
        enablePasswordToggle2().self
    }
    
    let button1 = UIButton(type: .custom)
    
    func enablePasswordToggle1() {
        
        button1.setImage(UIImage(systemName: "eye.slash"), for: .normal )
        button1.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        passwordTextField.rightView = button1
        passwordTextField.rightViewMode = .whileEditing
        button1.alpha = 0.7

   
       
          }
 
    var buttonClick1 = true

    @IBAction func togglePasswordView(_ sender: Any) {
        
        if (buttonClick1 == true) {
            
            passwordTextField.isSecureTextEntry = false
            
        } else {
            
            passwordTextField.isSecureTextEntry = true
        }
        
        buttonClick1 = !buttonClick1
        
    }
    
    let button2 = UIButton(type: .custom)
    
    func enablePasswordToggle2() {
        
        button2.setImage(UIImage(systemName: "eye.slash"), for: .normal )
        button2.addTarget(self, action: #selector(togglePasswordView2), for: .touchUpInside)
        confirmPasswordTextfield.rightView = button2
        confirmPasswordTextfield.rightViewMode = .whileEditing
        button2.alpha = 0.7
          }
 
    var buttonClick2 = true

    @IBAction func togglePasswordView2(_ sender: Any) {
        
        if (buttonClick2 == true) {
            
            confirmPasswordTextfield.isSecureTextEntry = false
            
        } else {
            
            confirmPasswordTextfield.isSecureTextEntry = true
        }
        
        buttonClick2 = !buttonClick2
        
    }
    
    func allertNotification() {
        
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
