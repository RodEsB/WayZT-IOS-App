//
//  ContainerView.swift
//  SlidingIntro
//
//  Created by Rod Espiritu Berra on 07/03/24.
//

import SwiftUI

struct ContainerView: View {
    @State private var isSplashScreenViewPresented = true
    @State var gotoApp = false
    var body: some View {
        if gotoApp {
            NavigationBarView()
        } else {
            if !isSplashScreenViewPresented {
                CView(gotoApp: $gotoApp)
            } else {
                SplashScreenView(isPresented: $isSplashScreenViewPresented)
            }
        }
    }
}

#Preview {
    ContainerView()
}
