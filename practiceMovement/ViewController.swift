//
//  ViewController.swift
//  practiceMovement
//
//  Created by Sanskar Gautam on 22/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    var box = UIView()
    var topConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupUI()
        let tap = UITapGestureRecognizer(target: self, action: #selector(boxtapped))
        self.view.backgroundColor = .white
        self.box.addGestureRecognizer(tap)
    }
    
    func setupUI() {
        self.box.backgroundColor = .red
        self.box.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(box)
        
        NSLayoutConstraint.activate([
            self.box.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.box.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3),
            self.box.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        self.topConstraint = box.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        topConstraint.isActive = true
    }
    
    @objc func boxtapped() {
        NSLayoutConstraint.activate([
            self.box.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50)
            ])
        
        self.topConstraint.isActive = false
        
        UIView.animate(withDuration: 5.0) {
            self.view.layoutIfNeeded()
        }
    }
}

