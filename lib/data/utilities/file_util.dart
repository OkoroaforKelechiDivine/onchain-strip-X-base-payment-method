import 'dart:convert';
import 'dart:typed_data';

Uint8List processImage(String base64Image) {
  // Check if the base64 string contains the proper metadata
  if (base64Image.contains('data:image')) {
    final data = base64Image.split(',').last;

    return base64.decode(data);
  } else {
    return base64.decode(base64Image);
  }
}
