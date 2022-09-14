//
//  ViewBuilder.swift
//  
//
//  Created by 老房东 on 2022-09-14.
//

import SwiftUI

extension View {
    @ViewBuilder
    public func `if`<T: View, U: View>(
        _ condition: Bool,
        then modifierT: (Self) -> T,
        else modifierU: (Self) -> U
    ) -> some View {
        if condition { modifierT(self) }
        else { modifierU(self) }
    }
}
