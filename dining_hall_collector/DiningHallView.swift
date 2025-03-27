

import SwiftUI

struct DiningHallView: View {
    let location: Location
    var body: some View {
        VStack {
            MapView(loc: .commons)
                .frame(height: 300)
            CircleImage(image: location.image)
                .offset(x: 0, y: -80)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.title)
                Divider()
                Text("About:")
                    .font(.title2)
                Text(location.description)
               
            }
            .padding(.top, 50)
            .padding(.horizontal, 20)
            Spacer()
            
        }
    }
}

#Preview {
    DiningHallView(location: Location(name: "1920 Commons", description: "", image: Image("commons"), coords: .commons))
}
