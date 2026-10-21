import SwiftUI

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct ChatBotView: View {
    @State private var messages: [ChatMessage] = []
    @State private var userInput = ""
    @State private var isLoading = false
    @State private var errorMessage: String?

    var body: some View {
        VStack(spacing: 0) {

            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(messages) { message in
                            HStack {
                                if message.isUser {
                                    Spacer(minLength: 40)
                                }

                                Text(message.text)
                                    .padding(12)
                                    .background(
                                        message.isUser
                                        ? Color.blue
                                        : Color.gray.opacity(0.2)
                                    )
                                    .foregroundStyle(
                                        message.isUser
                                        ? Color.white
                                        : Color.primary
                                    )
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 12)
                                    )

                                if !message.isUser {
                                    Spacer(minLength: 40)
                                }
                            }
                            .id(message.id)
                        }

                        if isLoading {
                            SwiftUI.ProgressView("Thinking...")
                                .frame(maxWidth: .infinity,
                                       alignment: .leading)
                        }
                    }
                    .padding()
                }
                .onChange(of: messages.count) {
                    if let lastMessage = messages.last {
                        proxy.scrollTo(lastMessage.id,
                                       anchor: .bottom)
                    }
                }
            }

            if let errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
                    .font(.caption)
                    .padding(.horizontal)
            }

            HStack {
                TextField("Ask about your workout...",
                          text: $userInput)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        sendMessage()
                    }

                Button {
                    sendMessage()
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.title2)
                }
                .disabled(
                    userInput.trimmingCharacters(
                        in: .whitespacesAndNewlines
                    ).isEmpty || isLoading
                )
            }
            .padding()
        }
        .navigationTitle("LiftAssist AI")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func sendMessage() {
        let text = userInput.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard !text.isEmpty, !isLoading else {
            return
        }

        messages.append(
            ChatMessage(text: text, isUser: true)
        )

        userInput = ""
        errorMessage = nil
        isLoading = true

        Task {
            do {
                let response = try await ChatBotService().sendMessage(text)
                
                messages.append(ChatMessage(text: response, isUser: false))
            } catch {
                errorMessage = error.localizedDescription
            }
        }

        isLoading = false
    }
}

