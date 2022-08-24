import SwiftUI

struct VStackControlView: View {
    var body: some View {
        VStack{
            ControlTitle(
                title: "VStack", 
                url: "https://developer.apple.com/documentation/swiftui/vstack", 
                description: "A view that arranges its subviews in a vertical line."
            )            
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
