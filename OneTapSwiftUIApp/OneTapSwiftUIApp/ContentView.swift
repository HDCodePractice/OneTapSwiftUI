//
//  ContentView.swift
//  OneTapSwiftUIApp
//
//  Created by 老房东 on 2022-09-21.
//

import SwiftUI
import SwiftUITapsPackage

struct ContentView: View {
    var body: some View {
        NavigationView {
            Sidebar()
            Text("")
        }
        .navigationViewStyle(.columns)
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
