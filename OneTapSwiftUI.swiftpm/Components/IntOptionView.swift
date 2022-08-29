import SwiftUI

struct IntOptionView: View {
    @Binding var option : IntOption
    
    var body: some View {
        VStack{
            HStack(spacing:20){
                Text("\(option.name):")
                    .bold()
                Toggle(isOn: $option.active){
                    HStack{
                        Slider(value: $option.doubleValue, in: option.range, step: 1)
                        Text("\(option.value)")
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
    @State var option = IntOption(name: "spacing", value: 8, defaultValue: 8, range: -10...50)
    var body: some View {
        IntOptionView(option: $option)
    }
}

struct IntOptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionViewPreview()
    }
}
