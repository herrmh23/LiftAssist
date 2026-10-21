import SwiftUI

//resuable home button
struct ClickButtonAdvanced: View {
   
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
            
        }
        .foregroundStyle(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.blue))
        .clipShape( RoundedRectangle(cornerRadius: 16))
    }
}
