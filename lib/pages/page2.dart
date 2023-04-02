import 'package:flutter/material.dart';

import '../main.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Notification List"),
        centerTitle: true,
      ),
      drawer:const DrawerWidget(),
      body:const Center(
        child: Text("This is Page 2"),
      ),
    );
  }
}
