import SwiftUI

struct LabelControlView: View {
    var body: some View {
        ScrollView{
            VStack{
                HeadlineView(
                    title: "Label",
                    url: "https://developer.apple.com/documentation/swiftui/label",
                    description: "A standard label for user interface items, consisting of an icon with a title."
                )
                LabelViewCode()
                Divider()
                LabelStyleSample()
            }
            .padding()
        }
    }
}

private struct LabelStyleSample: View {
    var code = """
    struct MyLabelStyle: LabelStyle{
        func makeBody(configuration: Configuration) -> some View {
            HStack{
                configuration.title
                    .foregroundColor(.accentColor)
                configuration.icon
                    .foregroundColor(.red)
            }
        }
    }
    
    struct LabelStyleSample: View {
        var body: some View {
            Label("MyLabelStyle",systemImage: "heart")
                .labelStyle(MyLabelStyle())
        }
    }
    """
    var body: some View {
        VStack{
            Text("Custom LabelStyle")
                .font(.title2)
            CodePreviewView(code: code)
            Label("MyLabelStyle",systemImage: "heart")
                .labelStyle(MyLabelStyle())
        }
    }
}

private struct MyLabelStyle: LabelStyle{
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.title
                .foregroundColor(.accentColor)
            configuration.icon
                .foregroundColor(.red)
        }
    }
    
}


private struct LabelViewCode: View {
    var code = """
Label("Favorites", systemImage: "heart")
Label("image label", image: "OneTapSwiftUI-small")
Label { 
    Text("different label")
        .bold()
} icon: { 
    Image("OneTapSwiftUI-small")
        .resizable()
        .scaledToFit()
        .frame(width: 40)
}
Label("Favorites", systemImage: "heart")
    .labelStyle(.automatic)
Label("Favorites", systemImage: "heart")
    .labelStyle(.titleOnly)
Label("Favorites", systemImage: "heart")
    .labelStyle(.iconOnly)
Label("Favorites", systemImage: "heart")
    .labelStyle(.titleAndIcon)
"""
    var body: some View {
        CodePreviewView(code: code)
        VStack{
            Label("systemImage label", systemImage: "bolt.fill")
            Label("image label", image: "OneTapSwiftUI-small")
            Label {
                Text("different label")
                    .bold()
            } icon: {
                Image("OneTapSwiftUI-small")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
            }
            Label("Favorites", systemImage: "heart")
                .labelStyle(.automatic)
            Label("Favorites", systemImage: "heart")
                .labelStyle(.titleOnly)
            Label("Favorites", systemImage: "heart")
                .labelStyle(.iconOnly)
            Label("Favorites", systemImage: "heart")
                .labelStyle(.titleAndIcon)
        }
        .border(.primary)
    }
}

struct LabelControlView_Previews: PreviewProvider {
    static var previews: some View {
        LabelControlView()
    }
}

