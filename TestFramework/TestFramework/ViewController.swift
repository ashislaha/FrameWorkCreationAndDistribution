//
//  ViewController.swift
//  TestFramework
//
//  Created by Ashis Laha on 05/03/18.
//  Copyright © 2018 Ashis Laha. All rights reserved.
//

import UIKit
import ALModalStatus

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }

    @IBAction func showStatusViewTapped(_ sender: UIButton) {
        
        let modalView = ALModalStatusView(frame: view.bounds)
        modalView.set(image: #imageLiteral(resourceName: "select"))
        modalView.set(title: "Hi I am Header")
        modalView.set(description: "Provide some description")
        view.addSubview(modalView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            modalView.removeFromSuperview()
        }
    }
}

