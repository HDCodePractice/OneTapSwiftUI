import SwiftUI
import SwiftUITapsPackage

struct ContentView: View {
    var body: some View {
        NavigationView{
            Sidebar()
            Text("")
        }
        .navigationViewStyle(.columns)
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}
