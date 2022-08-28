import SwiftUI

struct MenuControlView: View {
    var body: some View {
        ScrollView{
            VStack{
                HeadlineView(
                    title: "Menu", 
                    url: "https://developer.apple.com/documentation/swiftui/menu", 
                    description: "A control for presenting a menu of actions."
                )
                MenuViewCode()
                MenuView()
                Divider()
            }
        }
        .padding()
    }
}

struct MenuControlView_Previews: PreviewProvider {
    static var previews: some View {
        MenuControlView()
    }
}

private struct MenuViewCode: View {
    var code : String{
        return """
@State var selected = "no selected"
var body: some View {
    Text("Selected: \\(selected)")
    Menu("Actions Menu") {
        Text("Text")
        Image(systemName: "star")
        Button("Button"){ selected = "Button"}
        Divider()
        Menu("SubMenu") { 
            Label("Label", systemImage: "house")
            Button("Sub Menu Button"){ selected = "Sub Menu Button"}
        }
        Link("Link",destination: URL(string: "https://www.apple.com")!)
    }
}
"""
    }
    
    var body: some View {
        CodePreviewView(code: code)
    }
}

private struct MenuView: View {
    @State var selected = "no selected"
    var body: some View {
        Text("Selected: \(selected)")
        Menu("Actions Menu") {
            Text("Text")
            Image(systemName: "star")
            Button("Button"){ selected = "Button"}
            Divider()
            Menu("SubMenu") { 
                Label("Label", systemImage: "house")
                Button("Sub Menu Button"){ selected = "Sub Menu Button"}
            }
            Link("Link",destination: URL(string: "https://www.apple.com")!)
        }
    }
}
