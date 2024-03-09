//
//  SearchButton.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 01/03/24.
//

import SwiftUI

struct SearchBar: View {
    @State var searchText = ""
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    
    var body: some View {
        HStack {
            Button {
                //
            } label: {
                Image(systemName: "sparkle.magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(colorP.c6)
                    .frame(height: dHeight*0.035)
                    .fixedSize()
            }
            .padding(.leading, dHeight*0.01)
            TextField("Busca un servicio", text: $searchText)
                .foregroundStyle(colorP.c6)
                .bold()
            Button {
                searchText = ""
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(colorP.c6)
                    .frame(height: dHeight*0.022)
            }
        }
        .padding(.trailing, 10)
        .background(RoundedRectangle(cornerRadius: dHeight*0.022)
            .fill(colorP.c4)
        .frame(height: dHeight*0.044))
    }
}

struct SearchBar2: View {
    @State var searchText = ""
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    
    var body: some View {
        HStack {
            Button {
                //
            } label: {
                Image(systemName: "sparkle.magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(colorP.c6)
                    .frame(height: dHeight*0.035)
                    .fixedSize()
            }
            .padding(.leading, dHeight*0.01)
            TextField("Busca un articulo", text: $searchText)
                .foregroundStyle(colorP.c6)
                .bold()
            Button {
                searchText = ""
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(colorP.c6)
                    .frame(height: dHeight*0.022)
            }
        }
        .padding(.trailing, 10)
        .background(RoundedRectangle(cornerRadius: dHeight*0.022)
            .fill(colorP.c4)
        .frame(height: dHeight*0.044))
    }
}

#Preview {
    SearchBar(dWidth: 300, dHeight: 700)
}
