import SwiftUI

struct ZStackControlView: View {
    @State var alignment : HorizontalAlignment = .center
    
    var body: some View {
        VStack{
            HeadlineView(
                title: "ZStack", 
                url: "https://developer.apple.com/documentation/swiftui/zstack", 
                description: "A view that overlays its subviews, aligning them in both axes."
            )
            ZStackShapeView()
            ZStackTextView()
            Spacer()
        }
        .padding()
    }
}

struct ZStackControlView_Previews: PreviewProvider {
    static var previews: some View {
        ZStackControlView()
    }
}

