import SwiftUI

struct WithAnimationControlView: View {
    var body: some View {
        ScrollView{
            HeadlineView(
                title: "withAnimation", 
                url: "https://developer.apple.com/documentation/swiftui/withanimation(_:_:)", 
                description: "Returns the result of recomputing the view’s body with the provided animation."
            )
            AnimationsView()
        }.padding()
    }
}


private struct AnimationsView: View {
    @State var duration = DoubleOption(name: "duration", value: 1, range: 0...2)
    @State var speed = DoubleOption(name: "speed", value: 1, range: 0...5)
    @State var delay = DoubleOption(name: "delay", value: 0, range: 0...5)
    @State var endSize = DoubleOption(name: "end size", value: 100, range: 50...200)
    @State var endDegress = DoubleOption(name: "end degress", value: 180, range: 0...720)
    @State var repeatCount = IntOption(name: "repeat count", value: 1, range: 0...5)
    @State var autoreverses = BoolOption(name: "autoreverses", value: false)
    
    var code :String{ return """
struct AnimationsView: View {
    @State var isAnimation = false
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill( isAnimation ? .red : .mint)
            .frame(width: isAnimation ? 100 : \(endSize.valueString) , height: isAnimation ? 100 : \(endSize.valueString))
            .rotationEffect(Angle(degrees: isAnimation ? 0 : \(endDegress.valueString)))
        Button("Start Animation"){
            withAnimation(.easeInOut(
                duration: \(duration.valueString)
                .speed(\(speed.valueString))
                .delay(\(delay.valueString))
                .repeatCount(\(repeatCount.valueString), autoreverses: false)
            ) { 
                isAnimation.toggle()
            }
        }
        .buttonStyle(.borderedProminent)
    }
}
"""
    }
    
    @State var isAnimation = false
    
    var body: some View {
        VStack{
            CodePreviewView(code: code)
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill( isAnimation ? .red : .mint)
                    .frame(width: isAnimation ? 100 : endSize.value , height: isAnimation ? 100 : endSize.value)
                    .rotationEffect(.degrees(isAnimation ? 0 : endDegress.value))
            }
            .frame(width: 220, height: 220)
            
            DoubleOptionView(option: $duration)
            DoubleOptionView(option: $speed)
            DoubleOptionView(option: $delay)
            IntOptionView(option: $repeatCount)
            BoolOptionView(option: $autoreverses)
            DoubleOptionView(option: $endSize)
            DoubleOptionView(option: $endDegress)
            
            Button("Start Animation"){
                withAnimation(
                    .easeInOut(duration: duration.value)
                    .speed(speed.value)
                    .delay(delay.value)
                    .repeatCount(repeatCount.value, autoreverses: false)
                ) { 
                    isAnimation.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}


struct WithAnimationControlView_Previews: PreviewProvider {
    static var previews: some View {
        WithAnimationControlView()
    }
}
