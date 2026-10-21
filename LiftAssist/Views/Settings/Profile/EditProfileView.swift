
import SwiftUI

struct EditProfileView: View {

    @Environment(\.dismiss) private var dismiss

    // Values passed in from ProfileView
    @Binding var username: String
    @Binding var weight: String
    @Binding var height: String

    // Temporary values while editing
    @State private var draftUsername = ""
    @State private var draftWeight = ""
    @State private var draftHeight = ""

    var body: some View {
        NavigationStack {
            Form {

                Section("Account Information") {
                    TextField("Username", text: $draftUsername)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                }

                Section("Personal Information") {
                    HStack {
                        Text("Weight")
                        Spacer()
                        TextField("Weight", text: $draftWeight)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                        Text("lbs")
                            .foregroundStyle(.secondary)
                    }

                    HStack {
                        Text("Height")
                        Spacer()
                        TextField("Height (ex: 5'8\")", text: $draftHeight)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)

            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        username = draftUsername.trimmingCharacters(in: .whitespacesAndNewlines)
                        weight = draftWeight.trimmingCharacters(in: .whitespacesAndNewlines)
                        height = draftHeight.trimmingCharacters(in: .whitespacesAndNewlines)

                        dismiss()
                    }
                    .disabled(
                        draftUsername.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
                        draftWeight.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
                        draftHeight.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
                        Double(draftWeight) == nil ||
                        (Double(draftWeight) ?? 0) <= 0
                    )
                }
            }

            .onAppear {
                draftUsername = username
                draftWeight = weight
                draftHeight = height
            }
        }
    }
}
