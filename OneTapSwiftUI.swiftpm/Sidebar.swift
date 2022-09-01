import SwiftUI

struct Sidebar: View {
    var body: some View {
        List{
            Section("Text input and output"){
                NavigationLink("Text"){
                    TextControlView()
                }
            }
            
            Section("Controls and indicators"){
                NavigationLink("Menu"){
                    MenuControlView()
                }
            }
            
            Section("Layout containers"){
                NavigationLink("VStack"){
                    VStackControlView()
                }
                NavigationLink("ZStack"){
                    ZStackControlView()
                }
            }
            
            Section("Animations"){
                NavigationLink("withAnimation"){
                    WithAnimationControlView()
                }
            }
            
            Section("Map"){
                NavigationLink("Map"){
                    MapControlView()
                }
            }
            
        }.listStyle(.insetGrouped)
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
