import SwiftUI
import MapKit

struct MapControlView: View {
    var body: some View {
        ScrollView{
            VStack{
                HeadlineView(
                    title: "Map", 
                    url: "https://developer.apple.com/documentation/mapkit/map", 
                    description: "A view that displays an embedded map interface."
                )
                SimpleMapView()
                Divider()
            }
            .padding()
        }.padding()
    }
}

private struct SimpleMapView: View {
    
    var code : String {
        return """
private struct SimpleMapView: View {
    @State var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: \(centerLatitude.valueString), 
            longitude: \(centerLongitude.valueString), 
        span: MKCoordinateSpan(
            latitudeDelta: \(spanLatitudeDelta.valueString), 
            longitudeDelta: \(spanLongitudeDelta.valueString))
    )
    
    var body: some View {
        Map(
            coordinateRegion: $coordinateRegion ,
            showsUserLocation: \(showsUserLocation.valueString)
        )
        .frame(height: 500)
    }
}
"""
    }
    
    @State var centerLatitude = DoubleOption(name: "center latitudeDelta", value: 37.330828, range: -90...90)
    @State var centerLongitude = DoubleOption(name: "center longitudeDelta", value: -122.007495, range: -180...180)
    @State var spanLatitudeDelta = DoubleOption(name: "span latitudeDelta", value: 0.02, range: 0...10)
    @State var spanLongitudeDelta = DoubleOption(name: "span longitudeDelta", value: 0.02, range: 0...10)
    @State var showsUserLocation = BoolOption(name: "showsUserLocation", value: false)
    
    @State var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 37.330828, 
            longitude: -122.007495), 
        span: MKCoordinateSpan(
            latitudeDelta: 0.02, 
            longitudeDelta: 0.02)
    )
    
    var body: some View {
        CodePreviewView(code: code)
        Map(
            coordinateRegion: $coordinateRegion ,
            showsUserLocation: showsUserLocation.value
        )
        .onChange(of: coordinateRegion.center.latitude, perform: { newValue in
            centerLatitude.value = newValue
        })
        .onChange(of: coordinateRegion.center.longitude, perform: { newValue in
            centerLongitude.value = newValue
        })
        .onChange(of: coordinateRegion.span.latitudeDelta, perform: { newValue in
            spanLatitudeDelta.value = newValue
        })
        .onChange(of: coordinateRegion.span.longitudeDelta, perform: { newValue in
            spanLongitudeDelta.value = newValue
        })
        
        .frame(height: 500)
        
        DoubleOptionView(option: $centerLatitude)
            .onChange(of: centerLatitude.value) { newValue in
                coordinateRegion.center.latitude=newValue
            }
        DoubleOptionView(option: $centerLongitude)
            .onChange(of: centerLongitude.value) { newValue in
                coordinateRegion.center.longitude=newValue
            }
        DoubleOptionView(option: $spanLatitudeDelta)
            .onChange(of: spanLatitudeDelta.value) { newValue in
                coordinateRegion.span.latitudeDelta=newValue
            }
        DoubleOptionView(option: $spanLongitudeDelta)
            .onChange(of: spanLongitudeDelta.value) { newValue in
                coordinateRegion.span.longitudeDelta=newValue
            }
        BoolOptionView(option: $showsUserLocation)
    }
}

struct MapControlView_Previews: PreviewProvider {
    static var previews: some View {
        MapControlView()
    }
}
