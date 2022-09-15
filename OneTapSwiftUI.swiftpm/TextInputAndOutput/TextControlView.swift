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
                Group{
                    TextFromStringView()
                    Divider()
                    TextForDateView()
                    Divider()
                    TextFormattingView()
                    Divider()
                    TextForOverview()
                    Divider()
                    DynamicScaleText()
                }
                Divider()
            }
            .padding()
        }
        .padding()
    }
}

// Create by Yang Xu on 2022/9/15
// Modify by 老房东 on 2022/9/15
struct DynamicScaleText: View {
    var code: String {
        return """
VStack (alignment:. leading, spacing:20){
    let longText = "A view that displays one or more lines of read-only text."
    Text (longText)
        .truncationMode (.tail)
    Text (longText)
        . truncationMode (.middle)
    Text (longText)
        .minimumScaleFactor(0.3)
    if #available(iOS 16.0, *) {
        ViewThatFits{
            Text (longText)
            Text ("A view that display read-only text view")
            Text ("A view that display text")
            Text ("Text view")
                .minimumScaleFactor(0.3)
        }
    }
}
.lineLimit(1)
.frame (width: \(String(format: "%.0f", width)))
"""
    }
    @State var width: Double = 250
    var body: some View{
        VStack{
            Text("Dynamic Scale Text")
                .font(.title2)
            CodePreviewView(code: code)
            VStack (alignment:. leading, spacing:20){
                let longText = "A view that displays one or more lines of read-only text."
                Text (longText)
                    .truncationMode (.tail)
                Text (longText)
                    . truncationMode (.middle)
                Text (longText)
                    .minimumScaleFactor(0.3)
                if #available(iOS 16.0, *) {
                    ViewThatFits{
                        Text (longText)
                        Text ("A view that display read-only text view")
                        Text ("A view that display text")
                        Text ("Text view")
                            .minimumScaleFactor(0.3)
                    }
                }
            }
            .lineLimit(1)
            .frame (width: width)
            .border (.primary)
            Slider (value: $width, in: 100...350)
                .padding()
        }
    }
}


struct TextControlView_Previews: PreviewProvider {
    static var previews: some View {
        TextControlView()
    }
}
