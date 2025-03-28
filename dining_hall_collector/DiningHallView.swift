import SwiftUI

struct DiningHallView: View {
    @Bindable var viewModel: NavViewModel
    @Environment(\.dismiss) private var dismiss
    let location: Location
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.5)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.white.opacity(0.2))
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                }
                .padding()
                
                MapView(loc: location.coords)
                    .frame(height: 300)
                
                CircleImage(image: location.image)
                    .offset(x: 0, y: -80)
                    .padding(.bottom, -130)
                
                VStack(alignment: .leading) {
                    Text(location.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Divider()
                        .background(Color.white.opacity(0.5))
                    
                    Text("About:")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text(location.description)
                        .foregroundColor(.white)
                }
                .padding(.top, 50)
                .padding(.horizontal, 20)
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    DiningHallView(viewModel: NavViewModel(), location: Location(name: "1920 Commons", description: "A popular dining hall in the heart of campus.", image: Image("commons"), coords: .commons))
}
