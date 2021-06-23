//
//  ViewController.swift
//  AnimApp
//
//  Created by Иван Маришин on 23.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var animationLable: UILabel!
    @IBOutlet weak var runAnimationButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.layer.cornerRadius = 10
        runAnimationButton.layer.cornerRadius = 10
    }
    
    @IBAction func runAnimationButton(_ sender: Any) {
        animationView.randomAnimate(lable: animationLable)
    }
}

