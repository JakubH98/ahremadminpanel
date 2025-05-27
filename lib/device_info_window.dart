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
        backgroundColor: const Color.fromARGB(255, 103, 187, 255),
      ),

      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 700,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(width: 5, color: Colors.black),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Device Name: $deviceName'),
                const SizedBox(height: 10),
                Text('Firmware: $firmware'),
                const SizedBox(height: 10),
                Text('MAC Address: $macAddress'),
                const SizedBox(height: 10),
                Text(status),
                const SizedBox(height: 10),

                Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 300,
                    width: 500,
                    color: const Color.fromARGB(255, 211, 209, 209),
                    child: const Text('insert graph here'),
                  ),
                ),

                const SizedBox(height: 20),
                Text('Device statistics: '),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: null, 
                    child: Text('Edit device'),)
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}