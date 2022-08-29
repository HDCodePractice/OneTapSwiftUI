import SwiftUI


struct DoubleOption: Identifiable{
    var id = UUID()
    var name : String
    var active: Bool = false {
        willSet{
            if !newValue {
                value = defaultValue ?? 0
            }
        }
    }
    var value: Double
    var defaultValue : Double?
    var range: ClosedRange<Double>
    
    init(
        name: String, 
        active:Bool=false, 
        value:Double, 
        defaultValue: Double? = nil,
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
    
    var valueString : String{
        let formatted = String(format: "%.2f", value)
        return formatted
    }
}
