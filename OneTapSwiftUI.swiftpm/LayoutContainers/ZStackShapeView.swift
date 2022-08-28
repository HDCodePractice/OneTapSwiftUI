import SwiftUI

private enum AlignmentType:
    String,CaseIterable,Identifiable{
    case center = ".center"
    case leading = ".leading"
    case trailing = ".trailing"
    case topLeading = ".topLeading"
    case top = ".top"
    case topTrailing = ".topTrailing"
    case bottomLeading = ".bottomLeading"
    case bottom = ".bottom"
    case bottomTrailing = ".bottomTrailing"
    
    var id: Self { self }
    var caseValue: Alignment {
        switch self{
        case .center:
            return .center
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        case .topLeading:
            return .topLeading
        case .top:
            return .top
        case .topTrailing:
            return .topTrailing
        case .bottomLeading:
            return .bottomLeading
        case .bottom:
            return .bottom
        case .bottomTrailing:
            return .bottomTrailing
            
        }
    }
}

struct ZStackShapeView: View {
    @State private var alignment: AlignmentType = .center
    
    var code: String{ return """
ZStack(alignment: \(alignment.rawValue)){
    RoundedRectangle(cornerRadius: 20)
        .fill(.mint)
        .frame(width: 200, height: 200)
    Circle()
        .fill(.purple)
        .frame(width: 50, height: 50)
}
"""
    }
    
    var body: some View {
        VStack(spacing: 40){
            CodePreviewView(code: code)
            
            HStack{
                ZStack(alignment: alignment.caseValue){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.mint)
                        .frame(width: 200, height: 200)
                    Circle()
                        .fill(.purple)
                        .frame(width: 50, height: 50)
                }
            }
            
            HStack{
                Text("alignment:")
                    .bold()
                Picker("alignment:", selection: $alignment.animation()){
                    ForEach(AlignmentType.allCases){ alignmentType in
                        Text(alignmentType.rawValue)
                    }
                }
                .pickerStyle(.automatic)
            }
        }
    }
}


struct ZStackShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStackShapeView()
    }
}
