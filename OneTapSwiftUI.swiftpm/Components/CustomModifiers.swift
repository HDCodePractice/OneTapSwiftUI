import SwiftUI


extension View {
    func valueLabel() -> some View {
        modifier(ValueLabel())
    }
}

struct ValueLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 60)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .font(.headline)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}
