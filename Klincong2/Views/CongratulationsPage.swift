//
//  CongratulationsPage.swift
//  Klincong2
//
//  Created by Asri Oktianawati on 09/05/25.
//

import Foundation
import SwiftUI

struct CongratsView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            Image("img_congrats")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                //.frame(width: 250)
        }
    }
}
#Preview {
    CongratsView()
}

