import SwiftUI

struct DoubleOptionView: View {
    @Binding var option : DoubleOption
    
    var body: some View {
        VStack{
            HStack(spacing:20){
                Text("\(option.name):")
                    .bold()
                if option.isOption{
                    Toggle(isOn: $option.active){
                        optionView
                            .opacity(option.active ? 1.0 : 0.3)
                            .disabled(!option.active)
                    }
                }else{
                    optionView
                }
            }
        }
    }
    
    var optionView: some View{
        HStack{
            Slider(value: $option.value, in: option.range)
            Text("\(option.value, specifier: "%.2f")")
                .valueLabel()
        }
    }
}

private struct OptionViewPreview: View {
    @State var option = DoubleOption(name: "spacing", value: 8, defaultValue: 8, range: -10...50)
    @State var optionIsNotOption = DoubleOption(name: "spacing", value: 8, defaultValue: 8, range: -10...50, isOption: true)
    var body: some View {
        VStack{
            DoubleOptionView(option: $option)
            DoubleOptionView(option: $optionIsNotOption)
        }
    }
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionViewPreview()
    }
}
