import 'package:dart_openai/dart_openai.dart';

class OpenAIService {
  static bool _isInitialized = false;

  static void initialize() {
    if (!_isInitialized) {
      OpenAI.apiKey =
          "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"; // Replace with your actual OpenAI API key
      _isInitialized = true;
    }
  }

  static Future<String> getResponse(String prompt) async {
    initialize();

    try {
      final chatCompletion = await OpenAI.instance.chat.create(
        model: "gpt-3.5-turbo",
        messages: [
          OpenAIChatCompletionChoiceMessageModel(
            content: [
              OpenAIChatCompletionChoiceMessageContentItemModel.text(prompt)
            ],
            role: OpenAIChatMessageRole.user,
          ),
        ],
      );

      final content = chatCompletion.choices.first.message.content;
      if (content != null && content.first.text != null) {
        return content.first.text!;
      }
      return "No response generated";
    } catch (e) {
      return "Error generating response: $e";
    }
  }
}
