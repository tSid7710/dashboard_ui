import 'package:dashboard_ui/login.dart';
import 'package:dashboard_ui/pages/page1.dart';
import 'package:dashboard_ui/pages/page2.dart';
import 'package:dashboard_ui/pages/page3.dart';
import 'package:dashboard_ui/workorder.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'notifi_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard App"),
          centerTitle: true,
        ),
        drawer: const DrawerWidget(),
        body:const MyHomePage(),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          Image(
            image: AssetImage(
              'kaarTechnologies.jpg',
            ),
          ),
          CustomListTile(
            title: "Notification",
            navigateToPage: Notifi_list(),
            icon: Icon(
              Icons.notifications,
              color: Colors.red,
            ),
          ),
          CustomListTile(
            title: "Notification List",
            navigateToPage: Page2(),
            icon: Icon(Icons.notification_add_rounded),
          ),
          CustomListTile(
            title: "Work Order",
            navigateToPage: WorkOrder(),
            icon: Icon(Icons.work),
          ),
          CustomListTile(
            title: "Logout",
            navigateToPage: LoginPage(),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.title,
    required this.navigateToPage,
    required this.icon,
  }) : super(key: key);
  final String title;
  final Widget navigateToPage;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: icon,
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => navigateToPage,
          ),
        );
      },
    );
  }
}
