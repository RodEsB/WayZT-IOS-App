//
//  CameraView.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 28/02/24.
//

import SwiftUI
import RealityKit
import CoreML
import Vision
import SceneKit
import ARKit

struct CameraView: View {
    var modelData: ModelData = .shared
    let colorP = ColorPalette()
    @State var viewAR = true
    
    var body: some View {
        GeometryReader { proxy in
            let dWidth = proxy.size.width
            let dHeight = proxy.size.height
            
            ZStack(alignment: .top) {
                if viewAR {
                    ARViewContainer()
                        .ignoresSafeArea()
                } else {
                    ARViewContainer2()
                        .ignoresSafeArea()
                }
                VStack {
                    changeView(dWidth: dWidth, dHeight: dHeight)
                    // Only shows information if something is recognized
                    if modelData.IdentfiedWaste != "Not found" {
                        if viewAR {
                            WasteIdentDisplay(dWidth: dWidth, dHeight: dHeight)
                        } else {
                            WasteIdentDisplay2(dWidth: dWidth, dHeight: dHeight)
                        }
                    }
                }
            }
        }
    }
    
    func changeView(dWidth: Double, dHeight: Double) -> some View {
        HStack(spacing: 2) {
            Button {
                viewAR = false
            } label: {
                UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: dWidth * 0.05, bottomLeading: dWidth * 0.05))
                    .fill(colorP.c6)
                    .frame(width: dWidth * 0.14, height: dWidth * 0.1)
                    .overlay {
                        Image(systemName: "arkit")
                            .resizable()
                            .scaledToFit()
                            .frame(width: dWidth * 0.065)
                            .foregroundStyle(viewAR ? colorP.c1 : Color.red)
                            .overlay {
                                Image(systemName: "line.diagonal")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: dWidth * 0.065)
                                    .foregroundStyle(viewAR ? Color.gray : Color.red)
                            }
                            .padding(.leading, dWidth * 0.015)
                    }
            }
            Button {
                viewAR = true
            } label: {
                UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(bottomTrailing: dWidth * 0.05, topTrailing: dWidth * 0.05))
                    .fill(colorP.c6)
                    .frame(width: dWidth * 0.14, height: dWidth * 0.1)
                    .overlay {
                        Image(systemName: "arkit")
                            .resizable()
                            .scaledToFit()
                            .frame(width: dWidth * 0.065)
                            .foregroundStyle(viewAR ? Color.green : colorP.c1)
                            .padding(.trailing, dWidth * 0.015)
                    }
            }
            Spacer()
        }
        .padding(.horizontal, 15)
    }
}

struct ARViewContainer: UIViewRepresentable {
    var recogd: ModelData = .shared
    
    func makeUIView(context: Context) -> ARView {
        let v = recogd.ARview
        return v
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        var txt = SCNText()
        
        // let's keep the number of anchors to no more than 1 for this demo
        if recogd.ARview.scene.anchors.count > 0 {
            recogd.ARview.scene.anchors.removeAll()
        }
        
        // create the AR Text to place on the screen
        txt = SCNText(string: recogd.IdentfiedWaste, extrusionDepth: 1)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.magenta
        txt.materials = [material]
                
        let shader = SimpleMaterial(color: UIColor(red: 0, green: 1, blue: 0, alpha: 1.0), roughness: 1, isMetallic: true)
        let text = MeshResource.generateText(
            "\(recogd.IdentfiedWaste)",
            extrusionDepth: 0.05,
            font: .init(name: "Helvetica", size: 0.05)!,
            alignment: .center
        )
        
        let textEntity = ModelEntity(mesh: text, materials: [shader])
        
        let transform = recogd.ARview.cameraTransform
        
        // set the transform (the 3d location) of the text to be near the center of the camera, and 1/2 meter away
        let trans = transform.matrix
        let anchEntity = AnchorEntity(world: trans)
        textEntity.position.z -= 0.5 // place the text 1/2 meter away from the camera along the Z axis
        
        // find the width of the entity in order to have the text appear in the center
        let minX = text.bounds.min.x
        let maxX = text.bounds.max.x
        let width = maxX - minX
        let xPos = width / 2
        
        textEntity.position.x = transform.translation.x - xPos
        
        anchEntity.addChild(textEntity)
        
        // add this anchor entity to the scene
        recogd.ARview.scene.addAnchor(anchEntity)
    }
}

struct ARViewContainer2: UIViewRepresentable {
    var recogd: ModelData = .shared
    
    func makeUIView(context: Context) -> ARView {
        let v = recogd.ARview
        return v
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        var txt = SCNText()
        
        // let's keep the number of anchors to no more than 1 for this demo
        if recogd.ARview.scene.anchors.count > 0 {
            recogd.ARview.scene.anchors.removeAll()
        }
        
        // create the AR Text to place on the screen
        txt = SCNText(string: "", extrusionDepth: 1)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.magenta
        txt.materials = [material]
                
        let shader = SimpleMaterial(color: UIColor(red: 0, green: 1, blue: 0, alpha: 1.0), roughness: 1, isMetallic: true)
        let text = MeshResource.generateText(
            "\("")",
            extrusionDepth: 0.05,
            font: .init(name: "Helvetica", size: 0.05)!,
            alignment: .center
        )
        
        let textEntity = ModelEntity(mesh: text, materials: [shader])
        
        let transform = recogd.ARview.cameraTransform
        
        // set the transform (the 3d location) of the text to be near the center of the camera, and 1/2 meter away
        let trans = transform.matrix
        let anchEntity = AnchorEntity(world: trans)
        textEntity.position.z -= 0.5 // place the text 1/2 meter away from the camera along the Z axis
        
        // find the width of the entity in order to have the text appear in the center
        let minX = text.bounds.min.x
        let maxX = text.bounds.max.x
        let width = maxX - minX
        let xPos = width / 2
        
        textEntity.position.x = transform.translation.x - xPos
        
        anchEntity.addChild(textEntity)
        
        // add this anchor entity to the scene
        recogd.ARview.scene.addAnchor(anchEntity)
    }
}

func continuouslyUpdate() {
    let modelData: ModelData = .shared
    
    // access what we need from the observed object
    let v = modelData.ARview
    let sess = v.session
    let mod = modelData.model
    
    // access the current frame as an image
    let tempImage: CVPixelBuffer? = sess.currentFrame?.capturedImage
    
    //get the current camera frame from the live AR session
    if tempImage == nil {
        return
    }
    
    let tempciImage = CIImage(cvPixelBuffer: tempImage!)
    
    // create a reqeust to the Vision Core ML Model
    let request = VNCoreMLRequest(model: mod) { (request, error) in }
    
    //crop just the center of the captured camera frame to send to the ML model
    request.imageCropAndScaleOption = .centerCrop
    
    // perform the request
    let handler = VNImageRequestHandler(ciImage: tempciImage, orientation: .right)
    
    do {
        //send the request to the model
        try handler.perform([request])
    } catch {
        print(error)
    }
    
    guard let observations = request.results as? [VNClassificationObservation] else { return}
    
    // only proceed if the model prediction's confidence in the first result is greater than 90%
    modelData.IdentfiedWaste = "Not found"
    if observations[0].confidence < 0.7  { return }
    
    // the model returns predictions in descending order of confidence
    // we want to select the first prediction, which has the higest confidence
    let topLabelObservation = observations[0].identifier
    
    let firstWord = topLabelObservation.components(separatedBy: [","])[0]
        
    if modelData.IdentfiedWaste != firstWord {
        DispatchQueue.main.async {
            modelData.IdentfiedWaste = firstWord
        }
    }
}


#Preview {
    CameraView()
}
