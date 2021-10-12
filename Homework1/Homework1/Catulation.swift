//
//  Catulation.swift
//  Homework1
//
//  Created by Anna HAn on 9/6/20.
//  Copyright © 2020 Boise State. All rights reserved.
//

import Foundation

class Calculation{
    var totalresult = 0.0
    
    func setOperand(operand: Double) {
        totalresult = operand
    }
    
    var result: Double {
        get {
            return totalresult
        }
    }
    
    
}
