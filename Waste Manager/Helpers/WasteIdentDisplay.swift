//
//  WasteIdentDisplay.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 02/03/24.
//

import SwiftUI

struct WasteIdentDisplay: View {
    var modelData: ModelData = .shared
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    
    var body: some View {
        RoundedRectangle(cornerRadius: dWidth * 0.06)
            .frame(width: dWidth * 0.95, height: dWidth * 0.2)
            .foregroundColor(colorP.c1)
            .overlay {
                HStack {
                    Image("tierra")
                        .resizable()
                        .scaledToFit()
                        .frame(width: dWidth * 0.13)
                    Spacer()
                    NavigationStack {
                        FindMapButton(dWidth: dWidth, dHeight: dHeight)
                    }
                    Spacer()
                    QuantityButton(dWidth: dWidth, dHeight: dHeight)
                        .foregroundStyle(colorP.c2)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
            }
    }
}

struct WasteIdentDisplay2: View {
    var modelData: ModelData = .shared
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    
    var body: some View {
        RoundedRectangle(cornerRadius: dWidth * 0.06)
            .frame(width: dWidth * 0.7, height: dWidth * 0.35)
            .foregroundColor(colorP.c1)
            .overlay {
                VStack {
                    HStack {
                        Image("tierra")
                            .resizable()
                            .scaledToFit()
                            .frame(width: dWidth * 0.13)
                        Spacer()
                        Text(modelData.IdentfiedWaste)
                            .font(.title)
                            .foregroundStyle(Color.black)
                            .bold()
                        Spacer()
                        QuantityButton(dWidth: dWidth, dHeight: dHeight)
                            .foregroundStyle(colorP.c2)
                    }
                    NavigationStack {
                        FindMapButton(dWidth: dWidth, dHeight: dHeight)
                    }
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
            }
    }
}

struct QuantityButton: View {
    var modelData: ModelData = .shared
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    
    var body: some View {
        Menu {
            Button("Agrega 1", action: Add_1)
            Button("Agrega 2", action: Add_2)
            Button("Agrega 5", action: Add_5)
            Button("Agrega 10", action: Add_10)
        } label: {
            Image(systemName: "trash")
                .resizable()
                .scaledToFit()
                .frame(width: dWidth * 0.06)
                .overlay {
                    ZStack {
                        Circle()
                            .frame(width: dWidth * 0.045)
                            .foregroundStyle(colorP.c1)
                            .offset(x: dWidth * 0.02 * 1.2, y: -dWidth * 0.02 * 1.2)
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: dWidth * 0.035)
                            .offset(x: dWidth * 0.02 * 1.2, y: -dWidth * 0.02 * 1.2)
                    }
                }
                .scaleEffect(x: 1.3, y: 1.3)
        }
    }
    
    func Add_1() {
        modelData.profile.AddWaste(quantity: 1, type: modelData.IdentfiedWaste)
        return
    }
    func Add_2() {
        modelData.profile.AddWaste(quantity: 2, type: modelData.IdentfiedWaste)
        return
    }
    func Add_5() {
        modelData.profile.AddWaste(quantity: 5, type: modelData.IdentfiedWaste)
        return
    }
    func Add_10() {
        modelData.profile.AddWaste(quantity: 10, type: modelData.IdentfiedWaste)
        return
    }
}

struct QuantityButton2: View {
    var modelData: ModelData = .shared
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    
    var body: some View {
        Menu {
            Button("Agrega 1", action: Add_1)
            Button("Agrega 2", action: Add_2)
            Button("Agrega 5", action: Add_5)
            Button("Agrega 10", action: Add_10)
        } label: {
            Image(systemName: "trash")
                .resizable()
                .scaledToFit()
                .frame(width: dWidth * 0.06)
                .overlay {
                    ZStack {
                        Circle()
                            .frame(width: dWidth * 0.045)
                            .foregroundStyle(colorP.c1)
                            .offset(x: dWidth * 0.02, y: -dWidth * 0.02)
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: dWidth * 0.035)
                            .offset(x: dWidth * 0.02, y: -dWidth * 0.02)
                    }
                }
        }
    }
    
    func Add_1() {
        modelData.profile.AddWaste(quantity: 1, type: modelData.IdentfiedWaste)
        return
    }
    func Add_2() {
        modelData.profile.AddWaste(quantity: 2, type: modelData.IdentfiedWaste)
        return
    }
    func Add_5() {
        modelData.profile.AddWaste(quantity: 5, type: modelData.IdentfiedWaste)
        return
    }
    func Add_10() {
        modelData.profile.AddWaste(quantity: 10, type: modelData.IdentfiedWaste)
        return
    }
}

struct FindMapButton: View {
    var modelData: ModelData = .shared
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    
    var body: some View {
        NavigationLink {
            switch modelData.IdentfiedWaste {
            case "Electronic":
                ElectronicsMap()
            case "Recycle":
                RecycleMap()
            case "Organic":
                OrganicMap()
            case "Glass":
                GlassMap()
            default:
                ElectronicsMap()
            }
        } label: {
            RoundedRectangle(cornerRadius: dWidth * 0.06)
                .frame(width: dWidth * 0.65, height: dWidth * 0.1)
                .foregroundStyle(colorP.c2)
                .overlay {
                    Text("Explora lugares")
                        .font(.title3)
                        .foregroundStyle(colorP.c4)
                }
        }
    }
}

struct AdviceRectangle: View {
    var modelData: ModelData = .shared
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    
    var body: some View {
        RoundedRectangle(cornerRadius: dWidth * 0.06)
            .foregroundStyle(colorP.c6)
            .overlay {
                ZStack {
                    Image("tierra")
                        .resizable()
                        .scaledToFit()
                        .frame(width: dWidth * 0.13)
                        .offset(x: -dWidth * 0.31, y: -dWidth * 0.23)
                    Text(GetAdvice())
                        .foregroundStyle(colorP.c1)
                        .padding(.all, 10)
                }
            }
    }
    
    func GetAdvice() -> String {
        let advices = ["   Compra presentaciones familiares de productos como yogurt, galletas o cereal en vez de individuales y envía el lunch en empaques reutilizables, con ello generarás menos cantidad de basura.", "   Toma agua en vasos de cristal, reduce el consumo de botellas de plástico o PET.", "   Evita productos que tardan miles de años en degradarse como el Unicel, si no puedes evitar utilizar desechables busca los que están hechos con maíz o que tienen materiales biodegradables.", "   Si compras algo pequeño y fácil de cargar no pidas una bolsa de plástico.", "   Utiliza nuevamente los frascos y envases. Elige empaques de cartón o vidrio en lugar de plástico.", "   Reutiliza tu ropa inservible para otros usos, como trapos de cocina u otras mil cosas que se pueden hacer con los retales.", "   El papel puede reciclarse fácilmente. Al reciclar el papel se ahorraría un 60% de energía y un 50% de contaminación. Por cada tonelada de papel y cartón que se recicle se dejan de cortar 17 árboles.", "   Coloca separadores de basura adicionales para que clasifiques el vidrio, el papel y el plástico. Si separamos estos productos será más fácil que puedan ser utilizados nuevamente.", "   Los residuos sanitarios son los que se generan en los baños y es recomendable mantenerlos por separado, no revolverlos ni quemarlos."]
        return advices[Int.random(in: 0..<advices.count)]
    }
}

#Preview {
    WasteIdentDisplay(dWidth: 300, dHeight: 700)
}
