import SwiftUI

struct AnimatableControlView: View {
    var body: some View {
        ScrollView{
            VStack{
                HeadlineView(
                    title: "Animatable", 
                    url: "https://developer.apple.com/documentation/swiftui/animatable", 
                    description: "A type that describes how to animate a property of a view."
                )
                BackAndForthFlipView()
                Divider()
                AnimationColorChangeView()
            }
            .padding()
        }.padding()
    }
}

private struct AnimationColorChangeView: View {
    var code : String{
        return """
struct AnimationColorChangeView: View {
    @State var isAnimation = false
    var body: some View {
        VStack{
            AnimationColorChange(progress: isAnimation ? 0 : 125)
            Button("Start Animation"){
                withAnimation(.linear(duration: 1)) { 
                    isAnimation.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct AnimationColorChange: View, Animatable {
    var progress : Double
    var animatableData: Double{
        get { progress }
        set { progress = newValue }
    }
    
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.mint)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.red)
                            .offset(x: 125-progress,y: 0)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .frame(width: 100, height: 100)
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.mint)
                    .overlay(
                        Circle()
                            .fill(.red)
                            .frame(width: 125-progress, height: 200)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .frame(width: 100, height: 100)
        }
    }
}
"""
    }
    @State var isAnimation = false
    var body: some View {
        VStack{
            Text("Animation Color Changes")
            CodePreviewView(code: code)
            AnimationColorChange(progress: isAnimation ? 0 : 125)
            Button("Start Animation"){
                withAnimation(.linear(duration: 1)) { 
                    isAnimation.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

private struct AnimationColorChange: View, Animatable {
    var progress : Double
    var animatableData: Double{
        get { progress }
        set { progress = newValue }
    }
    
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.mint)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.red)
                            .offset(x: 125-progress,y: 0)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .frame(width: 100, height: 100)
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.mint)
                    .overlay(
                        Circle()
                            .fill(.red)
                            .frame(width: 125-progress, height: 200)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .frame(width: 100, height: 100)
        }
    }
}


private struct BackAndForthFlipView: View {
    var code : String{
        return """
struct BackAndForthFlipView: View {
    @State var isAnimation = false
    var body: some View {
        AnimationRoundedRectangle(number: isAnimation ? -180 : 180)
        Button("Start Animation"){
            withAnimation(.linear(duration: 1)) { 
                isAnimation.toggle()
            }
        }
        .buttonStyle(.borderedProminent)
    }
}

struct AnimationRoundedRectangle: View, Animatable {
    var number : Double
    var animatableData: Double{
        get{number}
        set{number=abs(newValue)}
    }
    
    var body: some View {
        Text(number, format: .number.precision(.fractionLength(3)))
        RoundedRectangle(cornerRadius: 20)
            .fill( .red )
            .frame(width: 100 , height: 100)
            .rotation3DEffect(.degrees(number), axis: (x:0,y:1,z:0))
    }
}
"""
    }
    
    @State var isAnimation = false
    var body: some View {
        VStack{
            Text("Back and forth flip")
                .font(.title2)
            CodePreviewView(code: code)
            AnimationRoundedRectangle(number: isAnimation ? -180 : 180)
            Button("Start Animation"){
                withAnimation(.linear(duration: 1)) { 
                    isAnimation.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

private struct AnimationRoundedRectangle: View, Animatable {
    var number : Double
    var animatableData: Double{
        get{number}
        set{number=abs(newValue)}
    }
    
    var body: some View {
        Text(number, format: .number.precision(.fractionLength(3)))
        RoundedRectangle(cornerRadius: 20)
            .fill( .red )
            .frame(width: 100 , height: 100)
            .rotation3DEffect(.degrees(number), axis: (x:0,y:1,z:0))
    }
}

struct AnimatableControlView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableControlView()
    }
}
