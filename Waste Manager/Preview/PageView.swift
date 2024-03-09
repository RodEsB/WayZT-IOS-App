//
//  PageView.swift
//  SlidingIntro
//
//  Created by Rod Espiritu Berra on 05/03/24.
//

import SwiftUI

struct PageView: View {
    var page : Page
    var body: some View {
        //View para generar el modelo de la view de páginas
        VStack(spacing : 20) {
            
            Text(page.name)
                .font(.system(size: 30, weight: .bold, design: .serif))
                .fontDesign(.default)
                .padding()
                .foregroundColor(Color(red: 251/255, green: 251/255, blue: 251/255))
                .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 4)
            
            Image("\(page.imageUrl)")
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(10)
                .padding()
            
            Text(page.description)
                .font(.system(size: 15, weight: .bold, design: .serif))
                .fontDesign(.default)
                .frame(width: 300)
                .foregroundColor(Color(red: 251/255, green: 251/255, blue: 251/255))
                .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 4)
                .multilineTextAlignment(.center)
                .padding()
                .overlay(
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 0)) 
                .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 72/255, green: 62/255, blue: 77/255)))
                .padding()
        }
    
    }
}
struct PageView_Previews: PreviewProvider    { //Considerar lo siguiente para hacer el llamado del modelo en la View general
    static var previews: some View{
        PageView(page: Page.samplePage)
    }
}
