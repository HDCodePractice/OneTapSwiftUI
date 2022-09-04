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
    @State var buttonText = "I'm a button. Click on me.""
    var body: some View {
        CodePreviewView(code: code)
        Button("\\(buttonText)"){ buttonText = "Just clicked"}
            .buttonStyle(.borderedProminent)
    }
}
"""
    @State var buttonText = "I'm a button. Click on me."
    var body: some View {
        CodePreviewView(code: code)
        Button("\(buttonText)"){ buttonText = "Just clicked"}
            .buttonStyle(.borderedProminent)
    }
}

struct ButtonControlView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonControlView()
    }
}
