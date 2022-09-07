import SwiftUI

struct ButtonControlView: View {
    var body: some View {
        ScrollView{
            VStack{
                HeadlineView(
                    title: "Button",
                    url: "https://developer.apple.com/documentation/swiftui/button",
                    description: "A control that initiates an action."
                )
                ButtonViewCode()
            }
            .padding()
        }
        .padding()
    }
}

private struct ButtonViewCode: View {
    var code = """
struct ButtonViewCode: View {
        @State var tapMessage = "Tap a Button"
    var body: some View {
        Text( tapMessage )
        HStack{
            Button("Button1"){
                tapMessage = "Button1"
            }.buttonStyle(.borderedProminent)
            Button {
                tapMessage = "Button2"
            } label: {
                Label("Button2",systemImage: "2.circle")
            }.buttonStyle(.borderedProminent)
        }
    }
}
"""
    @State var tapMessage = "Tap a Button"
    var body: some View {
        CodePreviewView(code: code)
        Text( tapMessage )
        HStack{
            Button("Button1"){
                tapMessage = "Button1"
            }.buttonStyle(.borderedProminent)
            Button {
                tapMessage = "Button2"
            } label: {
                Label("Button2",systemImage: "2.circle")
            }.buttonStyle(.borderedProminent)
        }
    }
}

struct ButtonControlView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonControlView()
    }
}
