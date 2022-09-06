//
//  CodePreviewView.swift
//  MotionScape
//
//  Created by Stefan Blos on 24.03.22.
//  Modified by hdcola on 24.08.22
//

import SwiftUI

struct CodePreviewView: View {
    
    var code: String
    
    @State private var copyButtonHovered = false
    @State private var copyTextOpacity = 0.0
    @AppStorage("codeFontSize") private var codeFontSize = 15.0
    
    var body: some View {
        ZStack(alignment: .bottom){
            ZStack(alignment: .topTrailing) {
                Text("```\(code)```")
                    .font(.system(size: codeFontSize))
                    .padding(20)
                    .textSelection(.enabled)
                //                .background(Color("codePreviewBackground"))
                    .clipShape(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.primary.opacity(0.5), lineWidth: 1)
                    )
                    .animation(.spring(), value: code)
                
                Image(systemName: "doc.on.doc")
                    .foregroundColor(
                        copyButtonHovered ? .primary : .secondary.opacity(0.6)
                    )
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .stroke(
                                copyButtonHovered ? .primary : Color.secondary.opacity(0.6),
                                lineWidth: 1
                            )
                    )
                    .animation(.easeInOut.speed(1.5), value: copyButtonHovered)
                    .padding(10)
                    .overlay {
                        Text("Copied")
                            .font(.footnote)
                            .foregroundColor(.primary)
                            .padding(.vertical, 2)
                            .padding(.horizontal, 8)
                        //                        .background(Color("copyPopupBackgroundColor"))
                            .clipShape(
                                RoundedRectangle(cornerRadius: 4, style: .continuous)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 4, style: .continuous)
                                    .stroke(Color.primary.opacity(0.4), lineWidth: 1)
                            )
                            .offset(y: -30)
                            .frame(width: 60)
                            .opacity(copyTextOpacity)
                            .edgesIgnoringSafeArea(.all)
                    }
                    .onHover { hovering in
                        copyButtonHovered = hovering
                    }
                    .onTapGesture {
                        let pasteboard = UIPasteboard.general
                        pasteboard.string = code
                        
                        withAnimation(.easeInOut(duration: 0.5)) {
                            copyTextOpacity = 1
                        }
                        withAnimation(.easeInOut(duration: 0.5).delay(2)) {
                            copyTextOpacity = 0
                        }
                    }
            }
            HStack{
                Image(systemName: "textformat.size.smaller")
                    .foregroundColor(
                        copyButtonHovered ? .primary : .secondary.opacity(0.6)
                    )
                    .frame(width: 15, height: 15)
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .stroke(
                                copyButtonHovered ? .primary : Color.secondary.opacity(0.6),
                                lineWidth: 1
                            )
                    )
                    .onTapGesture {
                        codeFontSize -= 1
                    }
                Image(systemName: "textformat.size.larger")
                    .foregroundColor(
                        copyButtonHovered ? .primary : .secondary.opacity(0.6)
                    )
                    .frame(width: 15, height: 15)
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .stroke(
                                copyButtonHovered ? .primary : Color.secondary.opacity(0.6),
                                lineWidth: 1
                            )
                    )
                    .onTapGesture {
                        codeFontSize += 1
                    }
            }
            .padding(10)
        }
    }
}

struct CodePreviewView_Previews: PreviewProvider {
    static var previews: some View {
        CodePreviewView(code: "I'm a code preview. Oink, oink")
    }
}
