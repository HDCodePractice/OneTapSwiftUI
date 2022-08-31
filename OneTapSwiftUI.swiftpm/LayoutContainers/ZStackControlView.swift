import SwiftUI

struct ZStackControlView: View {
    var body: some View {
        ScrollView{
            VStack{
                HeadlineView(
                    title: "ZStack", 
                    url: "https://developer.apple.com/documentation/swiftui/zstack", 
                    description: "A view that overlays its subviews, aligning them in both axes."
                )
                ZStackShapeView()
                Divider()
                ZStackDiceView()
                Divider()
            }
            .padding()
        }.padding()
    }
}

struct ZStackControlView_Previews: PreviewProvider {
    static var previews: some View {
        ZStackControlView()
    }
}

