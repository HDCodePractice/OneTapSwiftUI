//
//  optionOption.swift
//  
//
//  Created by 老房东 on 2022-09-14.
//

import SwiftUI

struct OptionOption: Identifiable{
    var id = UUID()
    var name : String
    var active: Bool
    var value: Bool{
        return active
    }
    
    init(
        name: String,
        active:Bool=true
    ){
        self.name = name
        self.active = active
    }
    
    var valueString : String{
        let formatted = String(value)
        return formatted
    }
}

