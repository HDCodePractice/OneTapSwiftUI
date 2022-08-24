import SwiftUI

struct DoubleOptionView: View {
    @Binding var option : DoubleOption 
    
    var body: some View {
        VStack{
            HStack(spacing:20){
                Text("\(option.name):")
                    .bold()
                Toggle(isOn: $option.active){
                    HStack{
                        Slider(value: $option.value, in: option.range)
                        Text("\(option.value, specifier: "%.2f")")
                            .valueLabel()
                    }
                    .opacity(option.active ? 1.0 : 0.3)
                    .disabled(!option.active)
                }
            }
        }
    }
}

private struct OptionViewPreview: View {
    @State var option = DoubleOption(name: "spacing", value: 8, defaultValue: 8, range: -10...50)
    var body: some View {
        DoubleOptionView(option: $option)
    }
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionViewPreview()
    }
}
