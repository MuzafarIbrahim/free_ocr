// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;

// class OCRService {
//   final String serverUrl;

//   OCRService({required this.serverUrl});

//   Future<String> uploadImage(File imageFile) async {
//     var request = http.MultipartRequest('POST', Uri.parse(serverUrl));
//     request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));

//     var streamedResponse = await request.send();
//     var response = await http.Response.fromStream(streamedResponse);

//     if (response.statusCode == 200) {
//       final jsonResponse = json.decode(response.body);
//       return jsonResponse['TextResult'] ?? "No text found";
//     } else {
//       throw Exception("Server error: ${response.statusCode} ${response.body}");
//     }
//   }
// }
