import SwiftUI

struct AboutPageView: View {
    
    // Environment property for legal modal views or link dismissal
    @Environment(\.dismiss) private var dismiss
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
    let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
    
    var body: some View {
        NavigationStack {
        
            ScrollView {
                VStack(spacing: 28) {
                    
                    // MARK: - 1. HEADER HERO SECTION
                    VStack(spacing: 14) {
                        Image("LiftAssistLogo") // Replace with your actual Asset asset name
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110, height: 110)
                            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                            .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 5)
                        
                        VStack(spacing: 4) {
                            Text("LiftAssist")
                                .font(.title)
                                .fontWeight(.bold)
                                .tracking(-0.5)
                            
                            Text("Version \(appVersion) (\(buildNumber))")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(.top, 20)
                    
                    //MARK: - Contact Developer
                    VStack(spacing: 6) {
                        Text("Developed By:")
                        Text("Mark Herrell")
                        Text("herrmh23@uwgb.edu")
                    }
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(.top, 12)
                    
                    
                    // MARK: - 2. FOOTER & COPYRIGHT
                    VStack(spacing: 6) {
                        Text("© 2026 Mark Herrell at UWGB")
                        Text("All Rights Reserved.")
                    }
                    .font(.footnote)
                    .foregroundStyle(.tertiary)
                    .padding(.top, 12)
                    .padding(.bottom, 20)
                    

                    
                }
            }
            
        }// close scroll view
        
    }//close body
    
}//clsoe struct

#Preview {
    AboutPageView()
}
