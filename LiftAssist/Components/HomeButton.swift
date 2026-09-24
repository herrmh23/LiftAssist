import SwiftUI

//resuable home button
struct HomeButton: View {
   
    let title: String
    let subtitle: String?
    let icon: String?
    
    var body: some View {
        
        HStack(spacing: 15) {
            
            
            if let icon = icon {
                Image(systemName: icon)
                    .font(.title2)
                    .frame(width: 30)
            }
            
            VStack(alignment: .leading, spacing: 3) {
                
                Text(title)
                    .font(.headline)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .opacity(0.8)
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
        .foregroundStyle(.white)
        .padding()
        .frame(maxWidth: .infinity)
        //.background(Color(red: 23.0 / 255, green: 23.0 / 255, blue: 23.0 / 255))
        .background(Color(.blue))
        .clipShape( RoundedRectangle(cornerRadius: 16))
    }
}
