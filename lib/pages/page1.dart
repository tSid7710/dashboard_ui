import 'package:dashboard_ui/main.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body:const Center(
        child: Text("This is Page 1"),
      ),
    );
  }
}
