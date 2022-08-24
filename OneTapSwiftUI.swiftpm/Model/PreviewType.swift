import SwiftUI

enum PreviewType: String, CaseIterable, Identifiable{
    case preview = "Preview" 
    case code = "Code"
    var id: Self { self }
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}
