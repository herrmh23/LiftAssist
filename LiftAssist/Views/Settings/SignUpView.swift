import SwiftUI

struct SignUpView: View {
    
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // MARK: - Logo
                    Image("LiftAssistHeader")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                        .padding(.horizontal, 30)
                    
                    
                    // MARK: - Welcome Text
                    VStack(spacing: 5) {
                        Text("Welcome to Lift Assist")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Create an account to begine tracking your progress")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    
                    //MARK: - Sign Up fields
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Email")
                            .font(.headline)
                        
                        TextField("Enter your email", text: $email)
                            .textInputAutocapitalization(.never)
                            .padding()
                            .background(Color.gray.opacity(0.15))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Text("Username")
                            .font(.headline)
                        
                        TextField("Create your username", text: $username)
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
                        
                        Text("Confirm Password")
                            .font(.headline)
                            .padding(.top, 5)
                        
                        SecureField("Confirm your password", text: $password)
                            .padding()
                            .background(Color.gray.opacity(0.15))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(.horizontal, 30)
                    
                    //MARK: - Sign Up button
                    Button {
                        print("signed up")
                    } label: {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding(.horizontal, 30)
                    
                    
                    // MARK: - Footer
                    Text("By continuing, you agree to our Terms of Service and Privacy Policy.")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 10)

                    
                    
                    
                    
                    
                }
            }
        }
    }
}

#Preview {
    SignUpView()
}
