# Virtual Teleprompter App
## Introduction
This project is a Swift-based virtual teleprompter app designed to enhance social communication for individuals with autism by providing real-time speech-to-text transcription and AI-generated responses. The app leverages Apple AVFoundation and SFSpeechRecognizer libraries for speech recognition and integrates with Google Generative AI for generating appropriate responses.

## Features
- Real-time Speech-to-Text Transcription
- AI-generated Prompts & Responses
- Wi-Fi Connected Flask Web App for Desktop Teleprompter
- User-Friendly Interface

Video Demo: https://youtu.be/s4FN7qr7FUI

## Installation
1. Clone the repository with git clone https://github.com/yourusername/virtual-teleprompter.git
2. Open the folder in XCode
3. Install all necessary dependencies by going to File -> Packages -> Resolve Package Versions in XCode
4. Obtain an API Key from Google Generative AI and put that as the value for 'API_KEY' in a file 'GenerativeAI-Info.plist'

## Usage
1. Run the app either on the XCode Simulator or on your connected iPhone.
3. Grant necessary permissions.
4. Run Flask web app version of virtual teleprompter.
5. Press start recording button for transcription & communication with Google AI to begin.
6. Refer to sample prompts & responses.

## Configuration
- API Key
Ensure the 'GenerativeAI-Info.plist' file is correctly set up with your Google Generative AI API key.

- Permissions
This app requires microphone and speech recognition permissions. Make sure these are granted in the device settings. You will be prompted to allow access upon initial installation of the app.

## Dependencies
- SwiftUI
- AVFoundation
- SFSpeechRecognizer
- GoogleGenerativeAI

## Contact
Developer: Lena Ray

Email: lenarayca@gmail.com

GitHub: lenaray
