//
//  TypeWasteButton.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 29/02/24.
//

import SwiftUI

struct TypeWasteButton: View {
    var modelData: ModelData = .shared
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    let text = ["Reciclable", "Organica", "Vidrio", "Electronicos"]
    let i: Int
    @State private var continueAnim = [false, false]
    
    var body: some View {
        RoundedRectangle(cornerRadius: dWidth * 0.0636)
            .fill(
                LinearGradient(colors: [colorP.c5, colorP.c3], startPoint: .top, endPoint: .center)
            )
            .frame(width: dWidth * 0.45, height: dWidth * 0.45)
            .overlay {
                VStack {
                    switch i {
                    case 0:
                        animBottle()
                    case 1:
                        animCarrot()
                    case 2:
                        animGlass()
                    case 3:
                        animElec()
                    default:
                        animElec()
                    }
                    Spacer()
                    Text(text[i])
                        .font(.title)
                        .bold()
                        .foregroundStyle(colorP.c6)
                }
                .padding(.vertical, 20)
        }
            .onAppear {
                withAnimation(.easeInOut(duration: 1.8).repeatForever(autoreverses: true)) {
                    continueAnim[0].toggle()
                }
                withAnimation(.easeInOut(duration: 2.5).repeatForever(autoreverses: true)) {
                    continueAnim[1].toggle()
                }
            }
    }
    
