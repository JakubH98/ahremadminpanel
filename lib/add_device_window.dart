import 'package:flutter/material.dart';

class AddDeviceWindow extends StatelessWidget {
  const AddDeviceWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new device'), 
        backgroundColor: Color.fromARGB(255, 103, 187, 255),
      ),
      body: Center(
        child: Container(
          width: 600,
          height: 470,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(width: 5, color: Colors.black)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Device name: '),
              const SizedBox(height: 3),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter device name',
                ),
              ),
              const SizedBox(height: 20),

              const Text('CO2 Threshold: '),
              const SizedBox(height: 3),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter CO2 threshold',
                ),
              ),
              const SizedBox(height: 20),

              const Text('Temperature Threshold: '),
              const SizedBox(height: 3),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter temperature threshold',
                ),
              ),
              const SizedBox(height: 20),

              const Text('Humidity Threshold: '),
              const SizedBox(height: 3),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter humidity threshold',
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                onPressed: () {}, 
                child: const Text("Add Device"))
              )
            ],
          )
        )
      ),
    );
  }
}