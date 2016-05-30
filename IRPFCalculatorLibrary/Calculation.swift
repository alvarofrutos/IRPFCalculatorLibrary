//
//  Calculation.swift
//  IRPFCalculatorLibrary
//
//  Created by Álvaro Frutos on 16/12/14.
//  Copyright (c) 2014 Álvaro Frutos. All rights reserved.
//

import UIKit

// MARK: - Enums

enum CalculationType : Int {
    case IRPF2014  = 2014
    case IRPF2015  = 2015
    case IRPF2016  = 2016
    case IRPF2015B = 1516
    
    static let all = [IRPF2014, IRPF2015, IRPF2015B, IRPF2016]
}

class Calculation: NSObject {
   
    // MARK: - Properties
    
    var data : PersonalData
    
    var type : CalculationType
    
    
    var retribution      : Double      = 0.0
    var netReturn        : Double      = 0.0
    var reducedNetReturn : Double      = 0.0
    var base             : Double      = 0.0
    var minimum          : Double      = 0.0
    
    var pension          : Double      = 0.0
    var unemployment     : Double      = 0.0
    
    var exention         : Bool        = false
    
    var retentionRate    : Double      = 0.0
    var retentionType    : Double      = 0.0
    var retentionValue   : Double      = 0.0
    
    var deductions       : Double      = 0.0
    var loan             : Double      = 0.0
    
    var rate1            : Double      = 0.0
    var rate2            : Double      = 0.0
    
    
    var reductions       : [Reduction] = [Reduction]()
    var otherReductions  : [Reduction] = [Reduction]()
    
    var extendedMinimums : Minimums    = Minimums()
    
    var minimums         : [Minimum]   = [Minimum]()
    
    
    // MARK: - Constants
    
    let kMinimumGeneral   : Double
    let kMinimumGeneral65 : Double
    let kMinimumGeneral75 : Double
    
    let kMinimumDesc1 : Double
    let kMinimumDesc2 : Double
    let kMinimumDesc3 : Double
    let kMinimumDesc4 : Double
    let kMinimumDescE : Double
    
    let kMinimumAsc65 : Double
    let kMinimumAsc75 : Double
    
    let kMinimumDis33 : Double
    let kMinimumDis65 : Double
    let kMinimumDisAs : Double
    
    let kLimitS1D1 : Double
    let kLimitS1D2 : Double
    let kLimitS2D0 : Double
    let kLimitS2D1 : Double
    let kLimitS2D2 : Double
    let kLimitS3D0 : Double
    let kLimitS3D1 : Double
    let kLimitS3D2 : Double
    
    let kLimit43 : Double
    
    let kMatrixSize : Int
    
    let kMatrix1B : Double
    let kMatrix1C : Double
    let kMatrix1P : Double
    let kMatrix2B : Double
    let kMatrix2C : Double
    let kMatrix2P : Double
    let kMatrix3B : Double
    let kMatrix3C : Double
    let kMatrix3P : Double
    let kMatrix4B : Double
    let kMatrix4C : Double
    let kMatrix4P : Double
    let kMatrix5B : Double
    let kMatrix5C : Double
    let kMatrix5P : Double
    let kMatrix6B : Double
    let kMatrix6C : Double
    let kMatrix6P : Double
    let kMatrix7B : Double
    let kMatrix7C : Double
    let kMatrix7P : Double
    
    let kAnnuityMinimum : Double

    
    // MARK: - Methods
    
