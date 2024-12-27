import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  late InAppWebViewController webViewController;
  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }
  // Request location permission
  Future<void> _requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
    } else {
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 141, 13, 21),
        elevation: 0,
        title: const Text(""),
        toolbarHeight: 3.0, // Adjust this height as needed
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri('https://mis.17000ft.org/recce/'),
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onLoadStart: (controller, url) {
        },
        onLoadStop: (controller, url) {
        },
        // Handle geolocation permissions
        onGeolocationPermissionsShowPrompt: (controller, origin) async {
          return GeolocationPermissionShowPromptResponse(
            origin: origin,
            allow: true, // Allow location access in WebView
            retain: true, // Retain this permission for future access
          );
        },
      ),
    );
  }
}
