//
//  MapProgress.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 01/03/24.
//

import SwiftUI

struct MapProgress: View {
    var modelData: ModelData = .shared
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    
    var body: some View {
        HStack {
            WasteProgressBar(dWidth: dWidth, dHeight: dHeight)
            VStack {
                Group {
                    HStack {
                        Text("Reciclable")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(colorP.c6)
                        Image(systemName: "waterbottle")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(colorP.c6)
                    }
                    HStack {
                        Text(String(modelData.profile.RecWaste))
                            .font(.footnote)
                            .foregroundStyle(Color.black)
                            .bold()
                        ProgressView(value: Float(modelData.profile.RecWaste), total: Float(modelData.profile.RecWasteGoal))
                            .tint(Color.green)
                        Text(String(modelData.profile.RecWasteGoal))
                            .font(.footnote)
                            .foregroundStyle(Color.black)
                            .bold()
                    }
                }
                Group {
                    HStack {
                        Text("Organica")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(colorP.c6)
                        Image(systemName: "carrot")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(colorP.c6)
                    }
                    HStack {
                        Text(String(modelData.profile.OrgWaste))
                            .font(.footnote)
                            .foregroundStyle(Color.black)
                            .bold()
                        ProgressView(value: Float(modelData.profile.OrgWaste), total: Float(modelData.profile.OrgWasteGoal))
                            .tint(Color.green)
                        Text(String(modelData.profile.OrgWasteGoal))
                            .font(.footnote)
                            .foregroundStyle(Color.black)
                            .bold()
                    }
                }
                Group {
                    HStack {
                        Text("Vidrio")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(colorP.c6)
                        Image(systemName: "wineglass")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(colorP.c6)
                    }
                    HStack {
                        Text(String(modelData.profile.GlassWaste))
                            .font(.footnote)
                            .foregroundStyle(Color.black)
                            .bold()
                        ProgressView(value: Float(modelData.profile.GlassWaste), total: Float(modelData.profile.GlassWasteGoal))
                            .tint(Color.green)
                        Text(String(modelData.profile.GlassWasteGoal))
                            .font(.footnote)
                            .foregroundStyle(Color.black)
                            .bold()
                    }
                }
                Group {
                    HStack {
                        Text("Electronicos")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(colorP.c6)
                        Image(systemName: "macbook.and.iphone")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(colorP.c6)
                    }
                    HStack {
                        Text(String(modelData.profile.E_Waste))
                            .font(.footnote)
                            .foregroundStyle(Color.black)
                            .bold()
                        ProgressView(value: Float(modelData.profile.E_Waste), total: Float(modelData.profile.E_WasteGoal))
                            .tint(Color.green)
                        Text(String(modelData.profile.E_WasteGoal))
                            .font(.footnote)
                            .foregroundStyle(Color.black)
                            .bold()
                    }
                }
            }
            .padding(.vertical, 10)
            .padding(.trailing, 10)
        }
    }
}

struct WasteProgressBar: View {
    var modelData: ModelData = .shared
    @State private var anim = false
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    let option = false
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                Rectangle()
                    .fill(
                        LinearGradient(colors: option ? [Color.green, colorP.c2] : [colorP.c5, Color.green], startPoint: .top, endPoint: .bottom)
                    )
                    .frame(height: dHeight*0.32 * Double(modelData.profile.currentWaste) / Double(modelData.profile.wasteGoal))
            }
        }
        .frame( width: dWidth*0.4, height:dHeight*0.32)
        .overlay {
            if option {
                BottleAndGlass(dWidth: dWidth, dHeight: dHeight)
                    .offset(x: -10)
            } else {
                Image("planet")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dWidth*0.25)
                    .scaleEffect(x: anim ? 1.1 : 1, y: anim ? 1.1 : 1)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                            anim.toggle()
                        }
                    }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: dWidth * 0.0636, style: .continuous))
        .padding(.all, 5)
        .padding(.leading, 5)
    }
}

#Preview {
    MapProgress(dWidth: 300, dHeight: 700)
}
