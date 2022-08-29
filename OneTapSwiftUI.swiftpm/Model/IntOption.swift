import SwiftUI

struct IntOption: Identifiable{
    var id = UUID()
    var name : String
    var active: Bool = false {
        willSet{
            if !newValue {
                value = defaultValue
            }
        }
    }
    var value: Int
    var defaultValue : Int
    var range: ClosedRange<Double>
    
    init(
        name: String, 
        active:Bool=false, 
        value:Int, 
        defaultValue: Int? = nil,
        range: ClosedRange<Double> 
    ){
        self.name = name
        self.active = active
        self.value = value
        if let defaultValue=defaultValue {
            self.defaultValue=defaultValue
        }else{
            self.defaultValue=value
        }
        self.range = range
    }
    
    var doubleValue : Double{
        set{
            value = Int(newValue)
        }
        get{
            return Double(value)
        }
    }
    
    var valueString : String{
        let formatted = String(value)
        return formatted
    }
}
