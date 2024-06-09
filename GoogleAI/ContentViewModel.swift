//
//  ContentViewModel.swift
//  GoogleAI
//
//  Created by Sonali Bhattacharjee on 6/6/24.
//

import Foundation
import GoogleGenerativeAI
import AVFoundation
import Speech

enum APIKey {
    static var `default`: String {
        guard let filePath = Bundle.main.path(forResource: "GenerativeAI-Info", ofType: "plist") else {
            fatalError("Couldn't find file GenerativeAI-Info.plist")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
            fatalError("Couldn't find key 'API_KEY' in 'GenerativeAI-Info.plist'.")
        }
        
        if value.starts(with: "_") {
            fatalError("Follow the instructions at https://ai.google.dev/tutorials/setup to get an API key.")
        }
        return value
    }
}


@MainActor
class ContentViewModel: ObservableObject {
    @Published var aiResponse: String = ""
    @Published var textInput: String = ""
    @Published var errorMessage: String = ""
    @Published var isRecording: Bool = false
    private var speechRecognizer: SpeechRecognizer?
    private var timer: Timer?
    
    let model = GenerativeModel(name: "gemini-pro", apiKey: APIKey.default)


    init() {
        self.speechRecognizer = SpeechRecognizer()
    }

    func sendMessage() {
        guard !textInput.isEmpty else { return }
                
                Task {
                    do {
                        let initialPrompt = "Provide a simple and clear response suitable for a middle school child with autism in a conversation. The input you get is the other person speaking first, then the user will speak, alternating. Respond in a way that keeps the conversation going. Don't display the other people's statements, just give the user's sample response: \(textInput)"
                        let response = try await model.generateContent(initialPrompt)
                        
                        if let text = response.text {
                            aiResponse = customizeResponse(for: textInput, response: text)
                            textInput = ""
                            print("sending to web app")
                            sendToWebApp(response: aiResponse)
                        } else {
                            errorMessage = "Sorry, I could not process that. Please try again."
                        }
                    } catch {
                        errorMessage = "Something went wrong! \(error.localizedDescription)"
                    }
                }

    }

    func startRecording() {
        do {
            try speechRecognizer?.startTranscribing()
            isRecording = true
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func stopRecording() {
        speechRecognizer?.stopTranscribing()
        isRecording = false
        if let transcript = speechRecognizer?.transcript {
            textInput = transcript
            sendMessage()
        }
    }
    
    private func startSendingMessages() {
        // Start a timer to periodically check for questions and send messages
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            if let transcript = self.speechRecognizer?.transcript {
                if transcript.contains("what") {
                    print("detected question")
                    self.sendMessage()
                }
            }
        }
    }
    
    private func stopSendingMessages() {
        // Stop the timer
        timer?.invalidate()
        timer = nil
    }
    
    func customizeResponse(for input: String, response: String) -> String {
           var customizedResponse = response
           customizedResponse = customizedResponse.replacingOccurrences(of: "I'm", with: "I am")
           return customizedResponse
       }
       
    func sendToWebApp(response: String) {
       guard let url = URL(string: "http://10.11.129.253:5050/api/response") else {
           print("Invalid URL")
           return
       }
       
       var request = URLRequest(url: url)
       request.httpMethod = "POST"
       request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print(request)
       
       let body: [String: Any] = ["response": response]
       
       do {
           request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
       } catch {
           print("Failed to serialize JSON: \(error.localizedDescription)")
           return
       }
        
        print("Sending request to URL: \(url)")
            print("Request headers: \(request.allHTTPHeaderFields ?? [:])")
            if let body = request.httpBody {
                print("Request body: \(String(data: body, encoding: .utf8) ?? "Unable to encode body to string")")
            }
       
       URLSession.shared.dataTask(with: request) { data, response, error in
           print("here")
           if let error = error {
               print("Failed to send request: \(error.localizedDescription)")
               return
           }
           
           if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
               print("Response successfully sent to web application.")
           } else {
               print("Failed to send response to web application.")
           }
       }.resume()
   }

}
