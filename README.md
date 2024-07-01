# Virtual Teleprompter App
## Table of Contents
### Introduction
This project is a Swift-based virtual teleprompter app designed to enhance social communication for individuals with autism by providing real-time speech-to-text transcription and AI-generated responses. The app leverages Apple AVFoundation and SFSpeechRecognizer libraries for speech recognition and integrates with Google Generative AI for generating appropriate responses.

### Features
- Real-time Speech-to-Text:
- AI-generated Responses
- Voice Commands
- User-Friendly Interface

### Installation
1. Clone the repository with git clone https://github.com/yourusername/virtual-teleprompter.git
2. Open the folder in XCode
3. Install all necessary dependencies by going to File -> Packages -> Resolve Package Versions in XCode
4. Obtain an API Key from Google Generative AI and put that as the value for 'API_KEY' in a file 'GenerativeAI-Info.plist'

### Usage
1. Running the app
2. Starting and stopping transcription
3. Sending messages

### Configuration
- API Key
Ensure the 'GenerativeAI-Info.plist' file is correctly set up with your Google Generative AI API key.

- Permissions
This app requires microphone and speech recognition permissions. Make sure these are granted in the device settings.

### Dependencies
- SwiftUI
- AVFoundation
- SFSpeechRecognizer
- GoogleGenerativeAI

### Contact
Developer: Lena Ray
Email: lenarayca@gmail.com
GitHub: lenaray
