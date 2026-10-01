import SwiftUI

struct TextSection: View {
    
    let title: String
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            
            Text(text)
                .font(.body)
                .foregroundStyle(.secondary)
                .lineSpacing(4)
        }
    }
}
