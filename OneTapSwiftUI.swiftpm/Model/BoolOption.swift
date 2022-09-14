import SwiftUI

struct BoolOption: Identifiable{
    var id = UUID()
    var name : String
    var active: Bool = false {
        willSet{
            if !newValue {
                value = defaultValue
            }
        }
    }
    var value: Bool
    var defaultValue : Bool
    var isOption = false
    
    init(
        name: String, 
        active:Bool=false, 
        value:Bool, 
        defaultValue: Bool? = nil,
        isOption : Bool = false
    ){
        self.name = name
        self.active = active
        self.value = value
        if let defaultValue=defaultValue {
            self.defaultValue=defaultValue
        }else{
            self.defaultValue=value
        }
        self.isOption = isOption
    }
    
    var valueString : String{
        let formatted = String(value)
        return formatted
    }
}