    init(personalData: PersonalData, type calculationType: CalculationType) {
        
        data = personalData
        
        type = calculationType
        
        switch type {
        
            // MARK: IRPF 2014
        case .IRPF2014:
            
            kMinimumGeneral   = 5151.00
            kMinimumGeneral65 =  918.00
            kMinimumGeneral75 = 1122.00
            
            kMinimumDesc1 = 1836.00
            kMinimumDesc2 = 2040.00
            kMinimumDesc3 = 3672.00
            kMinimumDesc4 = 4182.00
            kMinimumDescE = 2244.00
            
            kMinimumAsc65 =  918.00
            kMinimumAsc75 = 1122.00
            
            kMinimumDis33 = 2316.00
            kMinimumDis65 = 7038.00
            kMinimumDisAs = 2316.00
            
            kLimitS1D1 = 13662.00
            kLimitS1D2 = 15617.00
            kLimitS2D0 = 13335.00
            kLimitS2D1 = 14774.00
            kLimitS2D2 = 16952.00
            kLimitS3D0 = 11162.00
            kLimitS3D1 = 11888.00
            kLimitS3D2 = 12519.00
            
            kLimit43 = 22000.00
            
            kMatrixSize = 7
            
            kMatrix1B = 0.00
            kMatrix2B = 17707.20
            kMatrix3B = 33007.20
            kMatrix4B = 53407.20
            kMatrix5B = 120000.20
            kMatrix6B = 175000.20
            kMatrix7B = 300000.20
            
            kMatrix1C = 0.00
            kMatrix2C = 4382.53
            kMatrix3C = 8972.53
            kMatrix4C = 17132.53
            kMatrix5C = 48431.24
            kMatrix6C = 75381.24
            kMatrix7C = 139131.24
            
            kMatrix1P = 0.2475
            kMatrix2P = 0.30
            kMatrix3P = 0.40
            kMatrix4P = 0.47
            kMatrix5P = 0.49
            kMatrix6P = 0.51
            kMatrix7P = 0.52
            
            kAnnuityMinimum = 1600.0
            
            
            // MARK: IRPF 2015
        case .IRPF2015:
            
            kMinimumGeneral   = 5550.00
            kMinimumGeneral65 = 1150.00
            kMinimumGeneral75 = 1400.00
            
            kMinimumDesc1 = 2400.00
            kMinimumDesc2 = 2700.00
            kMinimumDesc3 = 4000.00
            kMinimumDesc4 = 4500.00
            kMinimumDescE = 2800.00
            
            kMinimumAsc65 = 1150.00
            kMinimumAsc75 = 1400.00
            
            kMinimumDis33 = 3000.00
            kMinimumDis65 = 9000.00
            kMinimumDisAs = 3000.00
            
            kLimitS1D1 = 14266.00
            kLimitS1D2 = 15803.00
            kLimitS2D0 = 13696.00
            kLimitS2D1 = 14985.00
            kLimitS2D2 = 17138.00
            kLimitS3D0 = 12000.00
            kLimitS3D1 = 12607.00
            kLimitS3D2 = 13275.00
            
            kLimit43 = 22000.00
            
            kMatrixSize = 5
            
            kMatrix1B = 0.00
            kMatrix2B = 12450.00
            kMatrix3B = 20200.00
            kMatrix4B = 34000.00
            kMatrix5B = 60000.00
            kMatrix6B = 0.00
            kMatrix7B = 0.00
            
            kMatrix1C = 0.00
            kMatrix2C = 2490.00
            kMatrix3C = 4427.50
            kMatrix4C = 8705.50
            kMatrix5C = 18845.50
            kMatrix6C = 0.00
            kMatrix7C = 0.00
            
            kMatrix1P = 0.20
            kMatrix2P = 0.25
            kMatrix3P = 0.31
            kMatrix4P = 0.39
            kMatrix5P = 0.47
            kMatrix6P = 0.00
            kMatrix7P = 0.00
            
            kAnnuityMinimum = 1980.0
            
            
            // MARK: IRPF 2015 with 2016 model from july
        case .IRPF2015B:
            
            kMinimumGeneral   = 5550.00
            kMinimumGeneral65 = 1150.00
            kMinimumGeneral75 = 1400.00
            
            kMinimumDesc1 = 2400.00
            kMinimumDesc2 = 2700.00
            kMinimumDesc3 = 4000.00
            kMinimumDesc4 = 4500.00
            kMinimumDescE = 2800.00
            
            kMinimumAsc65 = 1150.00
            kMinimumAsc75 = 1400.00
            
            kMinimumDis33 = 3000.00
            kMinimumDis65 = 9000.00
            kMinimumDisAs = 3000.00
            
            kLimitS1D1 = 14266.00
            kLimitS1D2 = 15803.00
            kLimitS2D0 = 13696.00
            kLimitS2D1 = 14985.00
            kLimitS2D2 = 17138.00
            kLimitS3D0 = 12000.00
            kLimitS3D1 = 12607.00
            kLimitS3D2 = 13275.00
            
            kLimit43 = 22000.00
            
            kMatrixSize = 5
            
            kMatrix1B = 0.00
            kMatrix2B = 12450.00
            kMatrix3B = 20200.00
            kMatrix4B = 34000.00
            kMatrix5B = 60000.00
            kMatrix6B = 0.00
            kMatrix7B = 0.00
            
            kMatrix1C = 0.00
            kMatrix2C = 2427.75
            kMatrix3C = 4326.50
            kMatrix4C = 8535.50
            kMatrix5C = 18415.50
            kMatrix6C = 0.00
            kMatrix7C = 0.00
            
            kMatrix1P = 0.195
            kMatrix2P = 0.245
            kMatrix3P = 0.305
            kMatrix4P = 0.38
            kMatrix5P = 0.46
            kMatrix6P = 0.00
            kMatrix7P = 0.00
            
            kAnnuityMinimum = 1980.0
            
            
            // MARK: IRPF 2016
        case .IRPF2016:
            
            kMinimumGeneral   = 5550.00
            kMinimumGeneral65 = 1150.00
            kMinimumGeneral75 = 1400.00
            
            kMinimumDesc1 = 2400.00
            kMinimumDesc2 = 2700.00
            kMinimumDesc3 = 4000.00
            kMinimumDesc4 = 4500.00
            kMinimumDescE = 2800.00
            
            kMinimumAsc65 = 1150.00
            kMinimumAsc75 = 1400.00
            
            kMinimumDis33 = 3000.00
            kMinimumDis65 = 9000.00
            kMinimumDisAs = 3000.00
            
            kLimitS1D1 = 14266.00
            kLimitS1D2 = 15803.00
            kLimitS2D0 = 13696.00
            kLimitS2D1 = 14985.00
            kLimitS2D2 = 17138.00
            kLimitS3D0 = 12000.00
            kLimitS3D1 = 12607.00
            kLimitS3D2 = 13275.00
            
            kLimit43 = 22000.00
            
            kMatrixSize = 5
            
            kMatrix1B = 0.00
            kMatrix2B = 12450.00
            kMatrix3B = 20200.00
            kMatrix4B = 35200.00
            kMatrix5B = 60000.00
            kMatrix6B = 0.00
            kMatrix7B = 0.00
            
            kMatrix1C = 0.00
            kMatrix2C = 2365.50
            kMatrix3C = 4225.50
            kMatrix4C = 8725.50
            kMatrix5C = 17901.50
            kMatrix6C = 0.00
            kMatrix7C = 0.00
            
            kMatrix1P = 0.19
            kMatrix2P = 0.24
            kMatrix3P = 0.30
            kMatrix4P = 0.37
            kMatrix5P = 0.45
            kMatrix6P = 0.00
            kMatrix7P = 0.00
            
            kAnnuityMinimum = 1980.0
        }
        
        super.init()
        
        calculate()
    }
    
