import SwiftUI


struct DoubleOption: Identifiable{
    var id = UUID()
    var name : String
    var active: Bool = false
    var value: Double
    var defaultValue : Double?
    var range: ClosedRange<Double>
    
    var valueString : String{
        let formatted = String(format: "%.2f", value)
        return formatted
    }
}
