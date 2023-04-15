//
//  Map.swift
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
// Show map to locate stores where items are aviable

import SwiftUI
import MapKit

struct Marker: Identifiable {
    let id = UUID()
    var location: MapMarker
}

struct Map: View {
    @StateObject var mapData = MapViewModel()
    
    // Location MAnager
    @State var locationManager = CLLocationManager()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 38.8977, longitude: -77.0365), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    let markers = [Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: 38.8977, longitude: -77.0365), tint: .red))]
    
    var body: some View {
        ZStack {
            // MapView
            MapView()
            // Using it as enviroment object so that it can be used ints subViews.
                .environmentObject(mapData)
                .ignoresSafeArea(.all, edges: .all)
                
            
            VStack {
                
                
                /*Map(coordinateRegion: $region, annotationItems: markers) { location in
                            //MapMarker(coordinate: location.coordinate, tint: .blue) // For using built-in marker
                            MapAnnotation(coordinate: location.coordinate) {
                                Circle()
                                    .stroke(.blue, lineWidth: 4)
                                    .frame(width: 11, height: 11)
                                    .onTapGesture {
                                        print("Clicked on \(location.name)")
                                    }
                                
                                Text(location.name).foregroundColor(Color.blue)
                                
                            }
                        }*/
                
               /*MapView(coordinateRegion: $region, showsUserLocation: true,
                  annotationItems: markers) { marker in
                    marker.location
                }.edgesIgnoringSafeArea(.all)*/
                
                VStack(spacing: 0) {
/*                    HStack {
                        Image(systemName: "magnifyingglass.circle")
                            .foregroundColor(.gray)
                        
                        TextField("Search", text: $mapData.search)
                            .colorScheme(.light)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.white)
                    .padding(.top)
         
                    // Displaying results
                   if !mapData.places.isEmpty && mapData.search != "" {
                        
                        ScrollView {
                            
                            VStack(spacing: 15) {
                                
                                ForEach(mapData.places) { place in
                                    
                                    Text(place.placemark.name ?? "")
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading)
                                        .onTapGesture {
                                            
                                            mapData.selectPlace(place: place)
                                            
                                        }
                                    
                                    Divider()
                                }
                            }
                            .padding(.top)
                        }
                        .background(Color.white)
                        
                    } */
                    
                }
                .padding()
                
                Spacer()
                
                VStack {
                    Button(action: mapData.focusLocation, label: {
                        Image(systemName: "location.circle.fill")
                            .font(.title2)
                            .padding(10)
                            .background(Color.primary)
                            .clipShape(Circle())
                    })
                    
                    Button(action: mapData.updateMapType, label: {
                        Image(systemName: mapData.mapType == .standard ? "square.stack.3d.up" : "map")
                            .font(.title2)
                            .padding(10)
                            .background(Color.primary)
                            .clipShape(Circle())
                    })
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .onAppear(perform: {
            
            // Setting Delegate
            locationManager.delegate = mapData
            locationManager.requestWhenInUseAuthorization()
        })
        
        // Permission Denied Alert
        .alert(isPresented: $mapData.permissionDenied, content: {
            Alert(title: Text("Permission Denied"), message:
                    Text("Please Enable Permission in App Settings"),
                  dismissButton: .default(Text("Goto Settings"),
                  action: {
                // Redireting user to Settings
                UIApplication
                    .shared
                    .open(URL(string: UIApplication.openSettingsURLString)!)
            }))
        })
        .onChange(of: mapData.search, perform: { value in
            
            // Searching Places
            let delay = 0.3
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                
                if value == mapData.search {
                    
                    // Search
                    self.mapData.searchQuery()
                }
            }
        })
        
    }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        Map()
    }
}
