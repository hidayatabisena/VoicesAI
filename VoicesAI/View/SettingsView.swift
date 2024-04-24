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
                    TextField("ElevenLabs Key", text: $elevenLabsKey)
                } header: {
                    Text("API KEYS")
                } footer: {
                    Text("Please input your API Key above.")
                }
                
                // MARK: - LINK
                Section {
                    Link("GET API KEY GEMINI AI", destination: URL(string: signUpGemini)!)
                    
                    Link("GET API KEY ELEVENLABS", destination: URL(string: signUpElevenLabs)!)
                    
                } header: {
                    Text("Dont have API Key?")
                } footer: {
                    Text("Sign up to get your own api key via link above")
                }

            }
            .navigationTitle("Configuration")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    
                } label: {
                    Text("Save")
                        .padding(.trailing, 8)
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
