import SwiftUI

struct HeadlineView: View {
    var title: String
    var url: String
    var description: String
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                Text(title)
                    .font(.largeTitle)
                Link(destination: URL(string: url)!) { 
                    Image(systemName: "link")
                }
                Spacer()
            }
            Text(description)
            Divider()
        }
    }
}

struct HeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineView(title: "VStack", url: "https://developer.apple.com/documentation/swiftui/vstack", description: "A view that arranges its subviews in a vertical line.")
    }
}
