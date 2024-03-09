//
//  ArticlesView.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 28/02/24.
//

import SwiftUI

struct ArticlesView: View {
    var modelData: ModelData = .shared
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @State var index = -1
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    let articulos = [testArticles().A6, testArticles().A2, testArticles().A3, testArticles().A5, testArticles().A4, testArticles().A1]
    @State var wish = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
            Rectangle()
                .fill(colorP.c5.opacity(0.6))
            EmitterViewIcon(wish: $wish)

            VStack(spacing: 0) {
                SearchBar2(dWidth: dWidth, dHeight: dHeight)
                    .padding(.bottom, 10)
                ScrollView(showsIndicators: false) {
                    ForEach(articulos) { articulo in
                        NavigationLink {
                            ArticleDisplay(dWidth: dWidth, dHeight: dHeight, data: articulo)
                        } label: {
                            ArticlePreview(dWidth: dWidth, dHeight: dHeight, data: articulo)
                        }
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: dWidth * 0.06))
            }
            .padding(safeAreaInsets)
            .padding(.horizontal, 10)
            .padding(.bottom, dWidth / 5 + 10)
        }
    }
}

#Preview {
    ArticlesView(dWidth: 300, dHeight: 700)
}
