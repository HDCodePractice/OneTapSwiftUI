import SwiftUI

private enum DateStyleType: String,CaseIterable,Identifiable{
    case date = ".date"
    case offset = ".offset"
    case relative = ".relative"
    case time = ".time"
    case timer = ".timer"
    
    var id: Self { self }
    var caseValue: Text.DateStyle {
        switch self{
        case .date:
            return .date
        case .offset:
            return .offset
        case .relative:
            return .relative
        case .time:
            return .time
        case .timer:
            return .timer
        }
    }
}


struct TextForDateView: View {
    @State var now = Date()
    
    var codeString: String{
        var rCodeString = ""
        for dateStyleType in DateStyleType.allCases{
            rCodeString += "        Text(\"\(dateStyleType.rawValue)\") + Text(now, style: \(dateStyleType.rawValue))\n"
        }
        return rCodeString
    }
    
    var code: String{ return """
@State var now = Date()

var body: some View {
    VStack(alignment: .leading){
\(codeString)    }
}
"""
    }
    
    var body: some View {
        VStack{
            CodePreviewView(code: code)
            VStack(alignment: .leading){
                ForEach(DateStyleType.allCases){ dateStyleType in
                    Text("\(dateStyleType.rawValue): ").bold() + Text(now, style: dateStyleType.caseValue)
                }
            }
            Button("Reset"){
                now = Date()
            }.buttonStyle(.borderedProminent)
        }
    }
}

struct TextForDateView_Previews: PreviewProvider {
    static var previews: some View {
        TextForDateView()
    }
}
