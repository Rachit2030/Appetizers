//
//  StandardButtonStyle.swift
//  Appetizers
//
//  Created by Rachit on 05/05/24.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
            .padding()
    }
    
}

