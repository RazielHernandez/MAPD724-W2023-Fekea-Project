//
//  ARView.swift
//  Fakea
//
// Student Name: Carlos Hernandez Galvan
// Student ID: 301290263
//
// Student Name: Oscar Miralles Fernandez
// Student ID: 301250756
//
// Student Name: Yingda Zhang
// Student ID: 301275707
//
// Student Name: Carlos Norambuena
// Student ID: 301265667
//
// Student Name: Victor Quezada
// Student ID: 301286477
//
// AR View to simulate how the forniture looks in the room

import SwiftUI
import ARKit
import SceneKit.ModelIO

struct ARView: View {
    
    var body: some View {
        ARViewCamera()
    }
    
}

struct ARViewCamera: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        var sceneView  = ARSCNView()
        sceneView.showsStatistics = false
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        
        guard let url = Bundle.main.url(forResource: "recliner", withExtension: "usdz") else { fatalError() }
        let mdlAsset = MDLAsset(url: url)
        let scene = SCNScene(mdlAsset: mdlAsset)
        sceneView.scene = scene
        
        return sceneView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
}

struct ARView_Previews: PreviewProvider {
    static var previews: some View {
        ARView()
    }
}
