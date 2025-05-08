//
//  LandingPage.swift
//  Klincong2
//
//  Created by Asri Oktianawati on 07/05/25.
//

import Foundation
import SwiftUI

struct LandingPage: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Text("Let's Begin\n Your Cleaning")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Image("cleaning")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 280)
                
                Button(action: {
                    print("Button tapped!")
                }) {
                   // NavigationLink(destination: Conte()) {
                        Text("Get Started")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: 220)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]),
                                                startPoint: .leading,
                                                endPoint: .trailing)
                            )
                            .foregroundColor(.white)
                            .cornerRadius(30)
                            .navigationBarBackButtonHidden(true)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
           // .background(Color(.birumalam))  // Pastikan warna birumalam sudah didefinisikan dalam assets
            .edgesIgnoringSafeArea(.all)
        }
    }
//}

#Preview {
    LandingPage()
}
