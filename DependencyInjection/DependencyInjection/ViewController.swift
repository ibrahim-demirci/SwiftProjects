//
//  ViewController.swift
//  DependencyInjection
//
//  Created by İbrahim Demirci on 17.01.2022.
//

import UIKit
import APIKit
import MyAppUIKit


extension APICaller: DataFetchable {}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // https://iosacademy.io/api/v1/courses/index.php
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        view.addSubview(button)
        button.backgroundColor = .systemBlue
        button.setTitle("Tap Me", for: .normal)
        button.center = view.center
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        let vc = CoursesViewController(dataFetchable: APICaller.shared)
        present(vc,animated: true)
        
        
        
    }


}

