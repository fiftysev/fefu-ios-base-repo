//
//  SignInController.swift
//  fefuactivity
//
//  Created by Егор Блинов on 07.10.2021.
//

import UIKit

class SignInController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func commonInit() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
