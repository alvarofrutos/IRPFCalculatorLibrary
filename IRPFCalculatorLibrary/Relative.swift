//
//  Relative.swift
//  IRPF Calculator
//
//  Created by Álvaro Frutos on 11/12/14.
//  Copyright (c) 2014 Álvaro Frutos. All rights reserved.
//

import UIKit


// MARK: - Constants
/*
let kRelName         = "name"
let kRelBirthDate    = "birthDate"
let kRelDisability   = "disability"
let kRelNeedsHelp    = "needsHelp"
let kDesTotal        = "total"
let kDesAdopted      = "adopted"
let kDesAdoptionDate = "adoptionDate"
let kAscCohabitation = "cohabitation"
*/

class Descendant: Relative {
    
    var total        : Bool   = false
    
    var adopted      : Bool   = false
    
    var adoptionDate : NSDate
    
    override init() {
        
        adoptionDate = initBirthDate()
        
        super.init()
    }
    
    /*
    override init(dictionary: NSMutableDictionary) {
        
        if let value = dictionary.valueForKey(kDesTotal) as? Bool {
            total = value
        }
        if let value = dictionary.valueForKey(kDesAdopted) as? Bool {
            adopted = value
        }
        if let value = dictionary.valueForKey(kDesAdoptionDate) as? NSDate {
            adoptionDate = value
        } else {
            adoptionDate = initBirthDate()
        }
        
        super.init(dictionary: dictionary)
    }
    
    override func dictionaryFromRelative() -> NSMutableDictionary {
        
        let dictionary = super.dictionaryFromRelative()
        
        dictionary.setValue(total,        forKey: kDesTotal)
        dictionary.setValue(adopted,      forKey: kDesAdopted)
        dictionary.setValue(adoptionDate, forKey: kDesAdoptionDate)
        
        return dictionary
    }*/
}

class Ascendant: Relative {
    
    var cohabitation : Bool = true
    
    override init() {
        super.init()
    }
    /*
    override init(dictionary: NSMutableDictionary) {
        
        if let value = dictionary.valueForKey(kAscCohabitation) as? Bool {
            cohabitation = value
        }
        
        super.init(dictionary: dictionary)
    }
    
    override func dictionaryFromRelative() -> NSMutableDictionary {
        
        let dictionary = super.dictionaryFromRelative()
        
        dictionary.setValue(cohabitation, forKey: kAscCohabitation)
        
        return dictionary
    }*/
}

class Relative: NSObject {
    
    // MARK: - Properties
    
    var name : String = String()
    
    var birthDate : NSDate
    
    var disability : Disability = .None
    
    var needsHelp : Bool = false


    // MARK: - Methods
    
    override init() {
        
        birthDate = initBirthDate()
        
        name = NSLocalizedString("unnamed_relative", comment: "Relatives")
        
        super.init();
    }
    /*
    init(dictionary: NSMutableDictionary) {
        
        if let value = dictionary.valueForKey(kRelName) as? String {
            name = value
        }
        
        if let value = dictionary.valueForKey(kRelBirthDate) as? NSDate {
            birthDate = value
        } else {
            birthDate = initBirthDate()
        }
        
        if let value = dictionary.valueForKey(kRelDisability) as? Disability.RawValue {
            disability = Disability(rawValue: value)!
        }
        
        if let value = dictionary.valueForKey(kRelNeedsHelp) as? Bool {
            needsHelp = value
        }
        
        super.init()
    }
    
    func dictionaryFromRelative() -> NSMutableDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(name,                forKey: kRelName)
        dictionary.setValue(birthDate,           forKey: kRelBirthDate)
        dictionary.setValue(disability.rawValue, forKey: kRelDisability)
        dictionary.setValue(needsHelp,           forKey: kRelNeedsHelp)
        
        return dictionary
    }*/
}
