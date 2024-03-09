//
//  BottleProgress.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 01/03/24.
//

import SwiftUI

struct BottleAndGlass: View {
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(systemName: "waterbottle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(colorP.c5)
                .frame(height: dHeight*0.15)
                .offset(y: -1.5)
            
            Image(systemName: "waterbottle")
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.white)
                .frame(height: dHeight*0.15)
            
            Image(systemName: "wineglass.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(colorP.c5)
                .frame(height: dHeight*0.12)
                .offset(x: dHeight*0.035)
                
            Image(systemName: "wineglass")
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.white)
                .frame(height: dHeight*0.12)
                .offset(x: dHeight*0.035)
        }
    }
}

#Preview {
    BottleAndGlass(dWidth: 300, dHeight: 700)
}
