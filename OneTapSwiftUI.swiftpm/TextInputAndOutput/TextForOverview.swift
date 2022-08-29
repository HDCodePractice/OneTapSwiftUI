import SwiftUI

struct TextForOverview: View {
    var body: some View {
        TextFontList()
        Divider()
        TextFontStyle()
        Divider()
        TextForFontList()
    }
}

struct TextForFontList: View {
    var code = 
"""
    VStack{
        ForEach(UIFont.familyNames,id:\\.self){ name in
            HStack{
                Text(name)
                Text("ABCD1234")
                    .font(.custom(name, size: 20))
            }
        }
    }
"""
    var body: some View {
        VStack{
            Text("Your system font list")
                .font(.title2)
            CodePreviewView(code: code)
            VStack{
                ScrollView{
                    VStack{
                        ForEach(UIFont.familyNames,id:\.self){ name in
                            HStack{
                                Text(name)
                                Text("ABCD1234")
                                    .font(.custom(name, size: 20))
                            }
                        }
                    }
                }
            }
            .border(.secondary)
            .frame(height: 200)
        }
    }
}

private struct TextFontStyle: View {
    var code = """
    Text("italic and underline")
        .italic()
        .font(.title)
        .foregroundColor(.red)
        .underline(true, color: .black)
    Text("bold and strikethrough")
        .bold()
        .font(.title)
        .foregroundColor(.red)
        .strikethrough(true, color: .blue)
    Text("system font")
        .font(.system(size: 30, weight: .regular, design: .serif))
    Text("11111monospacedDigit")
        .monospacedDigit()
        .font(.title)
        .foregroundColor(.red)
    Text("23456monospacedDigit")
        .monospacedDigit()
        .font(.title)
        .foregroundColor(.red)
    """
    var body: some View {
        VStack{
            Text("Font Style list")
                .font(.title2)
            CodePreviewView(code: code)
            Text("italic and underline")
                .italic()
                .font(.title)
                .foregroundColor(.red)
                .underline(true, color: .black)
            Text("bold and strikethrough")
                .bold()
                .font(.title)
                .foregroundColor(.red)
                .strikethrough(true, color: .blue)
            Text("system font")
                .font(.system(size: 30, weight: .regular, design: .serif))
            Text("11111monospacedDigit")
                .monospacedDigit()
                .font(.title)
                .foregroundColor(.red)
            Text("23456monospacedDigit")
                .monospacedDigit()
                .font(.title)
                .foregroundColor(.red)
        }
    }
}


private struct TextFontList: View {
    var code = """
Text("1234 largeTitle").font(.largeTitle)
Text("1234 title").font(.title)
Text("1234 title2").font(.title2)
Text("1234 title3").font(.title3)
Text("1234 headline").font(.headline)
Text("1234 subheadline").font(.subheadline)
Text("1234 body").font(.body)
Text("1234 callout").font(.callout)
Text("1234 footnote").font(.footnote)
Text("1234 caption").font(.caption)
Text("1234 caption2").font(.caption2)
"""
    
    var body: some View {
        VStack{
            Text("SwiftUI font list")
                .font(.title2)
            CodePreviewView(code: code)
            VStack(alignment:.leading){
                Group{
                    Text("1234 largeTitle").font(.largeTitle)
                    Text("1234 title").font(.title)
                    Text("1234 title2").font(.title2)
                    Text("1234 title3").font(.title3)
                    Text("1234 headline").font(.headline)
                    Text("1234 subheadline").font(.subheadline)
                    Text("1234 body").font(.body)
                }
                Text("1234 callout").font(.callout)
                Text("1234 footnote").font(.footnote)
                Text("1234 caption").font(.caption)
                Text("1234 caption2").font(.caption2)
            }
        }
    }
}


struct TextForOverview_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            TextForOverview()
        }
    }
}
