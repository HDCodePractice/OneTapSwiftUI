import SwiftUI



struct ImageView: View {
    
    
    var body: some View {
        
        VStack{
            HeadlineView(
                title: "Image", 
                url: "https://developer.apple.com/documentation/swiftui/image", 
                description: "A view that displays an image."
            )
            
            ImageViewCode()
            Image(systemName: "sun.max")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Text("sun")
                .font(.largeTitle)
        }
    }
}

private struct ImageViewCode: View {
    var code = """
    
Image(systemName: "sun.max")
    .resizable()
    .aspectRatio(contentMode: .fit)
Text("sun")
    .font(.largeTitle)
        
        
"""
    var body: some View {
        CodePreviewView(code: code)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}

