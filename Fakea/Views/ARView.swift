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

struct ARView: View {
    
    
    
    var body: some View {
        
        ARViewCamera()
        
        //Text("Hello world")
        
    }
    
}

struct ARViewCamera: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let sceneView  = ARSCNView()
        sceneView.showsStatistics = true
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        
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
