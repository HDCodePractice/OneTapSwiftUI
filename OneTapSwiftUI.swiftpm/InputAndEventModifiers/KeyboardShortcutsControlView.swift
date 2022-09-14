//
//  SwiftUIView.swift
//  
//
//  Created by 老房东 on 2022-09-12.
//

import SwiftUI

struct KeyboardShortcutsControlView: View {
    
    var body: some View {
        ScrollView{
            VStack{
                HeadlineView(
                    title: "Keyboard Shortcuts",
                    url: "https://developer.apple.com/documentation/swiftui/view/keyboardshortcut(_:)-8liec",
                    description: "Assigns a keyboard shortcut to the modified control."
                )
                KeyboardShortcutsSampleView()
                Divider()
                GameControlSampleView()
            }
            .padding()
        }
    }
}

private struct GameControlSampleView: View {
    var code = """
struct GameControlSampleView: View {
    @State var x = 0.0
    @State var y = 0.0
    @State var degress = 0.0
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .fill(.cyan)
                    .frame(width: 50,height: 50)
                    .offset(x:x,y:y)
                    .rotationEffect(.degrees(degress))
            }
            .frame(width: 300,height: 300)
            .border(.primary)
            HStack{
                Button("⬅️"){
                    withAnimation {
                        x -= 5
                    }
                }.keyboardShortcut(.leftArrow, modifiers: [])
                Button("➡️"){
                    withAnimation {
                        x += 5
                    }
                }.keyboardShortcut(.rightArrow, modifiers: [])
                Button("⬆️"){
                    withAnimation {
                        y -= 5
                    }
                }.keyboardShortcut(.upArrow, modifiers: [])
                Button("⬇️"){
                    withAnimation {
                        y += 5
                    }
                }.keyboardShortcut(.downArrow, modifiers: [])
                Button("Space🔄"){
                    withAnimation {
                        degress -= 10
                    }
                }.keyboardShortcut(.space, modifiers: [])
                Button("Enter⏹"){
                    withAnimation {
                        x = 0
                        y = 0
                        degress = 0
                    }
                }.keyboardShortcut(.return, modifiers: [])
            }
        }
    }
}
"""
    @State var x = 0.0
    @State var y = 0.0
    @State var degress = 0.0
    var body: some View {
        VStack{
            Text("Move Game")
                .font(.title2)
            CodePreviewView(code: code)
            ZStack{
                Rectangle()
                    .fill(.cyan)
                    .frame(width: 50,height: 50)
                    .offset(x:x,y:y)
                    .rotationEffect(.degrees(degress))
            }
            .frame(width: 300,height: 300)
            .border(.primary)
            HStack{
                Button("⬅️"){
                    withAnimation {
                        x -= 5
                    }
                }.keyboardShortcut(.leftArrow, modifiers: [])
                Button("➡️"){
                    withAnimation {
                        x += 5
                    }
                }.keyboardShortcut(.rightArrow, modifiers: [])
                Button("⬆️"){
                    withAnimation {
                        y -= 5
                    }
                }.keyboardShortcut(.upArrow, modifiers: [])
                Button("⬇️"){
                    withAnimation {
                        y += 5
                    }
                }.keyboardShortcut(.downArrow, modifiers: [])
                Button("Space🔄"){
                    withAnimation {
                        degress -= 10
                    }
                }.keyboardShortcut(.space, modifiers: [])
                Button("Enter⏹"){
                    withAnimation {
                        x = 0
                        y = 0
                        degress = 0
                    }
                }.keyboardShortcut(.return, modifiers: [])
            }
        }
    }
}

private struct KeyboardShortcutsSampleView: View {
    var code = """
Button("a"){
    inputKey = "a"
}.keyboardShortcut("A",modifiers: [])
Button("B"){
    inputKey = "b"
}.keyboardShortcut("B",modifiers: [.shift])
Button("b"){
    inputKey = "b"
}.keyboardShortcut("B",modifiers: [])
Button("c"){
    inputKey = "c"
}
.hidden()
.keyboardShortcut("c",modifiers: [])
"""
    @State var inputKey = ""
    var body: some View {
        VStack{
            CodePreviewView(code: code)
            Text("Input :\(inputKey)")
            HStack{
                Button("a"){
                    inputKey = "a"
                }.keyboardShortcut("A",modifiers: [])
                Button("B"){
                    inputKey = "B"
                }.keyboardShortcut("B",modifiers: [.shift])
                Button("b"){
                    inputKey = "b"
                }.keyboardShortcut("B",modifiers: [])
                Button("c"){
                    inputKey = "c"
                }
                .hidden()
                .keyboardShortcut("c",modifiers: [])
            }
        }
    }
}

struct KeyboardShortcutsControlView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardShortcutsControlView()
    }
}
