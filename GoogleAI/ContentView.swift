import SwiftUI
import AVFoundation
import GoogleGenerativeAI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        VStack {
            ScrollView {
                Text(viewModel.aiResponse)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .padding()
            
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            HStack {
                TextField("Enter a message", text: $viewModel.textInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: viewModel.sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .padding()
                }
            }
            .padding()
            
            HStack {
                Button(viewModel.isRecording ? "Stop Recording" : "Start Recording") {
                    if viewModel.isRecording {
                        viewModel.stopRecording()
                    } else {
                        viewModel.startRecording()
                    }
                }
                .padding()
                .background(viewModel.isRecording ? Color.red : Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    ContentView()
}
