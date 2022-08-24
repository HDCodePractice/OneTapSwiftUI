import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Sidebar()
            VStackControlView()
        }
        .navigationViewStyle(.columns)
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}


//extension UISplitViewController {
//    open override func viewDidLoad() {
//        super.viewDidLoad()
//        self.show(.primary)        
//    }
//}
