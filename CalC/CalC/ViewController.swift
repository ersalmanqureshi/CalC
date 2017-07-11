//
//  ViewController.swift
//  CalC
//
//  Created by Salman Qureshi on 04/07/17.
//  Copyright © 2017 iSalmanLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayText: UILabel!

    var userTyping: Bool = false
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func digitPress(_ sender: UIButton) {
        print("Press digit: \(sender.currentTitle!)")
        
        let digit = sender.currentTitle!
        
        if userTyping {
            displayText.text = displayText.text! + digit
        } else {
            displayText.text = digit
            userTyping = true
        }
    }
    
    @IBAction func handleOperations(_ sender: UIButton) {
        
        let operationSymbol = sender.currentTitle!
        print("Operation Symbol: \(operationSymbol)")
        
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
