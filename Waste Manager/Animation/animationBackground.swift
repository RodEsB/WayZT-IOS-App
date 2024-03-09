import SwiftUI

struct animationBackground: View {
    @State var wish = false

    var body: some View {
        EmitterView(wish: $wish) // Llama a la función
            .scaleEffect(!wish ? 1 : 0, anchor: .top)
            .opacity(!wish ? 1 : 0)
            .ignoresSafeArea() // Pantalla completa
    }
}

struct animation: PreviewProvider {
    static var previews: some View {
        animationBackground()
        
    }
}

// Función para obtener las medidas
func getRect() -> CGRect {
    return UIScreen.main.bounds
}

// Crear las partículas (View)

struct EmitterView: UIViewRepresentable {
    @Binding var wish: Bool

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
        
        for index in 1...12{
            
            let imageName = getImage(index: index) //Declarar la constante de imageName y darle el valor de la función
            
            // Importar las imágenes del sistema
            if let systemImage = UIImage(systemName: imageName) { //Agregar el nombre del la imagen deseada
                let cell = CAEmitterCell()

                cell.contents = systemImage.cgImage
                cell.color = getColor().cgColor
                // Creación de una partícula
                cell.birthRate = 0.1 // .birthRate es el efecto
                // Tiempo de duración
                cell.lifetime = 2000
                // Velocidad
                cell.velocity = 1
                // Tamaño
                cell.scale = 0.2 //Tamaño de base
                cell.scaleRange = 1 //Tamaño maximo que puede alcanzar
                cell.emissionLongitude = 0.2 //Dispersion (Valor pi)
                cell.emissionRange = 0.3 //Movimiento (depende del valor como se moverá)
                cell.spin = 0.1 //Giro de la imagen
                cell.spinRange = 0.3 //Maximo de giro
                
                //Aceleración de las partículas
                cell.yAcceleration = 0.1
                
                //Creación del efecto de desvanecimiento
                
                // Efecto de desvanecimiento manual
                          /* cell.redRange = 1.0
                           cell.greenRange = 1.0
                           cell.blueRange = 1.0
                           cell.alphaRange = 0.5 // Rango de opacidad
*/
                emitterCells.append(cell)
            }
        }
        
        return emitterCells
    }
    
    func getColor()->UIColor{ //Creación de colores
        let colors: [UIColor] = [.systemRed, .systemBlue, .systemGreen, .systemOrange, .systemYellow]
        
        return colors.randomElement()!
    }
    
    func getImage(index: Int)->String { //Creación de varias imagenes
        if index < 4{
            return "function"
        }
        else if index > 5 && index <= 8{
            return "leaf"
        }
        else{
            return "plus"
        }
    }
}

