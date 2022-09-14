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
        Text("Creating an image")
        CodePreviewView(code: code)
        Image("OneTapSwiftUI",label: Text("OneTapSwiftUI Image"))
            .resizable()
            .scaledToFit()
            .frame(width: 100)
        Image(systemName: "sun.max")
            .resizable()
            .scaledToFit()
            .frame(width: 100)
        if #available(iOS 16.0, *) {
            let mySize = CGSize(width: 200, height: 200)
            Image(size: mySize) { context in
                context.fill(
                    Path(
                        ellipseIn: CGRect(origin: .zero, size: mySize)),
                    with: .linearGradient(
                        Gradient(colors: [.yellow, .orange]),
                        startPoint: .zero,
                        endPoint: CGPoint(x: mySize.width, y:mySize.height))
                )
            }
            .resizable()
            .scaledToFit()
            .frame(width: 100)
        }
    }
}

struct ImageControlView_Previews: PreviewProvider {
    static var previews: some View {
        ImageControlView()
    }
}

