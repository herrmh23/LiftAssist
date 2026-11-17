import SwiftUI

struct TermsOfServiceView: View {
    // Xcode 27 leverages the @State macro instead of property wrappers
    // for seamless lazy evaluation and minimal view redraws.
    @State private var hasScrolledToBottom = false
    @State private var isAccepted = false
    @Environment(\.dismiss) private var dismiss
    

    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Header
            VStack(spacing: 8) {
                Image(systemName: "doc.plaintext.fill")
                    .font(.system(size: 42))
                    .foregroundStyle(.tint)
                
                Text("Terms of Service")
                    .font(.title.bold())
                
                Text("Please review and accept our guidelines before continuing.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 28)
            .padding(.horizontal)
            
            // MARK: - Terms Content
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("1. Acceptance of Terms")
                        .font(.headline)
                    Text("By utilizing this application, you natively agree to adhere to all system protocols, guidelines, and localized regulations defined herein...")
                        .font(.body)
                        .foregroundStyle(.secondary)
                    
                    Text("2. User Responsibilities")
                        .font(.headline)
                    Text("You agree to use this application safely and legally. Any manipulation of system APIs or framework boundaries is strictly unauthorized...")
                        .font(.body)
                        .foregroundStyle(.secondary)
                    
                    Text("3. Privacy & Intelligence Data")
                        .font(.headline)
                    Text("On-device models process parameters securely. External network calls comply fully with our overarching infrastructure encryption architectures.")
                        .font(.body)
                        .foregroundStyle(.secondary)
                    
                    // Visual anchor checking for progression
                    Color.clear
                        .frame(height: 1)
                        .onAppear {
                            withAnimation(.easeIn) {
                                hasScrolledToBottom = true
                            }
                        }
                }
                .padding()
            }
            .glassEffect(.regular, in: .rect(cornerRadius: 16)) // Replaces old material shapes using iOS 27 Liquid Glass
            .padding()
            
            // MARK: - Footer Actions
            VStack(spacing: 16) {
                Toggle(isOn: $isAccepted) {
                    Text("I have read and agree to the [Terms of Service](https://example.com) and [Privacy Policy](https://example.com).")
                        .font(.footnote)
                }
                .toggleStyle(CheckboxToggleStyle())
                .disabled(!hasScrolledToBottom)
                
                HStack(spacing: 12) {
                    Button(role: .cancel) {
                        dismiss()
                    } label: {
                        Text("Decline")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    
                    Button {
                        // Handle acceptance progression
                        dismiss()
                    } label: {
                        Text("Accept & Continue")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(!isAccepted)
                }
                .buttonSizing(.flexible)
                
//                //Secret button to clear all of my test case workouts
//                Button {
//                    WorkoutStore().clearAllWorkouts()
//                } label: {
//                    Text("Clear all workouts (for demo use only)")
//                        .frame(maxWidth: .infinity)
//                }
//                .buttonStyle(.borderedProminent)
//                
//                //Button to load demo workouts (for demo use only)
//                Button("Load Demo Workouts") {
//                    SampleWorkoutData.replaceWithDemoWorkouts()
//                }
//                .buttonStyle(.borderedProminent)
                
                
            }
            .padding(.horizontal)
            .padding(.bottom, 24)
        }
    }
}

// MARK: - Custom Checkbox Style
struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack(alignment: .top, spacing: 10) {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 20))
                    .foregroundStyle(configuration.isOn ? AnyShapeStyle(.tint) : AnyShapeStyle(.secondary))
                
                configuration.label
                    .foregroundStyle(.primary)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    TermsOfServiceView()
}
