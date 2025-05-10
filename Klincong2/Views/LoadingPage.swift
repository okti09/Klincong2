//
//  LoadingPage.swift
//  Klincong2
//
//  Created by Asri Oktianawati on 09/05/25.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            Image("img_loading")
                .resizable()
                .scaledToFill()
                //.ignoresSafeArea()
                //.frame(width: 250)
        }
    }
}
#Preview {
    LoadingView()
}
