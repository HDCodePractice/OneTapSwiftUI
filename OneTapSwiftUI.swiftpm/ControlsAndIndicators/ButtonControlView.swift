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
        @State var isTapButton = false
    var body: some View {
        CodePreviewView(code: code)
        Button("\\(isTapButton ? "I'm a button. Click on me." : "Just clicked" )"){
            isTapButton.toggle()
            
        }.buttonStyle(.borderedProminent)
    }
}
"""
    @State var isTapButton = false
    var body: some View {
        CodePreviewView(code: code)
        Button("\(isTapButton ? "I'm a button. Click on me." : "Just clicked" )"){
            isTapButton.toggle()
            
        }.buttonStyle(.borderedProminent)
    }
}

struct ButtonControlView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonControlView()
    }
}
