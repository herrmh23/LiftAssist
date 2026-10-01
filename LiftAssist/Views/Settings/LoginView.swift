import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Spacer()
                
                // MARK: - Logo
                Image("LiftAssistHeader")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300)
                    .padding(.horizontal, 30)
                
                // MARK: - Welcome Text
                VStack(spacing: 5) {
                    Text("Welcome Back")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Log in to continue tracking your progress")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                // MARK: - Login Fields
                VStack(alignment: .leading, spacing: 8) {
                    Text("Username")
                        .font(.headline)
                    
                    TextField("Enter your username", text: $email)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(Color.gray.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Text("Password")
                        .font(.headline)
                        .padding(.top, 5)
                    
                    SecureField("Enter your password", text: $password)
                        .padding()
                        .background(Color.gray.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal, 30)
                
                // MARK: - Login Button
                Button {
                    print("logged in")// Login functionality will be added later
                } label: {
                    Text("Log In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding(.horizontal, 30)
                
                // MARK: - Divider
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.4))
                    
                    Text("or")
                        .foregroundColor(.gray)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.4))
                }
                .padding(.horizontal, 30)
                
                // MARK: - Sign Up Button
                NavigationLink{
                    SignUpView()
                } label: {
                    Text("Create Account")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.black, lineWidth: 1.5)
                        )
                }
                .padding(.horizontal, 30)
                
                Spacer()
                
                // MARK: - Footer
                Text("By continuing, you agree to our Terms of Service and Privacy Policy.")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 10)
            }
            .background(Color.white)
            .foregroundColor(.black)
        }
    }
}

#Preview {
    LoginView()
}