    func calculate() {
        
        // Net return
        
        retribution = data.earnings
        
        netReturn = retribution - data.irreg1 - data.irreg2 - data.expenses
        
        netReturn = netReturn > 0.0 ? netReturn : 0.0
        
        // Reductions
        
        reductions = getReductions(netReturn)
        
        reducedNetReturn = getReducedAmount(netReturn, reductions: reductions)
        
        otherReductions = getOtherReductions()
        
        base = getReducedAmount(reducedNetReturn, reductions: otherReductions)
        
        extendedMinimums = getMinimums()
        
        minimums = combineMinimums(extendedMinimums)
        
        minimum = getTotalMinimum(minimums)
        
        exention = checkExention()
        
        if !exention {
            
            deductions = calculateDeductions(base)
            
            loan       = getLoanDeduction(retribution)
            
            (rate1, rate2) = calculateRetentionRate()
            
            retentionRate = rate1 > rate2 ? rate1 - rate2 : 0.0
            
            let limitedRetentionRate = limitateRetentionRate(retentionRate)
            
            let previousValue = getPreviousValue(retribution, rate: limitedRetentionRate)
            
            var difference = previousValue - deductions - loan
            
            difference = difference > 0.0 ? difference : 0.0
            
            retentionType = floorToTwo((difference / retribution) * 100.0)
            
            retentionType = limitateRetentionType(retentionType)
            
            retentionValue = roundToTwo((retribution * retentionType) / 100.0)
        }
    }
    
