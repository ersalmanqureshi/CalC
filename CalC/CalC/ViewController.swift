//
//  ViewController.swift
//  CalC
//
//  Created by Salman Qureshi on 04/07/17.
//  Copyright © 2017 iSalmanLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorDisplay: UILabel!

    var userTyping: Bool = false
 
    var value: Double {
        get {
            return Double(calculatorDisplay.text!)!
        }
        set {
            calculatorDisplay.text = String(describing: newValue)
        }
    }
    
    private var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func digitPress(_ sender: UIButton) {
        print("Press digit: \(sender.currentTitle!)")
        
        let digit = sender.currentTitle!
        
        if userTyping {
            calculatorDisplay.text = calculatorDisplay.text! + digit
        } else {
            calculatorDisplay.text = digit
            userTyping = true
        }
    }
    
    @IBAction func handleOperations(_ sender: UIButton) {
        
        if userTyping {
            calculator.setOperand(value)
            userTyping = false
        }
        
        if let mathSymbol = sender.currentTitle {
            print("Operation Symbol: \(mathSymbol)")
            calculator.performOperation(mathSymbol)
        }
        
        guard let result = calculator.displayResult else {
            return
        }
        
        value = result
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
