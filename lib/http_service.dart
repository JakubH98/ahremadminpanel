import 'dart:convert';
import 'package:http/http.dart' as http; 
import 'device_model.dart'; 

class HttpService {
  static const String url = 'http://localhost:5051'; 

  Future<List<Device>> fetchDevices() async {
    final response = await http.get(Uri.parse('$url/GetAllDevices'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Device.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load devices');
    }
  }

  Future<String> addDevice(Device device) async {
    final response = await http.post(
      Uri.parse('$url/AddDevice'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(device.toJson()),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to add device: ${response.statusCode}');
    }
  }
}