    // MARK: - Retentions
    
    func calculateRetentionRate() -> (rate1: Double, rate2: Double) {
        
        var rate1 : Double = 0.0
        var rate2 : Double = 0.0
        
        if data.annuity && data.annuityAmount < base && data.annuityAmount >= 0.01 {
            
            let base1 = base - data.annuityAmount
            let base2 = data.annuityAmount
            
            rate1 = applyMatrix(base1) + applyMatrix(base2)
            
            rate2 = applyMatrix(minimum + kAnnuityMinimum)
            
        } else {
            
            rate1 = applyMatrix(base)
            rate2 = applyMatrix(minimum)
        }
        
        return (rate1, rate2)
    }
    
    func applyMatrix(amount: Double) -> Double {
        
        var base       : Double = 0.0
        var basic      : Double = 0.0
        var percentage : Double = 0.0
        
        if kMatrixSize > 6 && amount > kMatrix7B {
            base  = kMatrix7B
            basic = kMatrix7C
            percentage = kMatrix7P
            
        } else if kMatrixSize > 5 && amount > kMatrix6B {
            base  = kMatrix6B
            basic = kMatrix6C
            percentage = kMatrix6P
            
        } else if kMatrixSize > 4 && amount > kMatrix5B {
            base  = kMatrix5B
            basic = kMatrix5C
            percentage = kMatrix5P
            
        } else if kMatrixSize > 3 && amount > kMatrix4B {
            base  = kMatrix4B
            basic = kMatrix4C
            percentage = kMatrix4P
            
        } else if kMatrixSize > 2 && amount > kMatrix3B {
            base  = kMatrix3B
            basic = kMatrix3C
            percentage = kMatrix3P
            
        } else if kMatrixSize > 1 && amount > kMatrix2B {
            base  = kMatrix2B
            basic = kMatrix2C
            percentage = kMatrix2P
            
        } else {
            base  = kMatrix1B
            basic = kMatrix1C
            percentage = kMatrix1P
        }
        
        let remain = amount - base
        
        return basic + (remain * percentage)
    }
    
    // MARK: - Percentages
    
    func getPreviousValue(amount: Double, rate: Double) -> Double {
        
        if type == .IRPF2014 {
        
            let previousRate = floorToTwo((rate / amount) * 100.0)
        
            var previousRateR = round(previousRate)
        
            if data.ceutaMelilla {
                previousRateR = round(floorToTwo(previousRate / 2.0))
            }
        
            return (amount * previousRateR) / 100.0
            
        } else {
            return data.ceutaMelilla ? rate / 2.0 : rate
        }
    }
    
    // MARK: - Deductions
    
    func calculateDeductions(base: Double) -> Double {
        
        if type == .IRPF2014 {
            if base <= 8000.00 {
                return 400.00
            } else if base <= 12000.00 {
                return 400.00 - (0.1 * (base - 8000.00))
            }
        }
        
        return 0.0
    }
    
    func getLoanDeduction(amount: Double) -> Double {
        
        return amount < 33007.3 && data.dwellingLoan ? floorToTwo(0.02 * amount) : 0.0
    }
    
    // MARK: - Limitations
    
    func limitateRetentionRate(rate: Double) -> Double {
        
        // Revisar articulo 85 apartado 3
        // http://www.caisistemas.es/guiadeasesores/index.php/reforma-fiscal-2015/normativa-reforma-fiscal/comparativa-reglamento-irpf/
        // Todo parece seguir igual porque las deduciones por el artículo 80 bis (deductions) se suprimen.
        
        if let value = getLimits() {
            let limit = deductions + (retribution - (value + pension + unemployment)) * 0.43
            
            return rate > limit && retribution <= kLimit43 ? limit : rate
        }
        
        return rate
    }
    
