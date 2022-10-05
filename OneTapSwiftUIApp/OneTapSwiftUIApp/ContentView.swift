//
//  ContentView.swift
//  OneTapSwiftUIApp
//
//  Created by 老房东 on 2022-09-21.
//

import ShowTime
import SwiftUI
import SwiftUITapsPackage

struct ContentView: View {
    @AppStorage("isShowTime") var isShowGestures: Bool = false

    var body: some View {
        NavigationView {
            Sidebar()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "ellipsis.circle")
                        }
                    }
                }
            Text("")
        }
        .onAppear {
            if isShowGestures{
                ShowTime.enabled = .always
            }else{
                ShowTime.enabled = .never
            }
        }
        .navigationViewStyle(.columns)
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.locale, .init(identifier: "zh-CN"))
    }
}
