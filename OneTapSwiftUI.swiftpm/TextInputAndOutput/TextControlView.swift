import SwiftUI

struct TextControlView: View {
    var body: some View {
        ScrollView{
            VStack{
                HeadlineView(
                    title: "Text", 
                    url: "https://developer.apple.com/documentation/swiftui/text", 
                    description: "A view that displays one or more lines of read-only text."
                )
                TextFromStringView()
                Divider()
                TextForDateView()
                Divider()
                TextFormattingView()
                Divider()
                TextForOverview()
                Divider()
            }
        }
        .padding()
    }
}

struct TextControlView_Previews: PreviewProvider {
    static var previews: some View {
        TextControlView()
    }
}
