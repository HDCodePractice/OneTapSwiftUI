import SwiftUI



struct ButtonView: View {
    @State var buttonText = "I'm a button. Click on me."
    
    var body: some View {
        VStack{
            HeadlineView(
                title: "Button", 
                url: "https://developer.apple.com/documentation/swiftui/button", 
                description: "A control that initiates an action."
            )
            
            ButtonViewCode()
            Button("\(buttonText)"){ buttonText = "Just clicked"}
                .buttonStyle(.borderedProminent)
            
            
        }
    }
}

private struct ButtonViewCode: View {
    var code = """

        Button("I'm button. Click on me."){ //action
         buttonText = "Just clicked"
}
        
        
"""
    var body: some View {
        CodePreviewView(code: code)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