    func limitateRetentionType(percentage: Double) -> Double {
        
        if data.ceutaMelilla {
            switch data.professionalRelation {
            case .Special:
                return percentage < 8.00 ? 8.00 : percentage
            case .OneYear:
                return percentage < 1.00 ? 1.00 : percentage
            default: break
            }
        } else {
            switch data.professionalRelation {
            case .Special:
                return percentage < 15.00 ? 15.00 : percentage
            case .OneYear:
                return percentage <  2.00 ?  2.00 : percentage
            default: break
            }
        }
        
        return percentage
    }
    
    // MARK: - Reduction handling
    
    func getReducedAmount(amount: Double, reductions: [Reduction]) -> Double {
        
        var reduced = amount
        
        for reduction in reductions {
            reduced -= reduction.amount
        }
        
        return reduced > 0.0 ? reduced : 0.0
    }
    
    func getReductions(amount: Double) -> [Reduction] {
        
        let general = getGeneralReduction(amount, type: type)
        
        let disability = getReductionForEmployedDisability()
        
        var reductions : [Reduction] = []
        
        switch type {
        case .IRPF2014:
            
            reductions.append(Reduction(description: "reduction_general_2014", amount: general))
            
            if data.extendedActivity {
                reductions.append(Reduction(description: "reduction_extended", amount: general))
            } else {
                reductions.append(Reduction(description: "reduction_extended", amount: 0.00))
            }
            
            if data.mobility {
                reductions.append(Reduction(description: "reduction_mobility", amount: general))
            } else {
                reductions.append(Reduction(description: "reduction_mobility", amount: 0.00))
            }
            
            reductions.append(Reduction(description: "reduction_disability", amount: disability))
            
        default:
            
            reductions.append(Reduction(description: "reduction_general_2015", amount: general))
            
            // TODO: Check 2016
            
            var otherExpenses : Double = 2000.00 + disability
            
            // TODO: Only if residence changed in 2015 (true)
            if data.mobility && true {
                otherExpenses += 2000.00
            }
            
            otherExpenses = retribution > data.expenses ? otherExpenses : 0.0
            
            otherExpenses = otherExpenses > retribution - data.expenses ? retribution - data.expenses : otherExpenses
            
            reductions.append(Reduction(description: "reduction_otherexpenses", amount: otherExpenses))
            
            
            if data.mobility && type == .IRPF2015 {
                // TODO: Check 2015
                // It is applying 2014 algorithm for mobility.
                
                //reductions.append(Reduction(description: "reduction_mobility", amount: getGeneralReduction(amount, type: .IRPF2014)))
            }
        }
        
        return reductions
    }
    
    func getGeneralReduction(amount: Double, type type_: CalculationType) -> Double {
        
        var kReductionMin : Double
        var kReductionMax : Double
        var kReductionBs1 : Double
        var kReductionBs2 : Double
        var kReductionPer : Double
        
        switch type_ {
        case .IRPF2014:
            kReductionMin = 9180.00
            kReductionMax = 13260.00
            kReductionBs1 = 4080.00
            kReductionBs2 = 2652.00
            kReductionPer = 0.35
            
        case .IRPF2015, .IRPF2015B, .IRPF2016:
            kReductionMin = 11250.00
            kReductionMax = 14450.00
            kReductionBs1 = 3700.00
            kReductionBs2 = 0.00
            kReductionPer = 1.15625
        }
        
        var reduction : Double = kReductionBs2
        
        if amount <= kReductionMin {
            reduction = kReductionBs1
        } else if amount <= kReductionMax {
            reduction = kReductionBs1 - (kReductionPer * (amount - kReductionMin))
        }
        
        return roundToTwo(reduction)
    }
    
