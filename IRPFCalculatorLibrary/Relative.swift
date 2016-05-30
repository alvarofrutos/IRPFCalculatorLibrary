//
//  Relative.swift
//  IRPFCalculatorLibrary
//
//  Created by Álvaro Frutos on 11/12/14.
//  Copyright (c) 2014 Álvaro Frutos. All rights reserved.
//

import UIKit


class Descendant: Relative {
    
    var total        : Bool   = false
    
    var adopted      : Bool   = false
    
    var adoptionDate : NSDate
    
    override init() {
        
        adoptionDate = initBirthDate()
        
        super.init()
    }
}

class Ascendant: Relative {
    
    var cohabitation : Bool = true
    
    override init() {
        super.init()
    }
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
}
