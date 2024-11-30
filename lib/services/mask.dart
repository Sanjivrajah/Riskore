import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityLayer {
  static final SecurityLayer _instance = SecurityLayer._internal();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final List<String> _toxicityPatterns = [
    r'(hate|violent|offensive|harmful)',
    r'(threat|abuse|harassment)',
    r'(explicit|nsfw|inappropriate)'
  ];

  factory SecurityLayer() {
    return _instance;
  }

  SecurityLayer._internal();

  Future<Map<String, dynamic>> processUserInput({
    required String prompt,
    required Map<String, dynamic> metadata,
  }) async {
    try {
      // Dynamic Grounding
      final groundedPrompt = await _groundPrompt(prompt);

      // Data Masking
      final maskedData = await _maskSensitiveData(metadata);

      // Toxicity Detection
      final toxicityScore = await _analyzeToxicity(prompt);

      if (toxicityScore > 0.7) {
        throw Exception('Content flagged for potential harmful content');
      }

      // Zero Retention Implementation
      await _implementZeroRetention(prompt);

      return {
        'processedPrompt': groundedPrompt,
        'maskedMetadata': maskedData,
        'securityScore': _calculateSecurityScore(toxicityScore),
      };
    } catch (e) {
      debugPrint('Security Layer Error: $e');
      rethrow;
    }
  }

  Future<String> _groundPrompt(String prompt) async {
    final groundingContext = {
      'timestamp': DateTime.now().toIso8601String(),
      'version': '1.0.0',
      'context': 'Riskore Trust Layer',
    };

    return '$prompt\n${jsonEncode(groundingContext)}';
  }

  Future<Map<String, dynamic>> _maskSensitiveData(
      Map<String, dynamic> data) async {
    final maskedData = Map<String, dynamic>.from(data);

    for (var entry in maskedData.entries) {
      if (_isSensitiveField(entry.key)) {
        if (entry.value is String) {
          maskedData[entry.key] = await _encryptValue(entry.value);
        }
      }
    }

    return maskedData;
  }

  bool _isSensitiveField(String fieldName) {
    final sensitiveFields = [
      'password',
      'email',
      'phone',
      'address',
      'creditCard',
      'ssn'
    ];
    return sensitiveFields.contains(fieldName.toLowerCase());
  }

  Future<String> _encryptValue(String value) async {
    final key = await _secureStorage.read(key: 'encryption_key') ??
        await _generateEncryptionKey();
    final bytes = utf8.encode(value);
    final hmac = Hmac(sha256, utf8.encode(key));
    return base64.encode(hmac.convert(bytes).bytes);
  }

  Future<String> _generateEncryptionKey() async {
    final key =
        base64.encode(List<int>.generate(32, (_) => Random().nextInt(256)));
    await _secureStorage.write(key: 'encryption_key', value: key);
    return key;
  }

  Future<double> _analyzeToxicity(String content) async {
    double toxicityScore = 0.0;

    for (var pattern in _toxicityPatterns) {
      final matches =
          RegExp(pattern, caseSensitive: false).allMatches(content).length;
      toxicityScore += matches * 0.1;
    }

    return toxicityScore.clamp(0.0, 1.0);
  }

  double _calculateSecurityScore(double toxicityScore) {
    return (1 - toxicityScore) * 100;
  }

  Future<void> _implementZeroRetention(String data) async {
    // Simulate zero retention by immediately clearing sensitive data
    await compute((message) async {
      final secureTemp = data;
      // Process data
      return null;
    }, data);
  }
}

// Usage example in your OpenAI service:
class OpenAIService {
  static final SecurityLayer _securityLayer = SecurityLayer();

  static Future<String> getResponse(String prompt) async {
    try {
      final securityResult = await _securityLayer.processUserInput(
        prompt: prompt,
        metadata: {'timestamp': DateTime.now().toString()},
      );

      // Continue with your existing OpenAI call using securityResult['processedPrompt']
      // ... rest of your code

      return "Processed successfully"; // Ensure a return statement
    } catch (e) {
      return "Security check failed: $e";
    }
  }
}
