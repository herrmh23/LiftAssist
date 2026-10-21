import SwiftUI

struct ChangePasswordView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    @State private var showAlert = false

    var body: some View {
        NavigationStack {
            Form {
                Section("Password") {
                    SecureField("Current password", text: $currentPassword)
                    SecureField("New password", text: $newPassword)
                    SecureField("Confirm new password", text: $confirmPassword)
                }
                Section {
                    Text("This is a UI demonstration. No password is saved or changed. A production app must use a secure authentication provider or backend, not UserDefaults.")
                        .font(.footnote).foregroundStyle(.secondary)
                }
                Button("Update Password") {
                    showAlert = true
                }
                    .disabled(currentPassword.isEmpty || newPassword.count < 8 || newPassword != confirmPassword)
            }
            .navigationTitle("Change Password")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { ToolbarItem(placement: .confirmationAction) { Button("Done") { dismiss() } } }
            .alert("Demo Only", isPresented: $showAlert) {
                Button("OK") {
                    currentPassword = "";
                    newPassword = "";
                    confirmPassword = "";
                    dismiss() }
            } message: { Text("No real account password was changed.") }
        }
    }
}