    func animBottle() -> some View {
        Image(systemName: "waterbottle")
            .resizable()
            .scaledToFit()
            .frame(width: dWidth * 0.13)
            .foregroundStyle(colorP.c6)
            .padding(.top, 0)
            .overlay {
                Image(systemName: "sparkle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dWidth * 0.07)
                    .foregroundStyle(Color.white)
                    .scaleEffect(x: continueAnim[0] && modelData.profile.anims[0] ? 1 : 0, y: continueAnim[0] && modelData.profile.anims[0] ? 1 : 0)
                    .offset(x: dWidth * 0.06, y: -dWidth * 0.13)
                Image(systemName: "sparkle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dWidth * 0.04)
                    .foregroundStyle(Color.white)
                    .scaleEffect(x: continueAnim[1] && modelData.profile.anims[0] ? 1 : 0, y: continueAnim[1] && modelData.profile.anims[0] ? 1 : 0)
                    .offset(x: dWidth * 0.09, y: -dWidth * 0.095)
                Image(systemName: "sparkle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dWidth * 0.07)
                    .foregroundStyle(Color.white)
                    .scaleEffect(x: continueAnim[0] && modelData.profile.anims[0] ? 1 : 0, y: continueAnim[0] && modelData.profile.anims[0] ? 1 : 0)
                    .offset(x: -dWidth * 0.10, y: dWidth * 0)
                Image(systemName: "sparkle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dWidth * 0.04)
                    .foregroundStyle(Color.white)
                    .scaleEffect(x: continueAnim[1] && modelData.profile.anims[0] ? 1 : 0, y: continueAnim[1] && modelData.profile.anims[0] ? 1 : 0)
                    .offset(x: -dWidth * 0.085, y: dWidth * 0.05)
            }
    }
    
    func animCarrot() -> some View {
        Image(systemName: "carrot")
            .resizable()
            .scaledToFit()
            .frame(width: dWidth * 0.25)
            .foregroundStyle(colorP.c6)
            .padding(.top, 0)
            .overlay {
                Image(systemName: "sparkle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dWidth * 0.07)
                    .foregroundStyle(Color.white)
                    .scaleEffect(x: continueAnim[0] && modelData.profile.anims[1] ? 1 : 0, y: continueAnim[0] && modelData.profile.anims[1] ? 1 : 0)
                    .offset(x: dWidth * 0.02, y: -dWidth * 0.12)
                Image(systemName: "sparkle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dWidth * 0.04)
                    .foregroundStyle(Color.white)
                    .scaleEffect(x: continueAnim[1] && modelData.profile.anims[1] ? 1 : 0, y: continueAnim[1] && modelData.profile.anims[1] ? 1 : 0)
                    .offset(x: dWidth * 0.08, y: -dWidth * 0.14)
                Image(systemName: "sparkle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dWidth * 0.07)
                    .foregroundStyle(Color.white)
                    .scaleEffect(x: continueAnim[0] && modelData.profile.anims[1] ? 1 : 0, y: continueAnim[0] && modelData.profile.anims[1] ? 1 : 0)
                    .offset(x: -dWidth * 0, y: dWidth * 0.1)
                Image(systemName: "sparkle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dWidth * 0.04)
                    .foregroundStyle(Color.white)
                    .scaleEffect(x: continueAnim[1] && modelData.profile.anims[1] ? 1 : 0, y: continueAnim[1] && modelData.profile.anims[1] ? 1 : 0)
                    .offset(x: dWidth * 0.035, y: dWidth * 0.065)
            }
        
    }
    
    func animGlass() -> some View {
        Image(systemName: "wineglass")
            .resizable()
            .scaledToFit()
            .frame(width: dWidth * 0.15)
            .foregroundStyle(colorP.c6)
            .padding(.top, 0)
            .overlay {
                Image(systemName: "sparkle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dWidth * 0.07)
                    .foregroundStyle(Color.white)
                    .scaleEffect(x: continueAnim[0] && modelData.profile.anims[2] ? 1 : 0, y: continueAnim[0] && modelData.profile.anims[2] ? 1 : 0)
                    .offset(x: dWidth * 0.07, y: -dWidth * 0.13)
                Image(systemName: "sparkle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dWidth * 0.04)
                    .foregroundStyle(Color.white)
                    .scaleEffect(x: continueAnim[1] && modelData.profile.anims[2] ? 1 : 0, y: continueAnim[1] && modelData.profile.anims[2] ? 1 : 0)
                    .offset(x: dWidth * 0.095, y: -dWidth * 0.095)
                Image(systemName: "sparkle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dWidth * 0.07)
                    .foregroundStyle(Color.white)
                    .scaleEffect(x: continueAnim[0] && modelData.profile.anims[2] ? 1 : 0, y: continueAnim[0] && modelData.profile.anims[2] ? 1 : 0)
                    .offset(x: -dWidth * 0.10, y: dWidth * 0.01)
                Image(systemName: "sparkle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dWidth * 0.04)
                    .foregroundStyle(Color.white)
                    .scaleEffect(x: continueAnim[1] && modelData.profile.anims[2] ? 1 : 0, y: continueAnim[1] && modelData.profile.anims[2] ? 1 : 0)
                    .offset(x: -dWidth * 0.05, y: dWidth * 0.045)
            }
    }
    
    func animElec() -> some View {
        return Image(systemName: "macbook.and.iphone")
            .resizable()
            .scaledToFit()
            .frame(width: dWidth * 0.35)
            .foregroundStyle(colorP.c6)
            .padding(.top, 15)
            .overlay {
                Image(systemName: "sparkle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dWidth * 0.07)
                    .foregroundStyle(Color.white)
                    .scaleEffect(x: continueAnim[0] && modelData.profile.anims[3] ? 1 : 0, y: continueAnim[0] && modelData.profile.anims[3] ? 1 : 0)
                    .offset(x: dWidth * 0.13, y: -dWidth * 0.1)
                Image(systemName: "sparkle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dWidth * 0.04)
                    .foregroundStyle(Color.white)
                    .scaleEffect(x: continueAnim[1] && modelData.profile.anims[3] ? 1 : 0, y: continueAnim[1] && modelData.profile.anims[3] ? 1 : 0)
                    .offset(x: dWidth * 0.08, y: -dWidth * 0.115)
                Image(systemName: "sparkle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dWidth * 0.07)
                    .foregroundStyle(Color.white)
                    .scaleEffect(x: continueAnim[0] && modelData.profile.anims[3] ? 1 : 0, y: continueAnim[0] && modelData.profile.anims[3] ? 1 : 0)
                    .offset(x: -dWidth * 0.14, y: -dWidth * 0.1)
                Image(systemName: "sparkle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dWidth * 0.04)
                    .foregroundStyle(Color.white)
                    .scaleEffect(x: continueAnim[1] && modelData.profile.anims[3] ? 1 : 0, y: continueAnim[1] && modelData.profile.anims[3] ? 1 : 0)
                    .offset(x: -dWidth * 0.085, y: -dWidth * 0.04)
            }
    }
}

#Preview {
    TypeWasteButton(dWidth: 300, dHeight: 700, i: 1)
}
