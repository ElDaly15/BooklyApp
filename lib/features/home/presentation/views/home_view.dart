import 'package:bookly_app/features/home/presentation/views/widgets/custom_home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff100B20),
    ));
    return Scaffold(
      body: CustomHomeViewBody(),
    );
  }
}
