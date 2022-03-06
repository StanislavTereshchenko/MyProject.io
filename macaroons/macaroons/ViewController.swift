//
//  ViewController.swift
//  macaroons
//
//  Created by Stanislav Tereshchenko on 07.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getStartedButton.layer.cornerRadius = 20
        getStartedButton.clipsToBounds = true
        

    }
}

