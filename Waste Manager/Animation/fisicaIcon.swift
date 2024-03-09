
import SwiftUI

struct fisicaIcon: View {
    @State var wish2 = false

    var body: some View {
        ZStack {
            EmitterViewIcons(wish2: $wish2) // Llama a la función
                .scaleEffect(!wish2 ? 1 : 0, anchor: .top)
                .opacity(!wish2 ? 0.8 : 0)
                .background(.clear)
                .ignoresSafeArea()
            
        } // Pantalla completa
        
    }
}

struct animationIcons: PreviewProvider {
    static var previews: some View {
        fisicaIcon()
    }
}

// Función para obtener las medidas
func getRectIcons() -> CGRect {
    return UIScreen.main.bounds
}

// Crear las partículas (View)

struct EmitterViewIcons: UIViewRepresentable {
    @Binding var wish2: Bool

    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .clear
        

        // Creación de la capa
        let emitterLayer = CAEmitterLayer()
        // Arriba y abajo animación

        emitterLayer.emitterShape = .line
        emitterLayer.emitterCells = createEmitterCells()

        // Tamaño y ubicación

        emitterLayer.emitterSize = CGSize(width: getRect().width, height: 1)
        emitterLayer.emitterPosition = CGPoint(x: getRect().width / 2, y: 0)

        view.layer.addSublayer(emitterLayer)
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}

    func createEmitterCells() -> [CAEmitterCell] {
        
        //Creación de mutliples imagenes
        
        var emitterCells: [CAEmitterCell] = [] //Creacion del arreglo para almacenar las imagenes

            // Importar las imágenes del sistema
        if let systemImage = UIImage(systemName: "figure.fall") { //Agregar el nombre del la imagen deseada
                let cell = CAEmitterCell()

                cell.contents = systemImage.cgImage
                cell.color = UIColor.red.cgColor
                // Creación de una partícula
                cell.birthRate = 4.5 // .birthRate es el efecto
                // Tiempo de duración
                cell.lifetime = 1000
                // Velocidad
                cell.velocity = 120
                // Tamaño
                cell.scale = 0.45 //Tamaño de base
                cell.scaleRange = 3 //Tamaño maximo que puede alcanzar
                cell.emissionLongitude = 20 //Dispersion (Valor pi)
                cell.emissionRange = 3 //Movimiento (depende del valor como se moverá)
                cell.spin = 0.2 //Giro de la imagen
                cell.spinRange = 0.3 //Maximo de giro

                emitterCells.append(cell)
        }
        
        return emitterCells
    }
    

    
}



