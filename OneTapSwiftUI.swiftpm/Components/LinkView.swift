//
//  LinkView.swift
//  
//
//  Created by 老房东 on 2022-09-13.
//

import SwiftUI

struct LinkView: View {
    var url: String
    var body: some View {
        Link(destination: URL(string: url)!) {
            Image(systemName: "link")
        }
    }
}

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView(url: "https://developer.apple.com/documentation/swiftui/vstack")
    }
}
