//
//  ViewController.swift
//  fefuactivity
//
//  Created by Andrew L on 04.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: ActivityFEFUButton!
    
    
    @IBOutlet weak var alreadyExistButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        signUpButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        alreadyExistButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
    }

    @IBAction func didTapMyButton(_ sender: ActivityFEFUButton) {
        let signUpView = SignUpController(nibName: "SignUpController", bundle: nil)
        navigationController?.pushViewController(signUpView, animated: true)
    }
    
}

