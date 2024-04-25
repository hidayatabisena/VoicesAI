//
//  SettingsView.swift
//  VoicesAI
//
//  Created by Hidayat Abisena on 24/04/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var geminiAIKey = ""
    @State private var elevenLabsKey = ""
    
    let signUpGemini = "https://ai.google.dev"
    let signUpElevenLabs = "https://elevenlabs.io/api"
    
    var body: some View {
        NavigationStack {
            Form {
                // MARK: - API KEY
                Section {
                    TextField("Gemini AI Key", text: $geminiAIKey)
                        .onAppear {
                            geminiAIKey = UserDefaults.standard.string(forKey: "GeminiAIKey") ?? ""
                        }
                    
                    TextField("ElevenLabs Key", text: $elevenLabsKey)
                        .onAppear {
                            elevenLabsKey =  UserDefaults.standard.string(forKey: "ElevenLabsAPIKey") ?? ""
                        }
                } header: {
                    Text("API KEYS")
                } footer: {
                    Text("Please input your API Key above.")
                }
                
                // MARK: - LINK
                Section {
                    Link("GET API KEY GEMINI AI", destination: URL(string: signUpGemini)!)
                        .foregroundStyle(.blue)
                    
                    Link("GET API KEY ELEVENLABS", destination: URL(string: signUpElevenLabs)!)
                        .foregroundStyle(.blue)
                    
                } header: {
                    Text("Dont have API Key?")
                } footer: {
                    Text("Sign up to get your own api key via link above")
                }

            }
            .navigationTitle("Configuration")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: - SAVE KEY
                Button {
                    saveKey()
                } label: {
                    Text("Save")
                }
                .padding(.trailing, 8)
                .disabled(geminiAIKey.isEmpty || elevenLabsKey.isEmpty)
            }
        }
    }
}

#Preview {
    SettingsView()
}

extension SettingsView {
    func saveKey() {
        UserDefaults.standard.set(geminiAIKey, forKey: "GeminiAIKey")
        UserDefaults.standard.set(elevenLabsKey, forKey: "ElevenLabsAPIKey")
    }
}
