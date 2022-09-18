import SwiftUI

struct WithAnimationControlView: View {
    var body: some View {
        ScrollView{
            VStack{
                HeadlineView(
                    title: "withAnimation", 
                    url: "https://developer.apple.com/documentation/swiftui/withanimation(_:_:)", 
                    description: "Returns the result of recomputing the view’s body with the provided animation."
                )
                AnimationsView()
                Divider()
                MutiWithAnimationView()
            }
            .padding()
        }
    }
}

//
//  ScrollViewDemo/MutiWithAnimationView
//
//  Created by Yang Xu on 2022/9/1.
//  Modified by 老房东 on 2022/9/1.
//
struct MutiWithAnimationView: View {
    @State var circle1StartPosition = 0.0
    @State var circle1EndPosition = 0.97
    @State var circleRotatineDegrees = 20.0
    @State var circle2StartPosition = 0.0
    @State var circle2EndPosition = 0.965
    
    var code : String {
        return """
struct MutiWithAnimationView: View {
    @State var circle1StartPosition = 0.0
    @State var circle1EndPosition = 0.97
    @State var circleRotatineDegrees = 20.0
    @State var circle2StartPosition = 0.0
    @State var circle2EndPosition = 0.965
    
    var body: some View {
        VStack{
            GeometryReader{ proxy in
                let lineWidth = proxy.size.width / 10
                ZStack{
                    Circle()
                        .trim(from: circle1StartPosition, to: circle1EndPosition)
                        .stroke(.red,style: .init(lineWidth: lineWidth, lineCap: .round))
                        .rotationEffect(.degrees(circleRotatineDegrees))
                        .rotation3DEffect(.degrees(180), axis: (x:1,y:0,z:0))
                    Circle()
                        .trim(from: circle2StartPosition, to: circle2EndPosition)
                        .stroke(.mint,style: .init(lineWidth: lineWidth, lineCap: .round))
                        .rotationEffect(.degrees(circleRotatineDegrees))
                        .rotation3DEffect(.degrees(180), axis: (x:1,y:0,z:0))
                        .frame(width: 160, height: 160)
                }
            }
            .frame(width: 200, height: 200)
            Button("Roll with two colors"){
                circle1StartPosition = 0
                circle1EndPosition = 0
                circleRotatineDegrees = -20
                circle2StartPosition = 0
                circle2EndPosition = 0
                withAnimation(.easeIn(duration: 0.7)) { 
                    circle1StartPosition=0
                    circle1EndPosition=0.97
                }
                withAnimation(.easeIn(duration: 1.5)) { 
                    circle2StartPosition=0.5
                    circle2EndPosition=0.965
                }
                withAnimation (.easeIn(duration: 1)){ 
                    circleRotatineDegrees = 20
                }
            }
        }
    }
}
"""
    }
    
    var body: some View {
        VStack{
            Text("Progress loop Animation")
                .font(.title2)
            CodePreviewView(code: code)
            GeometryReader{ proxy in
                let lineWidth = proxy.size.width / 10
                ZStack{
                    Circle()
                        .trim(from: circle1StartPosition, to: circle1EndPosition)
                        .stroke(.red,style: .init(lineWidth: lineWidth, lineCap: .round))
                        .rotationEffect(.degrees(circleRotatineDegrees))
                        .rotation3DEffect(.degrees(180), axis: (x:1,y:0,z:0))
                    Circle()
                        .trim(from: circle2StartPosition, to: circle2EndPosition)
                        .stroke(.mint,style: .init(lineWidth: lineWidth, lineCap: .round))
                        .rotationEffect(.degrees(circleRotatineDegrees))
                        .rotation3DEffect(.degrees(180), axis: (x:1,y:0,z:0))
                        .frame(width: 160, height: 160)
                }
            }
            .frame(width: 200, height: 200)
            .padding()
            Button("Roll with two colors"){
                circle1StartPosition = 0
                circle1EndPosition = 0
                circleRotatineDegrees = -20
                circle2StartPosition = 0
                circle2EndPosition = 0
                withAnimation(.easeIn(duration: 0.7)) { 
                    circle1StartPosition=0
                    circle1EndPosition=0.97
                }
                withAnimation(.easeIn(duration: 1.5)) { 
                    circle2StartPosition=0.5
                    circle2EndPosition=0.965
                }
                withAnimation (.easeIn(duration: 1)){ 
                    circleRotatineDegrees = 20
                }
            }
        }
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
                duration: \(duration.valueString))
                .speed(\(speed.valueString))
                .delay(\(delay.valueString))
                .repeatCount(\(repeatCount.valueString), autoreverses: \(autoreverses.valueString)
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
                    .repeatCount(repeatCount.value, autoreverses: autoreverses.value)
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
