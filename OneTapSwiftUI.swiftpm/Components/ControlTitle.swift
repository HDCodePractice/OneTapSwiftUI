import SwiftUI

struct ControlTitle: View {
    var title: String
    var url: String
    var description: String
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                Text("VStack")
                    .font(.largeTitle)
                Link(destination: URL(string: "https://developer.apple.com/documentation/swiftui/vstack")!) { 
                    Image(systemName: "link")
                }
                Spacer()
            }
            Text(description)
            Divider()
        }
    }
}

struct ControlTitle_Previews: PreviewProvider {
    static var previews: some View {
        ControlTitle(title: "VStack", url: "https://developer.apple.com/documentation/swiftui/vstack", description: "A view that arranges its subviews in a vertical line.")
    }
}
