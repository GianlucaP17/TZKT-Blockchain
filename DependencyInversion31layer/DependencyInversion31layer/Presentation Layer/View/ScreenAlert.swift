//
//  ScreenAlert.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import SwiftUI

struct ScreenAlert: View {
    var text: String
    var show: Bool
    
    var body: some View {
        Text(text)
            .padding(20)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(15)
            .shadow(color: Color.gray, radius: 5, x: 0, y: 5)
            .opacity(show ? 1 : 0)
            .padding()
    }
}
