//
//  ViewController.swift
//  Light
//
//  Created by Jesse Tipton on 1/29/18.
//  Copyright © 2018 MAD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lightOn = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if lightOn {
            return .default
        } else {
            return .lightContent
        }
    }
    
    func updateUI() {
        if lightOn {
            print("Light on!")
            view.backgroundColor = .white
            lightswitchButton.setTitle("Off", for: .normal)
            lightswitchButton.tintColor = .black
        } else {
            print("Light off!")
            view.backgroundColor = .black
            lightswitchButton.setTitle("On", for: .normal)
            lightswitchButton.tintColor = .white
        }
    }
    
    @IBOutlet weak var lightswitchButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn = !lightOn
        updateUI()
        setNeedsStatusBarAppearanceUpdate() // refresh status bar style
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

}
