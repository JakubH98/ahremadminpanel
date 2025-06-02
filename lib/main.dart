import 'package:flutter/material.dart';
import 'device_model.dart';
import 'add_device_window.dart';
import 'device_info_window.dart';
import 'users_window.dart';
import 'settings_window.dart';
import 'http_service.dart';



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
                    onPressed: null,
                    icon: const Icon(Icons.dashboard),
                    label: const Text('Dashboard'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 83, 160, 220),
                      foregroundColor: Colors.black,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      elevation: 2,
                    ),
                  ),
                  const SizedBox(height: 10),
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
                      elevation: 2,
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
                      elevation: 2,
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
                      elevation: 2,
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

class _ItemListState extends State<ItemList> {
  final ScrollController _scrollController = ScrollController();
  final HttpService httpService = HttpService();

  List<Device> devices = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadDevices();
  }

  Future<void> loadDevices() async {
    try {
      final fetchedDevices = await httpService.fetchDevices();
      setState(() {
        devices = fetchedDevices;
        isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        const SizedBox(height: 90),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 400,
            width: 800,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              border: Border.all(width: 5, color: Colors.black),
            ),
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    controller: _scrollController,
                    itemCount: devices.length,
                    itemBuilder: (context, index) {
                      final device = devices[index];
                      return DeviceItem(
                        deviceName: device.deviceName,
                        firmware: device.firmware,
                        macAdress: device.macAddress,
                        status: device.isActive ? 'Device status: running':'Device status: off',
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
          child: const Text("Add Device"),
        ),
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