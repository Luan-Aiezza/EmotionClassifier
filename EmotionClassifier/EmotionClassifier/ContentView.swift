import SwiftUI
import CoreML

struct ContentView: View {
    @State private var inputText: String = ""
    @State private var predictedEmotion: String = ""
    
    let emotionEmojis: [String: String] = [
        "fear": "😢",
        "joy": "😄",
        "love": "😄",
        "anger": "😢",
        "sadness": "😢",
        "surprise": "😄"
    ]
    
    let model: SentimentAnalysisModel
    
    init() {
        do {
            let config = MLModelConfiguration()
            self.model = try SentimentAnalysisModel(configuration: config)
        } catch {
            fatalError("Error loading ML model: \(error)")
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Sentiment Analysis")
                .font(.largeTitle)
                .bold()
            
            TextField("Enter your text here...", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Analyze Emotion") {
                predictSentiment()
            }
            .buttonStyle(.borderedProminent)
            
            Text("Expected emotion:")
                .font(.title2)
                .bold()
            
            Text("\(predictedEmotion)")
                .font(.largeTitle)
                .bold()
        }
        .padding()
    }
    
    func predictSentiment() {
        let prediction = try? model.prediction(text: inputText)
        let emotion = prediction?.label ?? "Forecast error"
        
        predictedEmotion = emotionEmojis[emotion] ?? "❓"
    }
}

struct SentimentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
