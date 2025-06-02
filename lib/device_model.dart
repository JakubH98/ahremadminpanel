class Device {
  final int? deviceId;
  final bool isActive;
  final String deviceName;
  final String firmware;
  final String macAddress;

  Device({
    this.deviceId,
    required this.isActive,
    required this.deviceName,
    required this.firmware,
    required this.macAddress,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      deviceId: json['deviceId'],
      isActive: json['isActive'],
      deviceName: json['deviceName'],
      firmware: json['firmware'],
      macAddress: json['macAddress'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'isActive': isActive,
      'deviceName': deviceName,
      'firmware': firmware,
      'macAddress': macAddress,
    };
  }
}
