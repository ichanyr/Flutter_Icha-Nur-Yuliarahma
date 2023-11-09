import 'dart:convert';

import 'package:open_ai/constants/open_ai.dart';
import 'package:open_ai/models/openai_model.dart';
import 'package:open_ai/models/usage_model.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class RecommendationService {
  static Future<GPTData> getRecommendation({
    required String phoneRegion,
    required String price,
    required String camera,
    required String internalStorageCapacity,
    required String storage,
  }) async {
    late GPTData gptData = GPTData(
        id: '',
        object: '',
        created: 0,
        model: '',
        choices: [],
        usage: UsageData(
          promptTokens: 0,
          completionTokens: 0,
          totalTokens: 0,
        ));

    try {
      var url = Uri.parse('https://api.openai.com/v1/completions');

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey'
      };

      final formatCurrency = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp ',
        decimalDigits: 0,
      );

      String phonePrice = formatCurrency.format(int.parse(price));

      String promptData =
          'You are a phone expert. Please give me a phone recommendation from ${phonePrice.toLowerCase()} manufacturers with price equals to $phonePrice';

      final data = jsonEncode({
        'model': 'text-davinci-003',
        'prompt': promptData,
        'temperature': 0.7,
        'max_tokens': 200,
        'top_p': 1,
        'frequency_penalty': 0,
        'presence_penalty': 0
      });

      var response = await http.post(
        url,
        headers: headers,
        body: data,
      );
      if (response.statusCode == 200) {
        gptData = gptDataFromJson(response.body);
      }
    } catch (e) {
      print(e);
    }
    return gptData;
  }
}
