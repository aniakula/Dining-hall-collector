import SwiftUI

struct HomeView: View {
    @State var viewModel = NavViewModel()
    @State private var showInstructions = false

    var body: some View {
        NavigationStack() {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.5)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    VStack {
                        Image("pennIcon")
                            .resizable()
                            .frame(width: 120, height: 80)
                            .padding()
                            .background(
                                Circle()
                                    .fill(Color.white.opacity(0.2))
                                    .frame(width: 120, height: 120)
                            )
                            .shadow(radius: 10)
                        
                        Text("Campus Dining Halls")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .shadow(radius: 2)
                    }
                    .padding(.bottom, 10)
                    
                    // Dining Halls List
                    List {
                        ForEach(viewModel.getLocations().indices, id: \.self) { index in
                            if let location = viewModel.getLocation(at: index) {
                                NavigationLink(destination: DiningHallView(viewModel: viewModel, location: location)) {
                                    HStack {
                                        location.image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .cornerRadius(10)
                                        
                                        VStack(alignment: .leading) {
                                            Text(location.name)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                            Text("Tap to explore")
                                                .font(.caption)
                                                .foregroundColor(.white.opacity(0.7))
                                        }
                                    }
                                    .padding(.vertical, 8)
                                }
                                .listRowBackground(Color.white.opacity(0.2))
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showInstructions = true
                    }) {
                        Image(systemName: "info.circle")
                            .foregroundColor(.white)
                    }
                    .confirmationDialog("How to Play", isPresented: $showInstructions) {
                        Button("Got it!") {
                            showInstructions = false
                        }
                    } message: {
                        Text("1. Click on the dining halls below to see more information\n2. Navigate to each page and shake the screen within 50ft of the dining hall and you can collect it!\n3. Try to collect as many dining halls as you can!")
                    }
                }
            }
        }
        .accentColor(.white)
    }
}

#Preview {
    HomeView()
}
