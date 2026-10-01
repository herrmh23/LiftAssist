import SwiftUI

struct PrivacyInfoView: View {
    
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            Color.white
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // MARK: - Header
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Privacy Policy")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.primary)
                        
                        Text("Last Updated: September 29, 2026")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    
                    Divider()
                    
                    // MARK: - Introduction
                    Text("""
                    LiftAssist respects your privacy. This Privacy Policy explains what information the app may access and how that information is used.
                    """)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .lineSpacing(4)
                    
                    
                    // MARK: - Information You Provide
                    TextSection(
                        title: "Information You Provide",
                        text: """
                        LiftAssist allows users to enter workout-related information, including workout names, exercises, sets, repetitions, weights, and workout history. This information is used to provide workout tracking and progress features within the app.
                        """
                    )
                    
                    
                    // MARK: - Location Information
                    TextSection(
                        title: "Location Information",
                        text: """
                        LiftAssist may request access to your device's location. Location access is used to support features such as saving your gym location and detecting when you are near your gym so that LiftAssist can remind you to track a workout.

                        LiftAssist does not use location information for advertising or marketing purposes.
                        """
                    )
                    
                    
                    // MARK: - Notifications
                    TextSection(
                        title: "Notifications",
                        text: """
                        LiftAssist may request permission to send notifications. Notifications may be used to remind you to track a workout when appropriate.
                        """
                    )
                    
                    
                    // MARK: - Data Sharing
                    TextSection(
                        title: "Data Sharing",
                        text: """
                        LiftAssist does not sell your personal information to third parties.
                        """
                    )
                    
                    
                    // MARK: - Data Storage
                    TextSection(
                        title: "Data Storage",
                        text: """
                        Workout and app-related information may be stored on your device as necessary to provide LiftAssist's features.
                        """
                    )
                    
                    
                    // MARK: - Your Choices
                    TextSection(
                        title: "Your Choices",
                        text: """
                        You can control LiftAssist's access to features such as location and notifications through your device's Settings. Disabling certain permissions may prevent some LiftAssist features from functioning.
                        """
                    )
                    
                    
                    // MARK: - Changes to Privacy Policy
                    TextSection(
                        title: "Changes to This Policy",
                        text: """
                        This Privacy Policy may be updated if LiftAssist's features or data practices change.
                        """
                    )
                    
                    
                    // MARK: - Contact
                    TextSection(
                        title: "Contact",
                        text: """
                        If you have questions about this Privacy Policy, please contact the developer.
                        """
                    )
                    
                    Spacer(minLength: 30)
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}


// MARK: - Privacy Section Component




