import 'package:flutter/material.dart';

import '../main.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Work Order"),
        centerTitle: true,
      ),
      drawer:const DrawerWidget(),
      body: const Center(
        child: Text("This is Page 3"),
      ),
    );
  }
}