    func getReductionForEmployedDisability() -> Double {
        
        var amount : Double = 0.0
        
        var kEmployedDisaMax : Double
        var kEmployedDisaMed : Double
        
        switch type {
        case .IRPF2014:
            kEmployedDisaMax = 7242.00
            kEmployedDisaMed = 3264.00
            
        case .IRPF2015, .IRPF2015B, .IRPF2016:
            kEmployedDisaMax = 7750.00
            kEmployedDisaMed = 3500.00
        }
        
        if data.professionalSituation == .Employed {
            
            if data.disability == .Lv65 || (data.disability == .Lv33 && data.needsHelp) {
                amount = kEmployedDisaMax
            } else if data.disability == .Lv33 {
                amount = kEmployedDisaMed
            }
        }
        
        return amount
    }
    
    func getOtherReductions() -> [Reduction] {
        
        var reductions : [Reduction] = [Reduction]()
        
        if data.professionalSituation == .Pensioner {
            pension = 600.00
            reductions.append(Reduction(description: "other_reduction_pensioner", amount: pension))
        } else {
            reductions.append(Reduction(description: "other_reduction_pensioner", amount: 0.00))
        }
        
        if data.descendants.count > 2 {
            reductions.append(Reduction(description: "other_reduction_descendants", amount: 600.00))
        } else {
            reductions.append(Reduction(description: "other_reduction_descendants", amount: 0.00))
        }
        
        if data.professionalSituation == .Unemployed {
            unemployment = 1200.00
            reductions.append(Reduction(description: "other_reduction_unemployed", amount: 1200.00))
        } else {
            reductions.append(Reduction(description: "other_reduction_unemployed", amount: unemployment))
        }
        
        if data.compensatory {
            reductions.append(Reduction(description: "other_reduction_compensatory", amount: data.compensatoryAmount))
        } else {
            reductions.append(Reduction(description: "other_reduction_compensatory", amount: 0.00))
        }
        
        return reductions
    }
    
    // MARK: - Minimum handling
    
    func getTotalMinimum(minimums: [Minimum]) -> Double {
        
        var amount = 0.0
        
        for minimum in minimums {
            amount += minimum.amount
        }
        
        return amount
    }
    
    func getMinimums() -> Minimums {
        
        var minimums = Minimums()
        
        minimums.general     = getGeneralMinimums()
        minimums.descendants = getDescendantsMinimums()
        minimums.ascendants  = getAscendantsMinimums()
        minimums.disability  = getDisabilityMinimums()
        
        return minimums
    }
    
    func combineMinimums(extended: Minimums) -> [Minimum] {
        
        var array : [Minimum] = [Minimum]()
        
        array.append(extended.combineMinimum(extended.generalString,     array: extended.general))
        array.append(extended.combineMinimum(extended.descendantsString, array: extended.descendants))
        array.append(extended.combineMinimum(extended.ascendantsString,  array: extended.ascendants))
        array.append(extended.combineMinimum(extended.disabilityString,  array: extended.disability))
        
        return array
    }
    
    func getGeneralMinimums() -> [Minimum] {
        
        var array = [Minimum(description: "minimums_general_1", amount: kMinimumGeneral)]
        
        let amount65 = data.age(atYear: yearForType(type)) >= 65 ? kMinimumGeneral65 : 0.00
        let amount75 = data.age(atYear: yearForType(type)) >= 75 ? kMinimumGeneral75 : 0.00
        
        array.append(Minimum(description: "minimums_general_2", amount: amount65))
        array.append(Minimum(description: "minimums_general_3", amount: amount75))
        
        return array
    }
    
    func getDescendantsMinimums() -> [Minimum] {
        
        var general : Double = 0.00
        var extra   : Double = 0.00
        
        var count : Int = 0
        
        for descendant in data.descendants {
            
            if descendant.shouldBeConsidered(atYear: yearForType(type)) {
                
                count += 1
                
                let coefficient = descendant.coefficient()
                
                switch count {
                case 1:
                    general += (coefficient * kMinimumDesc1)
                case 2:
                    general += (coefficient * kMinimumDesc2)
                case 3:
                    general += (coefficient * kMinimumDesc3)
                default:
                    general += (coefficient * kMinimumDesc4)
                }
                
                if descendant.shouldBeConsidederdForExtra(atYear: yearForType(type)) {
                    extra += (coefficient * kMinimumDescE)
                }
            }
        }
        
        general = roundToTwo(general)
        extra   = roundToTwo(extra)
        
        var array = [Minimum]()
        
        array.append(Minimum(description: "minimums_descendants_1", amount: general))
        array.append(Minimum(description: "minimums_descendants_2", amount: extra))
        
        return array
    }
    
