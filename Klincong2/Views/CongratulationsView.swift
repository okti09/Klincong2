//
//  CongratulationsView.swift
//  Klincong2
//
//  Created by Asri Oktianawati on 10/05/25.
//

import Foundation
import SwiftUI
import RiveRuntime

struct CongratulationsView: View {
    let model = CongratulationsViewModel(fileName: "congratulations-klincong")
    //let model = PreparationTaskViewModel(fileName: "klincong-congratulations")
    
    var body: some View {
        VStack {
            model.riveModel.view()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        }
    }
}
struct CongratulationsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratulationsView()
    }
}
