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
                Divider()
                ButtonStyleSample()
            }
            .padding()
        }
        .padding()
    }
}

private struct MyButtonStyle: ButtonStyle {
    var bgColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .shadow(color: .white, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? -5: -15, y: configuration.isPressed ? -5: -15)
                        .shadow(color: .black, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? 5: 15, y: configuration.isPressed ? 5: 15)
                        .blendMode(.overlay)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(bgColor)
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .foregroundColor(.primary)
    }
}

private struct ButtonStyleSample: View {
    var code = """
struct MyButtonStyle: ButtonStyle {
    var bgColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .shadow(color: .white, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? -5: -15, y: configuration.isPressed ? -5: -15)
                        .shadow(color: .black, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? 5: 15, y: configuration.isPressed ? 5: 15)
                        .blendMode(.overlay)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(bgColor)
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .foregroundColor(.primary)
    }
}

struct ButtonStyleSample: View {
    var body: some View {
        Button("Custom ButtonStyle"){}
            .buttonStyle(MyButtonStyle(bgColor: .accentColor))
    }
}
"""
    
    var body: some View {
        CodePreviewView(code: code)
        Button("Custom ButtonStyle"){}
            .buttonStyle(MyButtonStyle(bgColor: .accentColor))
    }
}

private struct ButtonViewCode: View {
    var code = """
struct ButtonViewCode: View {
        @State var tapMessage = "Tap a Button"
    var body: some View {
        Text( tapMessage )
        HStack{
            Button("Button1"){
                tapMessage = "Button1"
            }.buttonStyle(.borderedProminent)
            Button {
                tapMessage = "Button2"
            } label: {
                Label("Button2",systemImage: "2.circle")
            }.buttonStyle(.borderedProminent)
        }
            HStack{
                Button("Delete Role", role: .destructive) { tapMessage = "Delete Role" }.buttonStyle(.borderedProminent)
                Button("Cancel Role", role: .cancel) { tapMessage = "Cancel Role" }.buttonStyle(.borderedProminent)
            }
            HStack{
                Button("automatic") { tapMessage = "automatic" }.buttonStyle(.automatic)
                Button("bordered") { tapMessage = "bordered" }.buttonStyle(.bordered)
            }
            HStack{
                Button("borderedProminent") { tapMessage = "borderedProminent" }.buttonStyle(.borderedProminent)
                Button("borderless") { tapMessage = "borderless" }.buttonStyle(.borderless)
            }
    }
}
"""
    @State var tapMessage = "Tap a Button"
    var body: some View {
        CodePreviewView(code: code)
        VStack{
            Text( tapMessage )
            HStack{
                Button("Button1"){
                    tapMessage = "Button1"
                }.buttonStyle(.borderedProminent)
                Button {
                    tapMessage = "Button2"
                } label: {
                    Label("Button2",systemImage: "2.circle")
                }.buttonStyle(.borderedProminent)
            }
            HStack{
                Button("Delete Role", role: .destructive) { tapMessage = "Delete Role" }.buttonStyle(.borderedProminent)
                Button("Cancel Role", role: .cancel) { tapMessage = "Cancel Role" }.buttonStyle(.borderedProminent)
            }
            HStack{
                Button("automatic") { tapMessage = "automatic" }.buttonStyle(.automatic)
                Button("bordered") { tapMessage = "bordered" }.buttonStyle(.bordered)
            }
            HStack{
                Button("borderedProminent") { tapMessage = "borderedProminent" }.buttonStyle(.borderedProminent)
                Button("borderless") { tapMessage = "borderless" }.buttonStyle(.borderless)
            }
        }
        .padding()
        .border(.black)
    }
}

struct ButtonControlView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonControlView()
    }
}
