import SwiftUI

struct DividerControlView: View {
    var body: some View {
        ScrollView{
            VStack{
                HeadlineView(
                    title: "Divider",
                    url: "https://developer.apple.com/documentation/swiftui/divider",
                    description: "A visual element that can be used to separate other content."
                )
                DividerViewCode()
            }
            .padding()
        }
    }
}

private struct DividerViewCode: View {
    var code = """
VStack{
    Text("Vertical divider")
    Divider()
        .frame(width: 100)
    Text("Adjust SwiftUI Divider Thickness and Color")
    Divider()
        .frame(height:4)
        .overlay(.blue)
    HStack{
        Text("Horizontal divider")
        Divider()
            .background(.mint)
            .frame(height: 200)
        Text("Adjust SwiftUI Divider Thickness and Color")
        Divider()
            .frame(width: 4)
            .overlay(.red)
        Text("End")
    
    }
}
"""
    var body: some View {
        CodePreviewView(code: code)
        VStack{
            Text("Vertical divider")
            Divider()
                .frame(width: 100)
            Text("Adjust SwiftUI Divider Thickness and Color")
            Divider()
                .frame(height:4)
                .overlay(.blue)
            HStack{
                Text("Horizontal divider")
                Divider()
                    .background(.mint)
                    .frame(height: 200)
                Text("Adjust SwiftUI Divider Thickness and Color")
                Divider()
                    .frame(width: 4)
                    .overlay(.red)
                Text("End")
            
            }
        }
        .border(.primary)
        .padding()
    }
}

struct DividerControlView_Previews: PreviewProvider {
    static var previews: some View {
        DividerControlView()
    }
}



