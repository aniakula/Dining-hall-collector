import SwiftUI

struct CircleImage: View {
    let image: Image
    var body: some View {
        image
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            
            .shadow(radius: 8)
    }
}

#Preview {
    CircleImage(image: Image("quaker"))
}
