import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';

class DashBoardUI extends StatefulWidget {
  static const String routeName = '/dashboard';
  const DashBoardUI({super.key});

  @override
  State<DashBoardUI> createState() => DashBoardUIState();
}

class DashBoardUIState extends State<DashBoardUI> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Center(child: Text(user.toJson())),
    );
  }
}
