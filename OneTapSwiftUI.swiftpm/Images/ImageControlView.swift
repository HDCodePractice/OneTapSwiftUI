import SwiftUI



struct ImageControlView: View {
    var body: some View {
        VStack{
            HeadlineView(
                title: "Image", 
                url: "https://developer.apple.com/documentation/swiftui/image", 
                description: "A view that displays an image."
            )
            ImageViewCode()
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
        Image(systemName: "sun.max")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
        Text("sun")
            .font(.largeTitle)
    }
}

struct ImageControlView_Previews: PreviewProvider {
    static var previews: some View {
        ImageControlView()
    }
}

