//
//  InterfaceController.swift
//  watch-Calc Extension
//
//  Created by Salman Qureshi on 18/07/17.
//  Copyright © 2017 iSalmanLab. All rights reserved.
//

import WatchKit
import Foundation

enum Operation {
    case Sum
    case Minus
    case Multiply
    case Divide
    case Unknown
}

class InterfaceController: WKInterfaceController {

    var displaValue: NSString?
    var previousValueEntered: NSString?
    
    var operationPerform: Operation!
    
    @IBOutlet var displayResult: WKInterfaceLabel!
    
    @IBAction func oneTap() {
        print("1")
        addDigitToDisplay("1")
    }
    
    @IBAction func twoTap() {
        print("2")
        addDigitToDisplay("2")
    }
    
    @IBAction func threeTap() {
        print("3")
        addDigitToDisplay("3")
    }
    
    @IBAction func fourTap() {
        print("4")
        addDigitToDisplay("4")
    }
    
    @IBAction func fiveTap() {
        print("5")
        addDigitToDisplay("5")
    }
    
    @IBAction func sixTap() {
        print("6")
        addDigitToDisplay("6")
    }
    
    @IBAction func sevenTap() {
        print("7")
        addDigitToDisplay("7")
    }
    
    @IBAction func eightTap() {
        print("8")
        addDigitToDisplay("8")
    }
    
    @IBAction func nineTap() {
        print("9")
        addDigitToDisplay("9")
    }
    
    @IBAction func zeroTap() {
        print("0")
        addDigitToDisplay("0")
    }
    
    
    @IBAction func multiplyOperation() {
        print("*")
        previousValueEntered = displaValue
        operationPerform = Operation.Multiply
        displayResult.setText("0")
    }
    
    @IBAction func addOperation() {
        print("+")
        previousValueEntered = displaValue
        operationPerform = Operation.Sum
        displayResult.setText("0")
    }
    
    @IBAction func subtractOperation() {
        print("-")
        previousValueEntered = displaValue
        operationPerform = Operation.Minus
        displayResult.setText("0")
    }
    
    @IBAction func divideOperation() {
        print("divide")
        previousValueEntered = displaValue
        operationPerform = Operation.Divide
        displayResult.setText("0")
    }
    
    @IBAction func decimalOperation() {
        print(".")
        addDigitToDisplay(".")
    }
    
    @IBAction func resultTap() {
        print("=")
        
        if operationPerform == Operation.Sum {
            let stringResult = String(format: "%.1f", (previousValueEntered?.floatValue)! + (displaValue?.floatValue)!)
            displayResult.setText(stringResult)
            displaValue = stringResult as NSString?
        } else if operationPerform == Operation.Minus {
            let stringResult = String(format: "%.1f", (previousValueEntered?.floatValue)! - (displaValue?.floatValue)!)
            displayResult.setText(stringResult)
            displaValue = stringResult as NSString?
        } else if operationPerform == Operation.Multiply {
            let stringResult = String(format: "%.1f", (previousValueEntered?.floatValue)! * (displaValue?.floatValue)!)
            displayResult.setText(stringResult)
            displaValue = stringResult as NSString?
        } else if operationPerform == Operation.Divide {
            let stringResult = String(format: "%.1f", (previousValueEntered?.floatValue)! / (displaValue?.floatValue)!)
            displayResult.setText(stringResult)
            displaValue = stringResult as NSString?
        }
        
        previousValueEntered = nil
        operationPerform = Operation.Unknown
    }
    
    func addDigitToDisplay(_ value: String) {
        displaValue = displaValue!.appending(value as String) as NSString?
        displayResult.setText(displaValue as String?)
    }
    
    @IBAction func remove() {
        if (displaValue?.length)! > 0 {
            displaValue = displaValue?.substring(to: (displaValue?.length)! - 1) as NSString?
            displayResult.setText(displaValue as String?)
        }
    }
    
    @IBAction func clear() {
        previousValueEntered = nil
        operationPerform = Operation.Unknown
        displaValue = ""
        displayResult.setText("0")
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        displaValue = ""
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
