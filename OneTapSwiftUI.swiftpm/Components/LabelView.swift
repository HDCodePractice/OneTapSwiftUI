import SwiftUI

struct LabelView: View {
    
    var body: some View {
        
        VStack{
            HeadlineView(
                title: "Label", 
                url: "https://developer.apple.com/documentation/swiftui/label", 
                description: "A standard label for user interface items, consisting of an icon with a title."
            )
            
            LabelViewCode()
            
            Label("Lighting", systemImage: "bolt.fill")
                .font(.largeTitle)
                .padding()
        }
    }
}

private struct LabelViewCode: View {
    var code = """
    
Label("Lighting", systemImage: "bolt.fill")
    .font(.largeTitle)
    .padding()
        

        
"""
    var body: some View {
        CodePreviewView(code: code)
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView()
    }
}

