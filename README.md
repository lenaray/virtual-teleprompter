# Virtual Teleprompter App
## Introduction
This project is a Swift-based virtual teleprompter app designed to enhance social communication for individuals with autism by providing real-time speech-to-text transcription and AI-generated responses. The app leverages Apple AVFoundation and SFSpeechRecognizer libraries for speech recognition and integrates with Google Generative AI for generating appropriate responses.

## Features
- Text or Audio Input Capabilities
The app takes either text or audio input. For text input, the user can type into the text box at the bottom and the Google AI response appears at the top of the screen. For audio input, the user can press the Start Recording button at the bottom, which transcribes audio input to text before sending it to Google AI.

- Real-time Speech-to-Text Transcription
The app continuously listens to audio input and transcribes it to text that is sent to Google AI periodically (every seven seconds as of now) to get responses that evolve and are tailored to the ongoing conversation. The transcribed text appears in the text box at the bottom allowing the user to edit it if needed before it is sent to Google AI.

- AI-generated Prompts & Responses
Leveraging Google AI, the app generates contextually relevant prompts and responses based on the user's input. With some prompt engineering by an initial prompt that tells Google AI the context for the app's audio input, the app receives suggested responses for questions that are detected within the conversation as well as ways to keep the conversation flowing.

- Wi-Fi Connected Flask Web App for Desktop Teleprompter
This feature transforms the app into a desktop teleprompter via a Wi-Fi connected Flask web application. As long as users are on the same Wi-Fi on their mobile and desktop devices, the AI prompts / responses sent to their mobile phones will also be sent to their desktop computers, facilitating better virtual conversations (ie Zoom calls).

- User-Friendly Interface
The app is designed with a focus on simplicity and ease of use. It features a text box at the bottom for text input, a Start / Stop Recording button for audio input and space for AI prompts above, ensuring that users of all ages and technical skills can navigate and use the app effortlessly.

Video Demo: https://youtu.be/s4FN7qr7FUI

## Installation
1. Clone the repository with git clone https://github.com/yourusername/virtual-teleprompter.git
2. Open the folder in XCode
3. Install all necessary dependencies by going to File -> Packages -> Resolve Package Versions in XCode
4. Obtain an API Key from Google Generative AI and put that as the value for 'API_KEY' in a file 'GenerativeAI-Info.plist'

## Usage
1. Run the app either on the XCode Simulator or on your connected iPhone.
3. Grant necessary permissions.
4. Run Flask web app version of virtual teleprompter with ```python3 test.py```. The debug output shows what the web app is receiving.
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
