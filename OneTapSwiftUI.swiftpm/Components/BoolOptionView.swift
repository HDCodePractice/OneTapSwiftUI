import SwiftUI

struct BoolOptionView: View {
    @Binding var option : BoolOption
    var optionValues = [true,false]
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
    
    var optionView : some View{
        HStack{
            Picker("", selection: $option.value) {
                ForEach(optionValues, id:\.self){ item in
                    Text("\(item ? "true" : "false")")
                }
            }
            .pickerStyle(.segmented)
            Text("\(option.value ? "true" : "false")")
                .valueLabel()
        }
    }
}

private struct OptionViewPreview: View {
    @State var option = BoolOption(name: "spacing", value: true)
    @State var optionIsNotOption = BoolOption(name: "spacing", value: true, isOption: true)
    var body: some View {
        VStack{
            BoolOptionView(option: $option)
            BoolOptionView(option: $optionIsNotOption)
        }
    }
}

struct BoolOptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionViewPreview()
    }
}
