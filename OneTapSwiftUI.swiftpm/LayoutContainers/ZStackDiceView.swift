import SwiftUI

struct ZStackDiceView: View {
    var body: some View {
        VStack{
            DiceViewCode()
            Dice()
        }
    }
}

private struct DiceViewCode: View {
    var code = """
struct Dice: View {
    let diceAlignments: [[Alignment]] = [
        [.center,.center,.center,.center,.center,.center],
        [.topLeading,.topLeading,.topLeading,.bottomTrailing,.bottomTrailing,.bottomTrailing],
        [.topLeading,.topLeading,.center,.center,.bottomTrailing,.bottomTrailing],
        [.topLeading,.topLeading,.bottomLeading,.topTrailing,.bottomTrailing,.bottomTrailing],
        [.topLeading,.center,.bottomLeading,.topTrailing,.center,.bottomTrailing],
        [.topLeading,.leading,.bottomLeading,.topTrailing,.trailing,.bottomTrailing]
    ]
    
    @State var dice : Int = 1
    @State var turn : Bool = false
    
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .frame(width: 100, height: 100)
                ForEach(0..<6){ index in 
                    ZStack(alignment: diceAlignments[dice-1][index]){
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.clear)
                            .frame(width: 100, height: 100)
                        Circle()
                            .fill(.white)
                            .frame(width: 20, height: 20)
                            .padding()
                    }
                }
            }.rotationEffect(Angle(degrees: turn ? 0 : 180))
            HStack{
                Button("1"){ withAnimation { dice = 1}}.buttonStyle(.borderedProminent)
                Button("2"){ withAnimation { dice = 2}}.buttonStyle(.borderedProminent)
                Button("3"){ withAnimation { dice = 3}}.buttonStyle(.borderedProminent)
                Button("4"){ withAnimation { dice = 4}}.buttonStyle(.borderedProminent)
                Button("5"){ withAnimation { dice = 5}}.buttonStyle(.borderedProminent)
                Button("6"){ withAnimation { dice = 6}}.buttonStyle(.borderedProminent)
                Button("Random"){ 
                    withAnimation(.easeInOut(duration: 0.5)){
                        dice = Int.random(in: 1...6)
                        turn.toggle()
                        
                    }
                }.buttonStyle(.borderedProminent)
            }
        }
    }
}
"""
    var body: some View {
        CodePreviewView(code: code)
    }
}

struct Dice: View {
    let diceAlignments: [[Alignment]] = [
        [.center,.center,.center,.center,.center,.center],
        [.topLeading,.topLeading,.topLeading,.bottomTrailing,.bottomTrailing,.bottomTrailing],
        [.topLeading,.topLeading,.center,.center,.bottomTrailing,.bottomTrailing],
        [.topLeading,.topLeading,.bottomLeading,.topTrailing,.bottomTrailing,.bottomTrailing],
        [.topLeading,.center,.bottomLeading,.topTrailing,.center,.bottomTrailing],
        [.topLeading,.leading,.bottomLeading,.topTrailing,.trailing,.bottomTrailing]
    ]
    
    @State var dice : Int = 1
    @State var turn : Bool = false
    
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .frame(width: 200, height: 200)
                ForEach(0..<6,id:\.self){ index in 
                    ZStack(alignment: diceAlignments[dice-1][index]){
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.clear)
                            .frame(width: 200, height: 200)
                        Circle()
                            .fill(.white)
                            .frame(width: 40, height: 40)
                            .padding()
                    }
                }
            }.rotationEffect(Angle(degrees: turn ? 0 : 180))
            HStack{
                Button("1"){ withAnimation { dice = 1}}.buttonStyle(.borderedProminent)
                Button("2"){ withAnimation { dice = 2}}.buttonStyle(.borderedProminent)
                Button("3"){ withAnimation { dice = 3}}.buttonStyle(.borderedProminent)
                Button("4"){ withAnimation { dice = 4}}.buttonStyle(.borderedProminent)
                Button("5"){ withAnimation { dice = 5}}.buttonStyle(.borderedProminent)
                Button("6"){ withAnimation { dice = 6}}.buttonStyle(.borderedProminent)
                Button("Random"){ 
                    withAnimation(.easeInOut(duration: 0.5)){
                        dice = Int.random(in: 1...6)
                        turn.toggle()
                        
                    }
                }.buttonStyle(.borderedProminent)
            }
        }
    }
}

struct ZStackDiceView_Previews: PreviewProvider {
    static var previews: some View {
        ZStackDiceView()
    }
}
