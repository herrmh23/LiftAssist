import SwiftUI

struct SettingsView: View {
    // Environment property for legal modal views or link dismissal
    @Environment(\.dismiss) private var dismiss
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
    let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 28) {
                    
                    //MARK: - Title
                    Text("Settings")
                        .font(.title2)
                        .fontWeight(.bold)
                    

                    // MARK: - 2. INTERACTIVE ROWS (Form-Style List Alternative)
                    VStack(spacing: 0) {
                        
                        
                        
                        NavigationLink {
                            ProfileView() // 👈 Replace with the actual name of your destination View
                        } label: {
                            HStack(spacing: 14) {
                                Image(systemName: "person.circle")
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.white)
                                    .frame(width: 32, height: 32)
                                    .background(Color.blue.gradient)
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                
                                Text("Profile")
                                    .font(.body)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(.tertiary)
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 16)
                        }
                        Divider().padding(.leading, 54)
                        
                        
                        
                        
                        NavigationLink {
                            PrivacyInfoView() // 👈 Replace with the actual name of your destination View
                        } label: {
                            HStack(spacing: 14) {
                                Image(systemName: "lock.shield")
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.white)
                                    .frame(width: 32, height: 32)
                                    .background(Color.green.gradient)
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                
                                Text("Privacy Policy")
                                    .font(.body)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(.tertiary)
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 16)
                        }
                        Divider().padding(.leading, 54)
                        
                        
                        
                        
                        NavigationLink {
                            TermsOfServiceView() // 👈 Replace with the actual name of your destination View
                        } label: {
                            HStack(spacing: 14) {
                                Image(systemName: "doc.text")
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.white)
                                    .frame(width: 32, height: 32)
                                    .background(Color.green.gradient)
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                
                                Text("Terms of Service")
                                    .font(.body)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(.tertiary)
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 16)
                        }
                        Divider().padding(.leading, 54)
                        
                        
                        
                        
                        
                        
                        NavigationLink {
                            AboutPageView() // 👈 Replace with the actual name of your destination View
                        } label: {
                            HStack(spacing: 14) {
                                Image(systemName: "info.circle")
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.white)
                                    .frame(width: 32, height: 32)
                                    .background(Color.yellow.gradient)
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                
                                Text("About")
                                    .font(.body)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(.tertiary)
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 16)
                        }
                        Divider().padding(.leading, 54)
                        
                        
                        
                        
                        
                        NavigationLink {
                            HelpView() // 👈 Replace with the actual name of your destination View
                        } label: {
                            HStack(spacing: 14) {
                                Image(systemName: "questionmark.circle")
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.white)
                                    .frame(width: 32, height: 32)
                                    .background(Color.red.gradient)
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                
                                Text("Help")
                                    .font(.body)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(.tertiary)
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 16)
                        }

                        
         
                        
                    }
                    .background(Color(uiColor: .secondarySystemGroupedBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .padding(.horizontal, 16)
                    
                    
                    
                    
                    
                    
                    
                   
                    
                    
                    
                    
                    
                    

                }
            }
            .background(Color(uiColor: .systemGroupedBackground))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - PREVIEW PROVIDER
#Preview {
    SettingsView()
}


