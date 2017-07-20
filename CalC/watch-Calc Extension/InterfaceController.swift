//
//  InterfaceController.swift
//  watch-Calc Extension
//
//  Created by Salman Qureshi on 18/07/17.
//  Copyright © 2017 iSalmanLab. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    
    @IBAction func oneTap() {
        print("1")
    }
    
    @IBAction func twoTap() {
        print("2")
    }
    
    @IBAction func threeTap() {
        print("3")
    }
    
    @IBAction func fourTap() {
        print("4")
    }
    
    @IBAction func fiveTap() {
        print("5")
    }
    
    @IBAction func sixTap() {
        print("6")
    }
    
    @IBAction func sevenTap() {
        print("7")
    }
    
    @IBAction func eightTap() {
        print("8")
    }
    
    @IBAction func nineTap() {
        print("9")
    }
    
    @IBAction func zeroTap() {
        print("0")
    }
    
    
    @IBAction func multiplyOperation() {
        print("*")
    }
    
    @IBAction func addOperation() {
        print("+")
    }
    
    @IBAction func subtractOperation() {
        print("-")
    }
    
    @IBAction func divideOperation() {
        print("divide")
    }
    
    @IBAction func decimalOperation() {
        print(".")
    }
    
    @IBAction func resultTap() {
        print("=")
    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
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
