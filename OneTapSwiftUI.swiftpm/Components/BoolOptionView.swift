import SwiftUI

struct BoolOptionView: View {
    @Binding var option : BoolOption
    var optionValues = [true,false]
    var body: some View {
        VStack{
            HStack(spacing:20){
                Text("\(option.name):")
                    .bold()
                Toggle(isOn: $option.active){
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
                    .opacity(option.active ? 1.0 : 0.3)
                    .disabled(!option.active)
                }
            }
        }
    }
}

private struct OptionViewPreview: View {
    @State var option = BoolOption(name: "spacing", value: true)
    var body: some View {
        BoolOptionView(option: $option)
    }
}

struct BoolOptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionViewPreview()
    }
}
