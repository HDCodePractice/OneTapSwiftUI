import SwiftUI

fileprivate enum AlignmentType: String,CaseIterable,Identifiable{
    case center = ".center"
    case leading = ".leading"
    case trailing = ".trailing"
    
    var id: Self { self }
    var caseValue: HorizontalAlignment {
        switch self{
        case .center:
            return .center
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        }
    }
}

struct VStackView: View {
    @State private var alignment : AlignmentType = .center
    @State private var selectedPreview: PreviewType = .preview
    
    var code: String{ return """
VStack(alignment: \(alignment.rawValue)){
    RoundedRectangle(cornerRadius: 20)
        .fill(.purple)
        .frame(width: 50, height: 40)
    RoundedRectangle(cornerRadius: 20)
        .fill(.mint)
        .frame(width: 200, height: 40)
    RoundedRectangle(cornerRadius: 20)
        .fill(.blue)
        .frame(width: 90, height: 40)
}
"""
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Picker("",selection: $selectedPreview){
                    ForEach(PreviewType.allCases){ previewType in
                        Text(previewType.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
            }
            
            switch selectedPreview{
            case .preview:
                HStack{
                    Spacer()
                    VStack(alignment: alignment.caseValue){
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.purple)
                            .frame(width: 50, height: 40)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.mint)
                            .frame(width: 200, height: 40)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.blue)
                            .frame(width: 90, height: 40)
                    }
                    Spacer()
                }
            case .code:
                Text(code)
                    .font(.body)
            }
            
            HStack{
                Text("alignment:")
                    .bold()
                ForEach(AlignmentType.allCases){ alignmentType in
                    Button(alignmentType.rawValue){
                        withAnimation { 
                            alignment = alignmentType
                        }
                    }.buttonStyle(.borderedProminent)
                }
                
            }
        }
        .padding()
    }
}

struct VStackView_Previews: PreviewProvider {
    static var previews: some View {
        VStackView()
    }
}
