//
//  ArticleDisplay.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 05/03/24.
//

import SwiftUI

struct ArticleDisplay: View {
    let dWidth: Double
    let dHeight: Double
    let data: Articulo
    let colorP = ColorPalette()
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .ignoresSafeArea()
            Rectangle()
                .fill(colorP.c5.opacity(0.08))
                .ignoresSafeArea()
            VStack {
                ScrollView(showsIndicators: false) {
                    HStack {
                        Text(data.title)
                            .font(.title)
                            .bold()
                            .foregroundStyle(Color.black)
                        Link(destination: URL(string: data.URL)!, label: {
                            Image(systemName: "link.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: dWidth*0.05)
                        })
                    }
                    HStack {
                        Text(data.author)
                            .foregroundStyle(Color.black)
                            .bold()
                            .italic()
                        Divider()
                        Text(data.date, style: .date)
                            .foregroundStyle(Color.black)
                            .bold()
                            .italic()
                    }
                    ForEach(0..<data.textBody.count) { i in
                        Text(data.textBody[i])
                            .foregroundStyle(Color.black)
                            .padding(.top, 10)
                    }
                    Link(destination: URL(string: data.URL)!, label: {
                        Image(systemName: "link.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: dWidth*0.05)
                    })
                }
            }
            .padding(.horizontal, 15)
        }
    }
}

#Preview {
    ArticleDisplay(dWidth: 300, dHeight: 700, data: testArticles().A6)
}
