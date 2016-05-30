//
//  PersonalData.swift
//  IRPFCalculatorLibrary
//
//  Created by Álvaro Frutos on 11/12/14.
//  Copyright (c) 2014 Álvaro Frutos. All rights reserved.
//

import UIKit

// MARK: - Enums

enum Payments : Int {
    case Pay12 = 12
    case Pay14 = 14
    case Pay15 = 15
    case Pay16 = 16
    
    static let all = [Pay12, Pay14, Pay15, Pay16]
}

enum FamilySituation : String {
    case Status1 = "status_1"
    case Status2 = "status_2"
    case Others  = "status_3"
    
    static let all = [Status1, Status2, Others]
}

enum ProfessionalSituation : String {
    case Employed   = "employed"
    case Pensioner  = "pensioner"
    case Unemployed = "unemployed"
    case Others     = "others"
    
    static let all = [Employed, Pensioner, Unemployed, Others]
}

enum ProfessionalRelation : String {
    case General  = "general"
    case OneYear  = "one_year"
    case Special  = "special"
    case Sporadic = "sporadic"
    
    static let all = [General, OneYear, Special, Sporadic]
}

enum ContributionBasis : String {
    case Basis1 = "basis_1"
    case Basis2 = "basis_2"
    case Basis3 = "basis_3"
    case Basis4 = "basis_4"
    case Basis5 = "basis_5"
    case Basis6 = "basis_6"
    case Basis7 = "basis_7"
    
    static let all = [Basis1, Basis2, Basis3, Basis4 , Basis5, Basis6, Basis7]
}

enum ContractType : String {
    case General     = "general_type"
    case FullTime    = "full_time_type"
    case PartialTime = "partial_time_type"
    
    static let all = [General, FullTime, PartialTime]
}

enum Disability : String {
    case None = "disability_no"
    case Lv33 = "disability_33"
    case Lv65 = "disability_65"
    
    static let all = [None, Lv33, Lv65]
}




class PersonalData: NSObject {
    
    // MARK: - Properties
    
    var earnings              : Double                = 0.0
    
    var payments              : Payments              = Payments.Pay14
    
    var birthDate             : NSDate
    
    var familySituation       : FamilySituation       = .Others
    
    var professionalSituation : ProfessionalSituation = .Employed
    
    var professionalRelation  : ProfessionalRelation  = .General
    
    var contributionBasis     : ContributionBasis     = .Basis1
    
    var contractType          : ContractType          = .General
    
    var disability            : Disability            = .None
    
    var needsHelp             : Bool                  = false
    
    var mobility              : Bool                  = false
    
    var ceutaMelilla          : Bool                  = false
    
    var extendedActivity      : Bool                  = false
    
    var ascendants  = [Ascendant]()
    var descendants = [Descendant]()
    
    var irreg1                : Double                = 0.0
    var irreg2                : Double                = 0.0
    var expenses              : Double                = 0.0
    
    var compensatory          : Bool                  = false
    var compensatoryAmount    : Double                = 0.0
    
    var annuity               : Bool                  = false
    var annuityAmount         : Double                = 0.0
    
    var dwellingLoan          : Bool                  = false
    
    
    
    // MARK: - Methods
    
    override init() {
        
        birthDate = initBirthDate()
        
        super.init()
        
    }
    
    // MARK: - Relatives handling
    
    func numberOfRelatives() -> Int {
        return ascendants.count + descendants.count
    }
    
    func numberOfAscendants() -> Int {
        return ascendants.count
    }
    
    func numberOfDescendants() -> Int {
        return descendants.count
    }
    
    func addAscendant() {
        ascendants.append(Ascendant())
    }
    
    func addDescendant() {
        descendants.append(Descendant())
    }
    
    func removeAscendantAtIndex(index: Int) {
        ascendants.removeAtIndex(index)
    }
    
    func removeDescendantAtIndex(index: Int) {
        descendants.removeAtIndex(index)
    }
}
