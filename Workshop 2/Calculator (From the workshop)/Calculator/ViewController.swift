//
//  ViewController.swift
//  Calculator
//
//  Created by Jesse Tipton on 2/5/18.
//  Copyright © 2018 MAD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var lhs: Int?
    var op: String?
    
    @IBAction func equals(_ sender: UIButton) {
        let rhsString = label.text!
        let rhsInt = Int(rhsString)!
        
        switch op! {
        case "+":
            label.text = "\(lhs! + rhsInt)"
        default:
            fatalError("Invalid operation")
        }
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        let lhsString = label.text!
        let lhsInt = Int(lhsString)
        self.lhs = lhsInt
        
        self.label.text = sender.titleLabel?.text
        self.op = sender.titleLabel?.text
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        guard let string = sender.titleLabel?.text else {
            return
        }
        if let int = Int(label.text!), int != 0 {
            label.text! += "\(string)"
        } else {
            label.text = string
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

