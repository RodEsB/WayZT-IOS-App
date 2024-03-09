import SwiftUI

struct oneIcon: View {
    @State var wish = false

    var body: some View {
        ZStack {
            EmitterViewIcon(wish: $wish) // Llama a la función
                .scaleEffect(!wish ? 1 : 0, anchor: .top)
                .opacity(!wish ? 0.1 : 0)
                .background(.blue)
                .ignoresSafeArea()
            
        } // Pantalla completa
        
    }
}

struct animationIcon: PreviewProvider {
    static var previews: some View {
        oneIcon()
    }
}

// Función para obtener las medidas
func getRectIcon() -> CGRect {
    return UIScreen.main.bounds
}

// Crear las partículas (View)

struct EmitterViewIcon: UIViewRepresentable {
    @Binding var wish: Bool
    let colorP = ColorPalette()

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
        if let systemImage = UIImage(named: "hijita") { //Agregar el nombre del la imagen deseada
            let cell = CAEmitterCell()
            
            cell.contents = systemImage.cgImage
            cell.color = CGColor(red: 3/255, green: 54/255, blue: 49/255, alpha: 1)
            // Creación de una partícula
            cell.birthRate = 4.5 // .birthRate es el efecto
            // Tiempo de duración
            cell.lifetime = 1000
            // Velocidad
            cell.velocity = 120
            // Tamaño
            cell.scale = 0.01 //Tamaño de base
            cell.scaleRange = 0.1 //Tamaño maximo que puede alcanzar
            cell.emissionLongitude = 20 //Dispersion (Valor pi)
            cell.emissionRange = 3 //Movimiento (depende del valor como se moverá)
            cell.spin = 0.2 //Giro de la imagen
            cell.spinRange = 0.3 //Maximo de giro
            
            emitterCells.append(cell)
        }
        
        return emitterCells
    }
}

extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}



