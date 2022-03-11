import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/service/service.dart';
import 'package:weather/ui/pages/welcome/welcome_view.dart';

import 'network/api_client.dart';
import 'network/api_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

Future initServices() async {
  /// Initial all services
  await Get.putAsync(() => AuthService().init());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ApiClient apiClient;

  @override
  void initState() {
    _initialApiClient();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }

  void _initialApiClient() async {
    apiClient = await ApiUtil.getApiClient();
  }
}
