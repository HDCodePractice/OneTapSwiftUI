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
                MenuView()
                Divider()
                MenuPrimaryActionView()
                Divider()
            }
            .padding()
        }
        .padding()
    }
}

struct MenuControlView_Previews: PreviewProvider {
    static var previews: some View {
        MenuControlView()
    }
}



private struct MenuView: View {
    @State var selected = "no selected"
    
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
        VStack{
            Text("Create a Menu")
            CodePreviewView(code: code)
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
}

struct MenuPrimaryActionView: View {
    var code = """
@State var selected = "no selected"
var body: some View {
    VStack{
        Text("Selected: \\(selected)")
        Menu{
            Button { 
                selected = "selected 1"
            } label: { 
                Label("Select 1", systemImage: "1.circle")
            }
            Button { 
                selected = "selected 2"
            } label: { 
                Label("Select 2", systemImage: "2.circle")
            }
        }label: {
            Label("Select Menu", systemImage: "menubar.rectangle")
        }primaryAction: {
            selected = "select primary"
        }
    }
}
"""
    @State var selected = "no selected"
    var body: some View {
        VStack{
            Text("Create a Menu with primary action")
                .font(.title2)
            CodePreviewView(code: code)
            Text("Selected: \(selected)")
            Menu{
                Button { 
                    selected = "selected 1"
                } label: { 
                    Label("Select 1", systemImage: "1.circle")
                }
                Button { 
                    selected = "selected 2"
                } label: { 
                    Label("Select 2", systemImage: "2.circle")
                }
            }label: {
                Label("Select Menu", systemImage: "menubar.rectangle")
            }primaryAction: {
                selected = "select primary"
            }
        }
    }
}
