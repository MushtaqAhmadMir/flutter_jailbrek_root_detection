import 'package:flutter/material.dart';
import 'package:safe_device/safe_device.dart';

// import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isJailBroken = false;
  bool canMockLocation = false;
  bool isRealDevice = true;
  bool isOnExternalStorage = false;
  bool isSafeDevice = false;
  bool isDevelopmentModeEnable = false;
  bool jailbrokenAndroid = false;
  bool developerModeAndroid = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    // await Permission.location.request();
    // if (await Permission.location.isPermanentlyDenied) {
    //   openAppSettings();
    // }

    if (!mounted) return;
    try {
      isJailBroken = await SafeDevice.isJailBroken;
      canMockLocation = await SafeDevice.canMockLocation;
      isRealDevice = await SafeDevice.isRealDevice;
      isOnExternalStorage = await SafeDevice.isOnExternalStorage;
      isSafeDevice = await SafeDevice.isSafeDevice;
      isDevelopmentModeEnable = await SafeDevice.isDevelopmentModeEnable;

    } catch (error) {
      print(error);
    }

    setState(() {
      isJailBroken = isJailBroken;
      canMockLocation = canMockLocation;
      isRealDevice = isRealDevice;
      isOnExternalStorage = isOnExternalStorage;
      isSafeDevice = isSafeDevice;
      isDevelopmentModeEnable = isDevelopmentModeEnable;
      // jailbrokenAndroid = jailbrokenAndroid;
      // developerModeAndroid = developerModeAndroid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Device Safe check'),
        ),
        body: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('isJailBroken():'),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        isJailBroken ? "Yes" : "No",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('canMockLocation():'),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        canMockLocation ? "Yes" : "No",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('isRealDevice():'),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        isRealDevice ? "Yes" : "No",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('isOnExternalStorage():'),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        isOnExternalStorage ? "Yes" : "No",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('isSafeDevice():'),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        isSafeDevice ? "Yes" : "False",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('isDevelopmentModeEnable():'),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        isDevelopmentModeEnable ? "Yes" : "False",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     const Text('isJailBrokenInAndroid():'),
                  //     const SizedBox(
                  //       width: 8,
                  //     ),
                  //     Text(
                  //       jailbrokenAndroid ? "Yes" : "False",
                  //       style: const TextStyle(fontWeight: FontWeight.w600),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     const Text('isDevelopmentModeInAndroid():'),
                  //     const SizedBox(
                  //       width: 8,
                  //     ),
                  //     Text(
                  //       developerModeAndroid ? "Yes" : "False",
                  //       style: const TextStyle(fontWeight: FontWeight.w600),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
