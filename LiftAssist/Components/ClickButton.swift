import SwiftUI

//resuable home button
struct ClickButton: View {
   
    let title: String

    
    var body: some View {
        
        HStack( spacing: 15) {
            
            Spacer()

                Text(title)
                    .font(.headline)
     
            Spacer()
            
        }
        .foregroundStyle(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.blue))
        .clipShape( RoundedRectangle(cornerRadius: 16))
    }
}
