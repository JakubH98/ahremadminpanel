import 'package:flutter/material.dart';


class SettingsWindow extends StatelessWidget {
  const SettingsWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'), 
        backgroundColor: Color.fromARGB(255, 103, 187, 255),
      ),
      body: Center(
        child: Container(
          width: 500,
          height: 400,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(width: 5, color: Colors.black)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [     
              const Text('TBD(idk what to put here yet)'),
            ],
          )
        )
      ),
    );
  }
}