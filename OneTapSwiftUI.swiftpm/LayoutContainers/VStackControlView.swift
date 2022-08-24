import SwiftUI

struct VStackControlView: View {
    @State var alignment : HorizontalAlignment = .center
    
    var body: some View {
        VStack{
            HeadlineView(
                title: "VStack", 
                url: "https://developer.apple.com/documentation/swiftui/vstack", 
                description: "A view that arranges its subviews in a vertical line."
            )
            VStackView()
            Spacer()
        }
        .padding()
    }
}

struct VStackControlView_Previews: PreviewProvider {
    static var previews: some View {
        VStackControlView()
    }
}
