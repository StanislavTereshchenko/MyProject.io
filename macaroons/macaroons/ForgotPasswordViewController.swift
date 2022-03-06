//
//  ForgotPasswordViewController.swift
//  macaroons
//
//  Created by Stanislav Tereshchenko on 13.02.2022.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        let emailImage = UIImage(systemName: "envelope")
        addLeftImageTo(textField: emailTextField, andImage: emailImage!)
        
        continueButton.layer.cornerRadius = 20
        continueButton.clipsToBounds = true 
        // Do any additional setup after loading the view.
    }
    
    func addLeftImageTo(textField: UITextField, andImage img: UIImage) {
        
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 66.0, height: 66.0))
        
        leftImageView.image = img
        textField.leftView = leftImageView
        textField.leftViewMode = .always
 
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
