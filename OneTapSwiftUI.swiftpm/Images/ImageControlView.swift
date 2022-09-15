import SwiftUI

struct ImageControlView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeadlineView(
                    title: "Image",
                    url: "https://developer.apple.com/documentation/swiftui/image",
                    description: "A view that displays an image."
                )
                CreateImageView()
                Divider()
                ImageModifierView()
                Divider()
            }
            .padding()
        }
    }
}

private struct ImageModifierView: View {
    var code: String {
        var viewCode = "Image(\"OneTapSwiftUI-small\")"
        if isResizable.value {
            viewCode += "\n .resizable()"
        }
        if isScaledToFit.value {
            viewCode += "\n .scaledToFit()"
        }
        if isScaledToFill.value {
            viewCode += "\n .scaledToFill()"
        }
        viewCode += "\n .frame(width: 200,height: 300)\n .border(.primary)"
        return viewCode
    }

    @State var isResizable = OptionOption(name: "resizable", active: false)
    @State var isScaledToFit = OptionOption(name: "scaledToFit", active: false)
    @State var isScaledToFill = OptionOption(name: "scaledToFill", active: false)
    var body: some View {
        VStack {
            Text("Image Modifier")
                .font(.title2)
            CodePreviewView(code: code)
            Image("OneTapSwiftUI-small")
                .if(isResizable.value) {
                    $0.resizable()
                }
                .if(isScaledToFit.value) {
                    $0.scaledToFit()
                }
                .if(isScaledToFill.value) {
                    $0.scaledToFill()
                }
                .frame(width: 200, height: 300)
                .border(.primary)
            OptionOptionView(option: $isResizable)
            OptionOptionView(option: $isScaledToFit)
            OptionOptionView(option: $isScaledToFill)
        }
    }
}

private struct CreateImageView: View {
    var code = """
    Image("OneTapSwiftUI")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Image(systemName: "sun.max")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    if let cgImage = UIImage(named: "OneTapSwiftUI")?.cgImage{
        Image(decorative: cgImage,scale: 1.0,orientation: .up)
    }
    """
    var body: some View {
        Text("Creating an image")
        CodePreviewView(code: code)
        Image("OneTapSwiftUI")
            .resizable()
            .scaledToFit()
            .frame(width: 100)
        Image(systemName: "sun.max")
            .resizable()
            .scaledToFit()
            .frame(width: 100)
        if let cgImage = UIImage(named: "OneTapSwiftUI")?.cgImage {
            Image(decorative: cgImage, scale: 1.0, orientation: .up)
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