    func getAscendantsMinimums() -> [Minimum] {
        
        let with65 = Double(data.numberOfAscendants(atYear: yearForType(type)))
        let with75 = Double(data.numberOfAscendantsWith75(atYear: yearForType(type)))
        
        let amount65 = roundToTwo(with65 * kMinimumAsc65)
        let amount75 = roundToTwo(with75 * kMinimumAsc75)
        
        var array = [Minimum]()
        
        array.append(Minimum(description: "minimums_ascendants_1", amount: amount65))
        array.append(Minimum(description: "minimums_ascendants_2", amount: amount75))
        
        return array
    }
    
    func getDisabilityMinimums() -> [Minimum] {
        
        var array = [Minimum]()
        
        array.append(getPersonalDisabilityMinimum())
        array.append(getDescendantDisabilityMinimum())
        array.append(getAscendantDisabilityMinimum())
        
        return array
    }
    
    func getPersonalDisabilityMinimum() -> Minimum {
        
        let description = "minimums_disability_1"
        
        var disability : Double = 0.0
        var assistency : Double = 0.0
        
        switch data.disability {
        case .Lv65:
            disability = kMinimumDis65
            assistency = kMinimumDisAs
        case .Lv33:
            disability = kMinimumDis33
            assistency = data.needsHelp ? kMinimumDisAs : 0.0
        default: break
        }
        
        return Minimum(description: description, amount: disability + assistency)
    }
    
    func getDescendantDisabilityMinimum() -> Minimum {
        
        let description = "minimums_disability_2"
        
        var disability : Double = 0.0
        var assistency : Double = 0.0
        
        for descendant in data.descendants {
            switch descendant.disability {
            case .Lv65:
                disability += (kMinimumDis65 * descendant.coefficient())
                assistency += (kMinimumDisAs * descendant.coefficient())
            case .Lv33:
                disability += (kMinimumDis33 * descendant.coefficient())
                assistency += descendant.needsHelp ? (kMinimumDisAs * descendant.coefficient()) : 0.0
            default: break
            }
        }
        
        disability = roundToTwo(disability)
        assistency = roundToTwo(assistency)
        
        return Minimum(description: description, amount: disability + assistency)
    }
    
    func getAscendantDisabilityMinimum() -> Minimum {
        
        let description = "minimums_disability_3"
        
        var disability : Double = 0.0
        var assistency : Double = 0.0
        
        for ascendant in data.ascendants {
            if ascendant.cohabitation {
                switch ascendant.disability {
                case .Lv65:
                    disability += kMinimumDis65
                    assistency += kMinimumDisAs
                case .Lv33:
                    disability += kMinimumDis33
                    assistency += ascendant.needsHelp ? kMinimumDisAs : 0.0
                default: break
                }
            }
        }
        
        disability = roundToTwo(disability)
        assistency = roundToTwo(assistency)
        
        return Minimum(description: description, amount: disability + assistency)
    }
    
    // MARK: - Exention
    
    func checkExention() -> Bool {
        
        var limit : Double = 0.0
        
        if let value = getLimits() {
            limit = value
        }
        
        return retribution <= limit + pension + unemployment
    }
    
    func getLimits() -> Double? {
        
        switch data.familySituation {
        case .Status1:
            
            if data.numberOfDescendants() == 1 {
                return kLimitS1D1
            } else if data.numberOfDescendants() > 1 {
                return kLimitS1D2
            }
        case .Status2:
            if data.numberOfDescendants() == 0 {
                return kLimitS2D0
            } else if data.numberOfDescendants() == 1 {
                return kLimitS2D1
            } else if data.numberOfDescendants() > 1 {
                return kLimitS2D2
            }
        default:
            if data.numberOfDescendants() == 0 {
                return kLimitS3D0
            } else if data.numberOfDescendants() == 1 {
                return kLimitS3D1
            } else if data.numberOfDescendants() > 1 {
                return kLimitS3D2
            }
        }
        
        return nil
    }
    
