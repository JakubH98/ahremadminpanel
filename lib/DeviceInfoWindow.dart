import 'package:flutter/material.dart';

class DeviceInfoWindow extends StatelessWidget {
  final String deviceName;
  final String firmware;
  final String macAddress;
  final String status;

  const DeviceInfoWindow({
    super.key,
    required this.deviceName,
    required this.firmware,
    required this.macAddress,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device information'),
        backgroundColor: Color.fromARGB(255, 103, 187, 255),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 600,
          height: 500,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(width: 5, color: Colors.black),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Device Name: $deviceName'),
              SizedBox(height: 10),
              Text('Firmware: $firmware'),
              SizedBox(height: 10),
              Text('MAC Address: $macAddress'),
              SizedBox(height: 10),
              Text(status),
              SizedBox(height: 10),
              Text('CO2 Threshold: ', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('Temperature Threshold: ', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('Humidity Threshold: ', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}