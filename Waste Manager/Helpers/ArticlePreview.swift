//
//  ArticlePreview.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 03/03/24.
//

import SwiftUI

struct ArticlePreview: View {
    var modelData: ModelData = .shared
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    let data: Articulo
    
    var body: some View {
        RoundedRectangle(cornerRadius: dWidth * 0.05)
            .fill(colorP.c1)
            .frame(height: dHeight * 0.15)
            .overlay {
                HStack {
                    data.previewImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: dHeight * 0.13)
                        .clipShape(RoundedRectangle(cornerRadius: dWidth * 0.04))
                    VStack(alignment: .leading, spacing: 0) {
                        Text(data.title)
                            .font(.headline)
                            .bold()
                            .foregroundStyle(Color.black)
                            .multilineTextAlignment(.leading)
                        Spacer()
                        HStack {
                            data.authorPicture
                                .resizable()
                                .scaledToFit()
                                .frame(width: dWidth*0.05)
                                .clipShape(Circle())
                            Text(data.author)
                                .font(.caption)
                                .italic()
                                .lineLimit(1)
                                .foregroundStyle(Color.black)
                            Spacer()
                            Text(data.date, style: .date)
                                .font(.caption)
                                .italic()
                                .lineLimit(1)
                                .foregroundStyle(Color.black)
                        }
                    }
                }
                .padding(.all, 10)
            }
    }
}

#Preview {
    ArticlePreview(dWidth: 300, dHeight: 700, data: testArticles().A1)
}
