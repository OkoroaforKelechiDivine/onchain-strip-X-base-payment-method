import 'package:dio/dio.dart';

class PasscodeApi {
  final Dio _dio = Dio();

  Future<void> savePasscode(String passcode) async {
    try {
      final response = await _dio.post(
        'https://dzbilqfc4qszv.cloudfront.net/auth/set_passcode',
        data: {
          'passcode':
          passcode
        },
      );

      if (response.statusCode == 200) {
        print('Passcode saved successfully');
      } else {
        print('Failed to save passcode. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error saving passcode: $e');
    }
  }
}
