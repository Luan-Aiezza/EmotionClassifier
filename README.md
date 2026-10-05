# EmotionClassifier

A small **macOS** app that classifies the emotion of a text using **Natural Language Processing** and a **Core ML** model trained with **Create ML**. Type a sentence, tap **Analyze Emotion** and get the result as an emoji.

## How it works

1. A text classifier (`SentimentAnalysisModel.mlmodel`) was trained in Create ML with static word embeddings. It takes a text as input and returns a label.
2. The labels are the six emotions `joy`, `love`, `surprise`, `fear`, `anger` and `sadness`.
3. The SwiftUI app loads the model, runs `prediction(text:)` on the input and maps the label to an emoji:

| Emotion labels | Result |
| --- | --- |
| joy, love, surprise | 😄 |
| fear, anger, sadness | 😢 |
| anything else, or a prediction error | ❓ |

So the app currently shows a positive or negative reaction rather than the exact emotion.

## Tech stack

![Swift](https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=swift&logoColor=white) ![SwiftUI](https://img.shields.io/badge/SwiftUI-007AFF?style=for-the-badge&logo=swift&logoColor=white) ![CoreML](https://img.shields.io/badge/CoreML-34C759?style=for-the-badge&logo=apple&logoColor=white) ![CreateML](https://img.shields.io/badge/CreateML-5856D6?style=for-the-badge&logo=apple&logoColor=white) ![Xcode](https://img.shields.io/badge/Xcode-147EFB?style=for-the-badge&logo=xcode&logoColor=white)

## Project structure

```
EmotionClassifier/EmotionClassifier
├── EmotionClassifierApp.swift     App entry point
├── ContentView.swift              UI, model loading and prediction
└── SentimentAnalysisModel.mlmodel Core ML text classifier
```

## Running the project

Requirements: a Mac with Xcode, running **macOS 15.2 or later**.

1. Clone the repository:
   ```bash
   git clone https://github.com/Luan-Aiezza/EmotionClassifier.git
   ```
2. Open `EmotionClassifier/EmotionClassifier.xcodeproj` in Xcode.
3. Select the **My Mac** destination and press **Run** (⌘R).
4. Type a sentence in English and tap **Analyze Emotion**.

## Author

[Luan Aiezza](https://github.com/Luan-Aiezza)
