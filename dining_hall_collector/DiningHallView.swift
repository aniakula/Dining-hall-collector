import SwiftUI

enum AlertType: Identifiable {
    case alreadyCollected
    case collected
    var id: Int {
        hashValue
    }
}

struct DiningHallView: View {
    @StateObject var viewModel: DiningHallViewModel
    @Environment(\.dismiss) private var dismiss
    @StateObject private var motionManager = MotionManager()
    let location: Location
    @State private var alertType: AlertType? = nil
    
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
        .onAppear {
            if viewModel.isCollected(location) {
                alertType = .alreadyCollected
            } else {
                motionManager.onShakeDetected = {
                    viewModel.collect(location)
                    alertType = .collected
                }
                motionManager.startUpdates()
            }
        }
        .onDisappear {
            motionManager.stopUpdates()
        }
        // Display an alert based on the alertType.
        .alert(item: $alertType) { type in
            switch type {
            case .alreadyCollected:
                return Alert(
                    title: Text("Dining Hall Collected"),
                    message: Text("This dining hall has already been collected."),
                    dismissButton: .default(Text("OK"), action: {
                        dismiss()
                    })
                )
            case .collected:
                return Alert(
                    title: Text("Dining Hall Collected"),
                    message: Text("You have successfully collected this dining hall!"),
                    dismissButton: .default(Text("OK"), action: {
                        dismiss()  //return home.
                    })
                )
            }
        }
    }
}

#Preview { DiningHallView(viewModel: DiningHallViewModel(), location: Location(name: "1920 Commons", description: "A popular dining hall in the heart of campus.", image: Image("commons"), coords: .commons)) }
