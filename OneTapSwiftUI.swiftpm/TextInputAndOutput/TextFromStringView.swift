import SwiftUI

struct TextFromStringView: View {
    var code = """
Text("Creating a Text View from a string")
Text(\"\"\"
We can **creating a Text View** from a Markdown string.
We can make *italic*, **blod**, ***blod italic***, ~~striked through~~, `monospaced test` and [Link](https://www.rfc-editor.org/rfc/rfc7763)
                                                                                                     
```
We can **make** a *fenced* code blocks.
```
\"\"\") 
"""
    
    var body: some View {
        VStack{
            Text("Creating from string")
                .font(.title2)
            VStack(alignment:.leading){
                CodePreviewView(code: code)
                Text("Creating a Text View from a string")
                Text("""
We can **creating a Text View** from a Markdown string.
We can make *italic*, **blod**, ***blod italic***, ~~striked through~~, `monospaced test` and [Link](https://www.rfc-editor.org/rfc/rfc7763)

```
We can **make** a *fenced* code blocks.
```
""") 
            }
        }
    }
}

struct TextFromStringView_Previews: PreviewProvider {
    static var previews: some View {
        TextFromStringView()
    }
}