    // MARK: - Utilities
    
    func roundToTwo(num: Double) -> Double {
        return roundTo(num, decimals: 2)
    }
    
    func roundTo(num: Double, decimals: Int) -> Double {
        
        let tenpow : Double = pow(10.0, Double(decimals))
        
        return round(tenpow * num) / tenpow;
    }
    
    func doubleError(num: Double) -> Bool {
        return fabs(roundToTwo(num) - num) < 1e-6
    }
    
    func floorToTwo(num: Double) -> Double {
        return doubleError(num) ? roundToTwo(num) : floorTo(num, decimals: 2)
    }
    
    func floorTo(num: Double, decimals: Int) -> Double{
        
        let tenpow : Double = pow(10.0, Double(decimals))
        
        return floor(tenpow * num) / tenpow;
    }
    
    func yearForType(type: CalculationType) -> Int {
        switch type {
        case .IRPF2015B:
            return 2015
        default:
            return type.rawValue
        }
    }
}





// MARK: - Reduction

struct Reduction {
    var description : String = String()
    var amount : Double = 0.0
}


// MARK: - Minimum

struct Minimum {
    var description : String = String()
    var amount : Double = 0.0
}

struct Minimums {
    var general     : [Minimum] = [Minimum]()
    var descendants : [Minimum] = [Minimum]()
    var ascendants  : [Minimum] = [Minimum]()
    var disability  : [Minimum] = [Minimum]()
    
    let generalString     = "minimums_general"
    let descendantsString = "minimums_descendants"
    let ascendantsString  = "minimums_ascendants"
    let disabilityString  = "minimums_disability"
    
    
    func combineMinimum(description: String, array: [Minimum]) -> Minimum {
        
        var amount : Double = 0.0
        
        for minimum in array {
            amount += minimum.amount
        }
        return  Minimum(description: description, amount: amount)
    }
}


// MARK: - Extensions

extension PersonalData {
    func age(atYear year: Int) -> Int {
        let birth = yearFromDate(birthDate)
        return birth >= year ? 0 : year - birth
    }
    
    func numberOfDescendants(atYear year: Int) -> Int {
        var count : Int = 0
        for descendant in descendants {
            count += descendant.shouldBeConsidered(atYear: year) ? 1 : 0
        }
        return count
    }
    
    func numberOfAscendants(atYear year: Int) -> Int {
        var count : Int = 0
        for ascendant in ascendants {
            if ascendant.cohabitation {
                count += ascendant.age(atYear: year) > 65 || ascendant.disability != .None ? 1 : 0
            }
        }
        return count
    }
    
    func numberOfAscendantsWith75(atYear year: Int) -> Int {
        var count : Int = 0
        for ascendant in ascendants {
            if ascendant.cohabitation {
                count += ascendant.age(atYear: year) > 75 ? 1 : 0
            }
        }
        return count
    }
}

extension Relative {
    func age(atYear year: Int) -> Int {
        let birth = yearFromDate(birthDate)
        return birth >= year ? 0 : year - birth
    }
}

extension Descendant {
    func shouldBeConsidered(atYear year: Int) -> Bool {
        return age(atYear: year) < 25 || disability != .None
    }
    
    func shouldBeConsidederdForExtra(atYear year: Int) -> Bool {
        return shouldBeConsideredAsAdopted(atYear: year) || age(atYear: year) < 3
    }
    
    func shouldBeConsideredAsAdopted(atYear year: Int) -> Bool {
        
        if adopted {
            let birth    = yearFromDate(birthDate)
            let adoption = yearFromDate(adoptionDate)
            
            return (birth >= adoption) && (adoption - birth <= 18) && (year - adoption < 3) && (year > adoption)
        }
        
        return false
    }
    
    func coefficient() -> Double {
        return total ? 1.0 : 0.5
    }
}