import SwiftUI

struct TextFormattingView: View {
    var now = Date()
    
    var code: String {
        return """
Text(now,format: Date.FormatStyle(date: .numeric, time: .standard))
Text(now,format: Date.FormatStyle(date: .numeric, time: .complete))
Text(now,format: Date.FormatStyle(date: .numeric, time: .shortened))
Text(now, format: .dateTime.hour())
Text(now, format: .dateTime.hour(.conversationalDefaultDigits(amPM: .omitted)))
Text(now, format: .dateTime.day(.twoDigits))
Text(now, format: .dateTime.month())
Text(now, format: .dateTime.month(.twoDigits))
Text(now, format: .dateTime.year())
Text(now, format: .dateTime.year(.twoDigits))
Text(now, format: .dateTime.timeZone())
Text(now, format: .dateTime.timeZone(.identifier(.long)))
Text(now, format: .dateTime.era(.wide))
Text(now, format: .dateTime.dayOfYear())
Text(now, format: .dateTime.weekday())
Text(now, format: .dateTime.weekday(.oneDigit))
"""
    }
    
    var body: some View {
        VStack{
            Text("Creating a text view with Date formatting")
                .font(.title2)
            CodePreviewView(code: code)
            VStack{
                VStack{
                    Text(now,format: Date.FormatStyle(date: .numeric, time: .standard))
                    Text(now,format: Date.FormatStyle(date: .numeric, time: .complete))
                    Text(now,format: Date.FormatStyle(date: .numeric, time: .shortened))
                    Text(now, format: .dateTime.hour())
                    Text(now, format: .dateTime.hour(.conversationalDefaultDigits(amPM: .omitted)))
                    Text(now, format: .dateTime.day(.twoDigits))
                    Text(now, format: .dateTime.month())
                    Text(now, format: .dateTime.month(.twoDigits))
                    Text(now, format: .dateTime.year())
                    Text(now, format: .dateTime.year(.twoDigits))
                }
                Text(now, format: .dateTime.timeZone())
                Text(now, format: .dateTime.timeZone(.identifier(.long)))
                Text(now, format: .dateTime.era(.wide))
                Text(now, format: .dateTime.dayOfYear())
                Text(now, format: .dateTime.weekday())
                Text(now, format: .dateTime.weekday(.oneDigit))
            }
        }
    }
}

struct TextFormattingView_Previews: PreviewProvider {
    static var previews: some View {
        TextFormattingView()
    }
}
