//
//  DataModel.swift
//  AR_TEST
//
//  Created by SeungWoo Mun on 2020/10/01.
//

import Combine
import RealityKit
// import Swift

final class DataModel: ObservableObject {
    static var shared = DataModel()
    @Published var arView: ARView!
    @Published var enableAR = false
    @Published var xTranslation: Float = 0 {
        didSet {translateBox()}
    }
    @Published var yTranslation: Float = 0 {
        didSet {translateBox()}
    }
    @Published var zTranslation: Float = 0 {
        didSet {translateBox()}
    }
    
    init() {
        // Initialise the ARView
        arView = ARView(frame: .zero)
        
        // Load the "Box" scene frome the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
    }
    
    func translateBox() {
        // Try to find the steel box Entity
        if let steelBox = (arView.scene.anchors[0] as? Experience.Box)?.steelBox {
            // Convert centimetres to metres
            let xTranslationM = xTranslation / 100
            let yTranslationM = yTranslation / 100
            let zTranslationM = zTranslation / 100
            
            // Convert to a vector of 3 float values
            let translation = SIMD3<Float>(xTranslationM, yTranslationM, zTranslationM)
            
            // Translate the box by this amount
            steelBox.transform.translation = translation
        }
    }
}
