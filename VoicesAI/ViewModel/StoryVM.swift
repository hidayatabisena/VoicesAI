//
//  StoryVM.swift
//  VoicesAI
//
//  Created by Hidayat Abisena on 25/04/24.
//

import Foundation
import GoogleGenerativeAI

@MainActor
class StoryVM: ObservableObject {
    @Published var storyText = ""
    @Published var displayedStoryText = "" // display typewriting effect
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var timer: Timer?
    
    // MARK: - GENERATE STORY
    func generateStory(topic: Topics, mood: Mood) async {
        isLoading = true
        defer { isLoading = false }
        errorMessage = nil
        storyText = ""
        
        let apiKey = UserDefaults.standard.string(forKey: "GeminiAIKey") ?? ""
        
        guard !apiKey.isEmpty else {
            errorMessage = "API Key is missing. Please set it in Settings page!"
            return
        }
        
        let model = GenerativeModel(name: "gemini-pro", apiKey: apiKey)
        let topicString = topic.rawValue
        let moodString = mood.rawValue
        print("\(topicString) - \(moodString)")
        
        let prompt = "Tuliskan kutipan tentang \(topicString) dengan mood emosi \(moodString). Maksimal terdiri dari 40 kata. Dan tidak ada kaitannya dengan seksualitas!"
        
        do {
            let response = try await model.generateContent(prompt)
            if let text = response.text {
                storyText = text
                startTypewriterEffect()
            }
        } catch {
            errorMessage = "Failed to generate story: \(error.localizedDescription)"
        }
    }
    
    // MARK: - TYPEWRITER EFFECT
    func startTypewriterEffect() {
        var charIndex = 0
        
        DispatchQueue.main.async {
            self.displayedStoryText = ""
        }
       
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { [weak self] timer in
            guard let self = self, charIndex < self.storyText.count else {
                timer.invalidate()
                return
            }
            
            DispatchQueue.main.async {
                let index = self.storyText.index(self.storyText.startIndex, offsetBy: charIndex)
                self.displayedStoryText += String(self.storyText[index])
                charIndex += 1
            }
        }
    }
}
