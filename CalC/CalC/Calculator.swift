//
//  Calculator.swift
//  CalC
//
//  Created by Salman Qureshi on 11/07/17.
//  Copyright © 2017 iSalmanLab. All rights reserved.
//

import Foundation

struct Calculator {
    
     private var accumulator: Double?
    
     var displayResult: Double? {
        return accumulator
    }
    
    private enum Operation {
        case unary((Double) -> Double)
        case binary((Double, Double) -> Double)
        case equals
    }
    
    private var mathOperations: Dictionary<String, Operation> = [
        "±" : Operation.unary({ -$0 }),
        "+" : Operation.binary({ $0 + $1 }),
        "−" : Operation.binary({ $0 - $1 }),
        "/" : Operation.binary({ $0 / $1 }),
        "×" : Operation.binary({ $0 * $1 }),
        "%" : Operation.binary({ $0 * $1 / 100 }),
        "=" : Operation.equals
    ]
    
    
    mutating func performOperation(_ mathSymbol: String) {
        
        if let operation = mathOperations[mathSymbol] {
            switch operation {
                
            case .unary(let f):
                if accumulator != nil {
                    accumulator = f(accumulator!)
                }
                
            case .binary(let f):
                if accumulator != nil {
                    pendingBinaryOperation = PendingBinaryOperation(function: f, firstOperand: accumulator!)
                    accumulator = nil
                }
                
            case .equals:
                performPendingBinaryOperation()
                
            }
        }
    }
    
    private mutating func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation!.perform(operationWith: accumulator!)
            pendingBinaryOperation = nil
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perform(operationWith secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
}
