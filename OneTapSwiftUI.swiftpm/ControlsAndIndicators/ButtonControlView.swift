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
                SimpleButtonView()
                Divider()
                ButtonRoleView()
                Divider()
                ButtonStyleView()
                Divider()
                ButtonStyleSample()
                Divider()
                ButtonBorderShapView()
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
        Text("Custom ButtonStyle")
            .font(.title2)
        CodePreviewView(code: code)
        Button("Custom ButtonStyle"){}
            .buttonStyle(MyButtonStyle(bgColor: .accentColor))
    }
}

private struct SimpleButtonView: View {
    var code = """
Button("Button1"){
    tapMessage = "Button1"
}
Button {
    tapMessage = "Button2"
} label: {
    Label("Button2",systemImage: "2.circle")
}
"""
    @State var tapMessage = "Tap a Button"
    var body: some View {
        VStack{
            Text("Text and Label Button")
                .font(.title2)
            CodePreviewView(code: code)
            HStack{
                Button("Button1"){
                    tapMessage = "Button1"
                }
                Button {
                    tapMessage = "Button2"
                } label: {
                    Label("Button2",systemImage: "2.circle")
                }
            }
        }
    }
}

private struct ButtonBorderShapView: View {
    var code = """
Button("automatic"){
    tapMessage = "automatic"
}
.buttonStyle(.borderedProminent)
.buttonBorderShape(.automatic)
Button("capsule"){
    tapMessage = "capsule"
}
.buttonStyle(.borderedProminent)
.buttonBorderShape(.capsule)
Button("roundedRectangle"){
    tapMessage = "roundedRectangle"
}
.buttonStyle(.borderedProminent)
.buttonBorderShape(.roundedRectangle)
Button("roundedRectangle(radius)"){
    tapMessage = "roundedRectangle(radius)"
}
.buttonStyle(.borderedProminent)
.buttonBorderShape(.roundedRectangle(radius: 20))
"""
    @State var tapMessage = "Tap a Button"
    var body: some View {
        VStack{
            Text("buttonBorderShape")
                .font(.title2)
            CodePreviewView(code: code)
            Text( "You taped: \(tapMessage)" )
            HStack{
                Button("automatic"){
                    tapMessage = "automatic"
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.automatic)
                Button("capsule"){
                    tapMessage = "capsule"
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
            }
            HStack{
                Button("roundedRectangle"){
                    tapMessage = "roundedRectangle"
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle)
                Button("roundedRectangle(radius)"){
                    tapMessage = "roundedRectangle(radius)"
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 20))
            }
        }
    }
}

private struct ButtonRoleView: View {
    var code = """
Button("Delete Role", role: .destructive) {
    tapMessage = "Delete Role"
}
Button("Cancel Role", role: .cancel) {
    tapMessage = "Cancel Role"
}
"""
    @State var tapMessage = "Tap a Button"
    var body: some View {
        VStack{
            Text("Button Role")
                .font(.title2)
            CodePreviewView(code: code)
            Text( "You taped: \(tapMessage)" )
            HStack{
                Button("Delete Role", role: .destructive) {
                    tapMessage = "Delete Role"
                }
                Button("Cancel Role", role: .cancel) {
                    tapMessage = "Cancel Role"
                }
            }
        }
    }
}

private struct ButtonStyleView: View {
    var code = """
Button("automatic") { tapMessage = "automatic Style" }
    .buttonStyle(.automatic)
Button("bordered") { tapMessage = "bordered" }
    .buttonStyle(.bordered)
Button("borderedProminent") { tapMessage = "borderedProminent" }
    .buttonStyle(.borderedProminent)
Button("borderless") { tapMessage = "borderless" }
    .buttonStyle(.borderless)
"""
    @State var tapMessage = "Tap a Button"
    var body: some View {
        VStack{
            Text("Button Style")
                .font(.title2)
            CodePreviewView(code: code)
            Text( "You taped: \(tapMessage)" )
            HStack{
                Button("automatic") { tapMessage = "automatic Style" }
                    .buttonStyle(.automatic)
                Button("bordered") { tapMessage = "bordered" }
                    .buttonStyle(.bordered)
            }
            HStack{
                Button("borderedProminent") { tapMessage = "borderedProminent" }
                    .buttonStyle(.borderedProminent)
                Button("borderless") { tapMessage = "borderless" }
                    .buttonStyle(.borderless)
            }
        }
    }
}

struct ButtonControlView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonControlView()
    }
}
