//
//  optionOptionView.swift
//  
//
//  Created by 老房东 on 2022-09-14.
//

import SwiftUI

struct OptionOptionView: View {
    @Binding var option : OptionOption
    var body: some View {
        VStack{
            HStack(spacing:20){
                Text("\(option.name):")
                    .bold()
                Toggle(isOn: $option.active){
                    Text("")
                }
            }
        }
    }
}

private struct OptionViewPreview: View {
    @State var option = OptionOption(name: "spacing", active: true)
    var body: some View {
        OptionOptionView(option: $option)
    }
}

struct optionOptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionViewPreview()
    }
}
