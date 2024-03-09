//
//  ContentView.swift
//  SlidingIntro
//
//  Created by Rod Espiritu Berra on 05/03/24.
//

import SwiftUI

struct CView: View {
    @State private var pageIndex = 0 // Creación de la variable para el índice de las páginas
    //View general para el Sliding Intro
    @Binding var gotoApp: Bool
    
    private let pages: [Page] = Page.samplePages //Creación de la variable y llamado de la anterior (PageView)
    private let dotAppearance = UIPageControl.appearance() //Creación del dot debajo para aparecer
    
    var body: some View {
        let colorP = ColorPalette()
        ZStack {
            Rectangle()
                .foregroundColor(colorP.c2)
                .ignoresSafeArea()
            
            VStack {
                TabView(selection: $pageIndex) {
                    ForEach(pages) { page in
                        VStack {
                            Spacer()
                            PageView(page: page)
                            Spacer()
                            
                            if page == pages.last {
                                Button("Bienvenido", action: goToHome)
                                    .buttonStyle(.bordered)
                                    .foregroundColor(Color(red: 72/255, green: 62/255, blue: 77/255))
                                    .padding(EdgeInsets(top: 20, leading: 35, bottom: 40, trailing: 30))
                                    .foregroundColor(.white)
                                    .background(
                                    RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(red: 72/255, green: 62/255, blue: 77/255), lineWidth: 0))
                                
                            } else {
                                Button("Continuar", action: incrementPage)
                                    .buttonStyle(.bordered)
                                    .foregroundColor(Color(red: 72/255, green: 62/255, blue: 77/255))
                                    .padding(EdgeInsets(top: 20, leading: 35, bottom: 20, trailing: 30))
                                    .foregroundColor(.white)
                                    .background(
                                    RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(red: 72/255, green: 62/255, blue: 77/255), lineWidth: 0))
                                Spacer()
                            }
                        }
                        .tag(page.tag)
                    }
                }
                .animation(.easeInOut, value: pageIndex)
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            }
        }
        .onAppear {
            dotAppearance.currentPageIndicatorTintColor = .green
            dotAppearance.pageIndicatorTintColor = .gray
        }
    }
    
    func incrementPage() { // Realiza el incremento para pasar a la siguiente página
        pageIndex += 1
    }
    
    func goToHome() { // Empieza desde 0 debe cambiar a direccionar al home de la App
        gotoApp = true
    }
}
