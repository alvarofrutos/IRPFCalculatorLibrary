//
//  Salary.swift
//  IRPF Calculator
//
//  Created by Álvaro Frutos on 18/12/14.
//  Copyright (c) 2014 Álvaro Frutos. All rights reserved.
//

import UIKit

class Salary: NSObject {
    
    // MARK: - Properties
    
    let data : PersonalData
    
    let calc : Calculation
    
    
    
    let income    : Double
    let retention : Double
    
    let perCommon        : Double
    let perUnemployment : Double
    let perProfessional : Double
    
    
    
    var gross : Double = 0.0
    var fract : Double = 0.0
    var base  : Double = 0.0
    var base2 : Double = 0.0
    var net   : Double = 0.0
    var extra : Double = 0.0
    
    var irpf  : Double = 0.0
    var ssoc  : Double = 0.0
    
    var tax   : Double = 0.0
    
    var limited : Bool = false
    
    var common       : Double = 0.0
    var unemployment : Double = 0.0
    var professional : Double = 0.0
    
    
    
    // MARK: - Methods
   
    init(calculation: Calculation) {
        
        calc = calculation
        data = calculation.data
        
        income    = data.earnings
        retention = calculation.retentionValue
        
        
        perCommon       = 0.047
        perProfessional = 0.001
        
        switch data.contractType {
        case .FullTime:
            perUnemployment = 0.016
        case .PartialTime:
            perUnemployment = 0.016
        default:
            perUnemployment = 0.0155
        }
        
        super.init()
        
        calculate()
    }
    
    
    
    // MARK: - Calculation
    
    func calculate() {
        
        gross = calculateGross()
        fract = hasExtra() ? calculateExtra() : 0.0
        
        // Social Security
        
        base = gross + fract
        
        limited = isLimited(base)
        
        if limited {
            base2 = calculateLimitatedBase(base)
        } else {
            base2 = base
        }
        
        common       = base2 * perCommon
        unemployment = base2 * perUnemployment
        professional = base2 * perProfessional
        
        ssoc = common + unemployment + professional
        
        // IRPF
        
        irpf = calculateIRPF()
        
        tax = irpf + ssoc
        
        extra = gross - irpf
        net   = gross - tax
    }
    
    func calculateGross() -> Double {
        return income / Double(numberOfPayments())
    }
    
    func calculateIRPF() -> Double {
        return retention / Double(numberOfPayments())
    }
    
    func calculateExtra() -> Double {
        
        let extras = Double(numberOfExtras())
        
        return calculateGross() * extras / 12
    }
    
    func calculateLimitatedBase(base_: Double) -> Double {
        
        if let limits = getLimits() {
            
            if base_ > limits.max {
                return limits.max
            } else if base_ < limits.min {
                return limits.min
            }
        }
        
        return base_
    }
    
    
    // MARK: - Information
    
    func numberOfPayments() -> Int {
        return data.payments.rawValue
    }
    
    func numberOfExtras() -> Int {
        return (data.payments.rawValue > 12 ? data.payments.rawValue - 12 : 0)
    }
    
    func hasExtra() -> Bool {
        return data.payments != .Pay12
    }
    
    func isLimited(base_: Double) -> Bool {
        
        if let limits = getLimits() {
            
            return (base_ > limits.max || base_ < limits.min) && base_ >= 0.01
        }
        
        return false
    }
    
    func getLimits() -> (max: Double, min: Double)? {
        
        let max = 3597.00
        
        switch data.contributionBasis {
        case .Basis1:
            return (max, 1051.50)
        case .Basis2:
            return (max, 872.10)
        case .Basis3:
            return (max, 758.70)
        case .Basis4:
            return (max, 753.00)
        case .Basis5:
            return (max, 753.00)
        case .Basis6:
            return (max, 753.00)
        case .Basis7:
            return (max, 753.00)
        }
    }
}
