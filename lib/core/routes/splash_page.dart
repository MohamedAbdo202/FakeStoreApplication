import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pyramakerz/core/constants/app_constants.dart';
import 'package:pyramakerz/core/hive_service/hive_service.dart';
import 'package:pyramakerz/core/routes/router.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final token = await HiveService.get(key: AppConstants.token);

    if (!mounted) return;

    if (token != null && token.toString().isNotEmpty) {
      context.replaceRoute(const HomeRoute());
    } else {
      context.replaceRoute(const LoginRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
