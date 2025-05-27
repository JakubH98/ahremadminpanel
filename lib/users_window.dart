import 'package:flutter/material.dart';
import 'settings_window.dart';
import 'main.dart';


class UsersWindow extends StatefulWidget {
  const UsersWindow({super.key});

  @override
  State<UsersWindow> createState() => _UsersWindowState();
  }

  class _UsersWindowState extends State<UsersWindow> {
    bool _showSidebar = true;

    void _toggleSidebar() {
      setState(() {
        _showSidebar = !_showSidebar;
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'), 
        backgroundColor: const Color.fromARGB(255, 103, 187, 255),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _toggleSidebar,
        ),
      ),
      
      body: Row(
        children: [
          if (_showSidebar)
            Container(
              width: 250,
              color: const Color.fromARGB(255, 83, 160, 220),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AdminPanel()),
                      );
                    },
                    icon: const Icon(Icons.dashboard),
                    label: const Text('Dashboard'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 83, 160, 220),
                      foregroundColor: Colors.black,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      elevation: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.person),
                    label: const Text('Users'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 83, 160, 220),
                      foregroundColor: Colors.black,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      elevation: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SettingsWindow()),
                      );
                    },
                    icon: const Icon(Icons.settings),
                    label: const Text('Settings'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 83, 160, 220),
                      foregroundColor: Colors.black,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      elevation: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.logout),
                    label: const Text('Log out'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 83, 160, 220),
                      foregroundColor: Colors.black,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      elevation: 1,
                    ),
                  ),
                ],
              ),
            ),

          Expanded(
            child: Center(
              child: Container(
                width: 500,
                height: 400,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(width: 5, color: Colors.black),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('TBD(list of users? with checkbox thingies?)'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}