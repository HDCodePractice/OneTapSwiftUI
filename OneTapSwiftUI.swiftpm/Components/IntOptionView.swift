import SwiftUI

struct IntOptionView: View {
    @Binding var option : IntOption
    
    var body: some View {
        VStack{
            HStack(spacing:20){
                Text("\(option.name):")
                    .bold()
                if option.isOption{
                    Toggle(isOn: $option.active){
                        optionView                    .opacity(option.active ? 1.0 : 0.3)
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
            Slider(value: $option.doubleValue, in: option.range, step: 1)
            Text("\(option.value)")
                .valueLabel()
        }
    }
}

private struct OptionViewPreview: View {
    @State var option = IntOption(name: "spacing", value: 8, defaultValue: 8, range: -10...50)
    @State var optionIsNotOption = IntOption(name: "spacing", value: 8, defaultValue: 8, range: -10...50, isOption: true)
    var body: some View {
        VStack{
            IntOptionView(option: $option)
            IntOptionView(option: $optionIsNotOption)
        }
    }
}

struct IntOptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionViewPreview()
    }
}
