import 'package:flutter/material.dart';
import 'DeviceModel.dart';
import 'AddDeviceWindow.dart';
import 'DeviceInfoWindow.dart';
import 'UsersWindow.dart';
import 'SettingsWindow.dart';


void main() {
  runApp(
    const MaterialApp(
      home: AdminPanel(), 
    ),
  );
}

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  bool _showSidebar = false;

  void _toggleSidebar() {
    setState(() {
      _showSidebar = !_showSidebar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent, // stopper appbaren med at skifte farve
        backgroundColor: const Color.fromARGB(255, 103, 187, 255),
        title: const Text('AHREM Administrator Panel'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _toggleSidebar,
        ),
      ),

      body: Row(
        children: [
          // Sidebar
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
                      MaterialPageRoute(builder: (builder) => const UsersWindow()),
                      );
                    },
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
                      MaterialPageRoute(builder: (builder) => const SettingsWindow()),
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
                    onPressed: () {
                      
                    },
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
              child: ItemList(), 
            ),
          ),
        ],
      ),
    );
  }
}


class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList>{
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var status = true;  
    var check = (status == true) ? 'device is running':'device is off';

    List<Device> devices = [
      Device(
        deviceName: 'Device 1',
        firmware: 'Firmware Version: 1.01',
        macAddress: '1A:2B:3C:4D:5E',
      ),
      Device(
        deviceName: 'Device 2',
        firmware: 'Firmware Version: 1.01',
        macAddress: '1E:A3:A1:E:69',
      ),
      Device(
        deviceName: 'Device 3',
        firmware: 'Firmware Version: 1.01',
        macAddress: '1R:12:R1:60:69',
      ),
      Device(
        deviceName: 'Device 4',
        firmware: 'Firmware Version: 1.0 (Update Available)',
        macAddress: '2R:2D:2E:4C:69',
      ),
      Device(
        deviceName: 'Device 5',
        firmware: 'Firmware Version: 1.01',
        macAddress: 'F4:A3:G0:G1:E6',
      ),
      Device(
        deviceName: 'Device 6',
        firmware: 'Firmware Version: 1.01',
        macAddress: 'F4:A3:G0:G1:A6',
      ),
    ];

    return Column(
      children: [
        const SizedBox(height: 90), // skub ned fra toppen
          Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 400,
            width: 800,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white, 
              border: Border.all(width: 5, color: Colors.black)),
              
            child: ListView.separated(
              controller: _scrollController,
              itemCount: devices.length,

              itemBuilder: (context, index) {
                final device = devices[index];
                return DeviceItem(
                deviceName: device.deviceName, 
                status: 'Device status: $check', 
                firmware: device.firmware, 
                macAdress: device.macAddress
                );
              },
              
              separatorBuilder: (context, index) => const Divider(
                color: Colors.black,
                thickness: 2,
                height: 1,
                indent: 8,
                endIndent: 10,          
              ),                      
            ),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (builder) => const AddDeviceWindow()),
              );
            }, 
          child: const Text("Add Device"))
      ],
    );      
  }
}

class DeviceItem extends StatelessWidget {
  final String deviceName;
  final String status;
  final String firmware;
  final String macAdress;
  
  const DeviceItem({
    super.key,
    required this.deviceName,
    required this.status,
    required this.firmware,
    required this.macAdress
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            color: Colors.grey[300],
            child: const Icon(
              Icons.phone_android,
              size: 40,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 16),
          Expanded( 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  deviceName,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 2),
                Text(status, style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 2),
                Text(firmware, style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 2),
                Text(macAdress, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => DeviceInfoWindow(
                  deviceName: deviceName,
                  firmware: firmware,
                  macAddress: macAdress,
                  status: status,
                  ),
                ),
              );
            },
            child: const Icon(Icons.info, color: Colors.black),
          ),
          const SizedBox(width: 10), // sizedbox efter button, så den ikke intersecter med scrollbar
        ],
      ),
    );
  }
}