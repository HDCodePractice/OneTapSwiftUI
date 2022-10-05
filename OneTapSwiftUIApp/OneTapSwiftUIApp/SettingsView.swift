//
//  SettingsView.swift
//  OneTapSwiftUIApp
//
//  Created by 老房东 on 2022-10-05.
//

import ShowTime
import SwiftUI

struct SettingsView: View {
    @AppStorage("isShowTime") var isShowGestures: Bool = false

    var body: some View {
        List {
            Section("Demo Settings") {
                Toggle("Show Gestures", isOn: $isShowGestures)
                    .onChange(of: isShowGestures) { newValue in
                        if newValue {
                            ShowTime.enabled = .always
                        } else {
                            ShowTime.enabled = .never
                        }
                    }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
