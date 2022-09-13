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
                Group{
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
                Divider()
                NeumorphicButtonView()
            }
            .padding()
        }
        .padding()
    }
}

extension Color {
    static let neuBackground = Color(hex: "f0f0f3")
    static let dropShadow = Color(hex: "aeaec0").opacity(0.4)
    static let dropLight = Color(hex: "ffffff")
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

private struct NeumorphismSimpleStyle: ButtonStyle {
    var bgColor: Color
    var dropShadow : Color = .black
    var dropLight : Color = .white
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(bgColor)
            )
            .shadow(color: dropShadow, radius: 15, x: 10, y: 10)
            .shadow(color: dropLight, radius: 15, x: -10, y: -10)
            .scaleEffect(configuration.isPressed ? 0.98: 1)
            .foregroundColor(.primary)
    }
}

private struct NeumorphismStyle: ButtonStyle {
    var bgColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .shadow(color: .white, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? -5: -10, y: configuration.isPressed ? -5: -10)
                            .shadow(color: .black, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? 5: 10, y: configuration.isPressed ? 5: 10)
                            .blendMode(.overlay)
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(bgColor)
                    }
                )
                .scaleEffect(configuration.isPressed ? 0.98: 1)
                .foregroundColor(.primary)
    }
}

struct NeumorphicButtonView: View {
    var code = """
extension Color {
    static let neuBackground = Color(hex: "f0f0f3")
    static let dropShadow = Color(hex: "aeaec0").opacity(0.4)
    static let dropLight = Color(hex: "ffffff")
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

private struct NeumorphismSimpleStyle: ButtonStyle {
    var bgColor: Color
    var dropShadow : Color = .black
    var dropLight : Color = .white
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(bgColor)
            )
            .shadow(color: dropShadow, radius: 15, x: 10, y: 10)
            .shadow(color: dropLight, radius: 15, x: -10, y: -10)
            .scaleEffect(configuration.isPressed ? 0.98: 1)
            .foregroundColor(.primary)
    }
}

private struct NeumorphismStyle: ButtonStyle {
    var bgColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .shadow(color: .white, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? -5: -10, y: configuration.isPressed ? -5: -10)
                            .shadow(color: .black, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? 5: 10, y: configuration.isPressed ? 5: 10)
                            .blendMode(.overlay)
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(bgColor)
                    }
                )
                .scaleEffect(configuration.isPressed ? 0.98: 1)
                .foregroundColor(.primary)
    }
}

struct NeumorphicButtonView: View {
    var body: some View {
        ZStack{
            Color.neuBackground
            Button("Neumorphism Button"){}
                .buttonStyle(NeumorphismSimpleStyle(bgColor: .neuBackground, dropShadow: .dropShadow, dropLight: .dropLight))
        }
        .frame(height: 100)

        ZStack{
            Color.neuBackground
            Button("Neumorphism Button"){}
                .buttonStyle(NeumorphismStyle(bgColor: Color.neuBackground))
        }
        .frame(height: 100)

        ZStack{
            let bgColor: Color = .red
            bgColor
            Button("Neumorphism Button"){}
                .buttonStyle(NeumorphismStyle(bgColor: bgColor))
        }
        .frame(height: 100)
    }
}

"""
    var body: some View {
        HStack{
            Text("Neumorphic Button")
            LinkView(url: "https://dribbble.com/shots/9915063-Neumorphism")
        }
        .font(.title2)
        
        CodePreviewView(code: code)
        
        ZStack{
            Color.neuBackground
            Button("Neumorphism Button"){}
                .buttonStyle(NeumorphismSimpleStyle(bgColor: .neuBackground, dropShadow: .dropShadow, dropLight: .dropLight))
        }
        .frame(height: 100)
        .padding()
        
        ZStack{
            Color.neuBackground
            Button("Neumorphism Button"){}
                .buttonStyle(NeumorphismStyle(bgColor: Color.neuBackground))
        }
        .frame(height: 100)
        .padding()
        
        ZStack{
            let bgColor: Color = .red
            bgColor
            Button("Neumorphism Button"){}
                .buttonStyle(NeumorphismStyle(bgColor: bgColor))
        }
        .frame(height: 100)
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
