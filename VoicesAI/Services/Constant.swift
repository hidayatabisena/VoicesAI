//
//  Constant.swift
//  VoicesAI
//
//  Created by Hidayat Abisena on 24/04/24.
//

import Foundation

struct Constant {
    static let baseURL = "https://api.elevenlabs.io/"
    static let appVersion = "v1"
    
    enum Endpoint: String {
        case textToSpeech = "text-to-speech"
        case speechToSpeech = "speech-to-speech"
    }
    
    enum VoiceID: String {
        case maya = "i3q61eqUw3XjuliwnrPj"
        case thomas = "GBv7mTt0atIp3Br8iCZE"
    }
    
    /// let urlString = Constant.fullURL(forVoice: .thomas)
    /// https://api.elevenlabs.io/v1/text-to-speech/GBv7mTt0atIp3Br8iCZE
    static func fullURL(forVoice voice: VoiceID) -> String {
        let results = baseURL + appVersion + "/" + Endpoint.textToSpeech.rawValue + "/" + voice.rawValue
        
        return results
    }
}
