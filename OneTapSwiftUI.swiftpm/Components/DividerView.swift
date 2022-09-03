import SwiftUI

struct DividerView: View {
    
    var body: some View {
        
        VStack{
            HeadlineView(
                title: "Divider", 
                url: "https://developer.apple.com/documentation/swiftui/divider", 
                description: "A visual element that can be used to separate other content."
            )
            
            DividerViewCode()
                .padding()
            Divider()
                .padding()
            
        }
    }
}

private struct DividerViewCode: View {
    var code = """
    
Divider()

        
"""
    var body: some View {
        CodePreviewView(code: code)
    }
}

struct DividerView_Previews: PreviewProvider {
    static var previews: some View {
        DividerView()
    }
}



