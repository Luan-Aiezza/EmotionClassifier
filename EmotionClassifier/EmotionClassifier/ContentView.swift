import SwiftUI
import CoreML

struct ContentView: View {
    @State private var inputText: String = ""
    @State private var predictedEmotion: String = ""
    
    let model: SentimentAnalysisModel
    
    init() {
        do {
            let config = MLModelConfiguration()
            self.model = try SentimentAnalysisModel(configuration: config)
        } catch {
            fatalError("Erro ao carregar o modelo ML: \(error)")
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Análise Sentimental")
                .font(.largeTitle)
                .bold()
            
            TextField("Digite seu texto aqui...", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Analisar Emoção") {
                predictSentiment()
            }
            .buttonStyle(.borderedProminent)
            
            Text("Emoção prevista: \(predictedEmotion)")
                .font(.title2)
                .bold()
        }
        .padding()
    }
    
    func predictSentiment() {
        let prediction = try? model.prediction(text: inputText)
        predictedEmotion = prediction?.label ?? "Erro na previsão"
    }
}

@main
struct SentimentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
