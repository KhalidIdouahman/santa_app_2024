import 'package:flutter/material.dart';
import 'package:santa_app_2024/ads_services/ad_mob_GDPR/initialize_gdpr.dart';

class InitializeGDPRScreen extends StatefulWidget {
  final Widget targetWidget;

  const InitializeGDPRScreen({super.key, required this.targetWidget});

  @override
  State<InitializeGDPRScreen> createState() => _InitializeScreenState();
}

class _InitializeScreenState extends State<InitializeGDPRScreen> {
  final _initializeGDPR = InitializeGDBR();

  @override
  void initState() {
    super.initState();

    _initialize();
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );

  Future<void> _initialize() async {
    final navigator = Navigator.of(context);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initializeGDPR.initialize();
      navigator.pushReplacement(
        MaterialPageRoute(builder: (context) => widget.targetWidget),
      );
    });
  }
}
