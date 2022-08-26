import SwiftUI

struct VStackControlView: View {
    var body: some View {
        ScrollView{
            VStack{
                HeadlineView(
                    title: "VStack", 
                    url: "https://developer.apple.com/documentation/swiftui/vstack", 
                    description: "A view that arranges its subviews in a vertical line."
                )
                VStackView()
                Spacer()
            }
        }
        .padding()
    }
}

struct VStackControlView_Previews: PreviewProvider {
    static var previews: some View {
        VStackControlView()
    }
}
