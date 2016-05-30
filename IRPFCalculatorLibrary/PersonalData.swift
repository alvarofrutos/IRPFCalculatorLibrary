//
//  PersonalData.swift
//  IRPF Calculator
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


// MARK: - Constants
/*
let kPersonalData = "personalData"

let kEarnings              = "earnings"
let kBirthDate             = "birthDate"
let kPayments              = "payments"

let kFamilySituation       = "familySituation"
let kProfessionalSituation = "professionalSituation"
let kProfessionalRelation  = "professionalRelation"
let kContributionBasis     = "contributionBasis"
let kContractType          = "contractType"
let kDisability            = "disability"

let kNeedsHelp             = "needsHelp"
let kMobility              = "mobility"
let kCeutaMelilla          = "ceutaMelilla"
let kExtendedActivity      = "extendedActivity"

let kAscendants            = "ascendants"
let kDescendants           = "descendants"

let kIrreg1                = "irreg1"
let kIrreg2                = "irreg2"
let kExpenses              = "expenses"

let kCompensatory          = "compensatory"
let kCompensatoryAmount    = "compensatoryAmount"

let kAnnuity               = "annuity"
let kAnnuityAmount         = "annuityAmount"

let kDwellingLoan          = "dwellingLoan"
*/

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
    
    init(load: Bool) {
        
        birthDate = initBirthDate()
        
        super.init()
        
        /*
        if load {
            if let dictionary = NSUserDefaults.standardUserDefaults().valueForKey(kPersonalData) as? NSMutableDictionary {
                decodeData(dictionary)
            }
        }
 */
    }
    
    /*
    func decodeData(dictionary: NSMutableDictionary) {
        
        if let value = dictionary.valueForKey(kEarnings) as? Double {
            earnings = value
        }
        
        if let value = dictionary.valueForKey(kBirthDate) as? NSDate {
            birthDate = value
        }
        
        
        if let value = dictionary.valueForKey(kPayments) as? Payments.RawValue {
            payments = Payments(rawValue: value)!
        }
        
        if let value = dictionary.valueForKey(kFamilySituation) as? FamilySituation.RawValue {
            familySituation = FamilySituation(rawValue: value)!
        }
        
        if let value = dictionary.valueForKey(kProfessionalSituation) as? ProfessionalSituation.RawValue {
            professionalSituation = ProfessionalSituation(rawValue: value)!
        }
        
        if let value = dictionary.valueForKey(kProfessionalRelation) as? ProfessionalRelation.RawValue {
            professionalRelation = ProfessionalRelation(rawValue: value)!
        }
        
        if let value = dictionary.valueForKey(kContributionBasis) as? ContributionBasis.RawValue {
            contributionBasis = ContributionBasis(rawValue: value)!
        }
        
        if let value = dictionary.valueForKey(kContractType) as? ContractType.RawValue {
            contractType = ContractType(rawValue: value)!
        }
        
        if let value = dictionary.valueForKey(kDisability) as? Disability.RawValue {
            disability = Disability(rawValue: value)!
        }
        
        
        
        if let value = dictionary.valueForKey(kNeedsHelp) as? Bool {
            needsHelp = value
        }
        
        if let value = dictionary.valueForKey(kMobility) as? Bool {
            mobility = value
        }
        
        if let value = dictionary.valueForKey(kCeutaMelilla) as? Bool {
            ceutaMelilla = value
        }
        
        if let value = dictionary.valueForKey(kExtendedActivity) as? Bool {
            extendedActivity = value
        }
        
        
        if let value = dictionary.valueForKey(kIrreg1) as? Double {
            irreg1 = value
        }
        if let value = dictionary.valueForKey(kIrreg2) as? Double {
            irreg2 = value
        }
        if let value = dictionary.valueForKey(kExpenses) as? Double {
            expenses = value
        }
        if let value = dictionary.valueForKey(kCompensatory) as? Bool {
            compensatory = value
        }
        if let value = dictionary.valueForKey(kCompensatoryAmount) as? Double {
            compensatoryAmount = value
        }
        if let value = dictionary.valueForKey(kAnnuity) as? Bool {
            annuity = value
        }
        if let value = dictionary.valueForKey(kAnnuityAmount) as? Double {
            annuityAmount = value
        }
        if let value = dictionary.valueForKey(kDwellingLoan) as? Bool {
            dwellingLoan = value
        }
        
        
        
        if let value = dictionary.valueForKey(kAscendants) as? NSMutableArray {
            for dict in value {
                ascendants.append(Ascendant(dictionary:dict as! NSMutableDictionary))
            }
        }
        
        if let value = dictionary.valueForKey(kDescendants) as? NSMutableArray {
            for dict in value {
                descendants.append(Descendant(dictionary:dict as! NSMutableDictionary))
            }
        }
        
    }
    
    func saveData() {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(earnings,  forKey: kEarnings)
        dictionary.setValue(birthDate, forKey: kBirthDate)
        
        dictionary.setValue(payments.rawValue,              forKey: kPayments)
        dictionary.setValue(familySituation.rawValue,       forKey: kFamilySituation)
        dictionary.setValue(professionalSituation.rawValue, forKey: kProfessionalSituation)
        dictionary.setValue(professionalRelation.rawValue,  forKey: kProfessionalRelation)
        dictionary.setValue(contributionBasis.rawValue,     forKey: kContributionBasis)
        dictionary.setValue(contractType.rawValue,          forKey: kContractType)
        dictionary.setValue(disability.rawValue,            forKey: kDisability)
        
        dictionary.setValue(needsHelp,        forKey: kNeedsHelp)
        dictionary.setValue(mobility,         forKey: kMobility)
        dictionary.setValue(ceutaMelilla,     forKey: kCeutaMelilla)
        dictionary.setValue(extendedActivity, forKey: kExtendedActivity)
        
        
        dictionary.setValue(irreg1,             forKey: kIrreg1)
        dictionary.setValue(irreg2,             forKey: kIrreg2)
        dictionary.setValue(expenses,           forKey: kExpenses)
        dictionary.setValue(compensatory,       forKey: kCompensatory)
        dictionary.setValue(compensatoryAmount, forKey: kCompensatoryAmount)
        dictionary.setValue(annuity,            forKey: kAnnuity)
        dictionary.setValue(annuityAmount,      forKey: kAnnuityAmount)
        dictionary.setValue(dwellingLoan,       forKey: kDwellingLoan)
        
        
        // Relatives
        let ascendantsArray = NSMutableArray()
        for ascendant in ascendants {
            ascendantsArray.addObject(ascendant.dictionaryFromRelative())
        }
        dictionary.setValue(ascendantsArray, forKey: kAscendants)
        
        
        let descandantsArray = NSMutableArray()
        for descendant in descendants {
            descandantsArray.addObject(descendant.dictionaryFromRelative())
        }
        dictionary.setValue(descandantsArray, forKey: kDescendants)
        
        // Save the dictionary
        NSUserDefaults.standardUserDefaults().setValue(dictionary, forKey: kPersonalData)
        
    }
 */
    
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
