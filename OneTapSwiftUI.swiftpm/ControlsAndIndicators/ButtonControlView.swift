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
            }
            .padding()
        }
        .padding()
    }
}

struct ButtonStyleSample: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
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
