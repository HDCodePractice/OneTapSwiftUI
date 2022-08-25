import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Sidebar()
            TextControlView()
        }
        .navigationViewStyle(.columns)
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}
