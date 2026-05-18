import 'dart:math';

import 'package:flutter/material.dart';

class DrawerPractice extends StatelessWidget {
  const DrawerPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer page")),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 16.0,
        surfaceTintColor: Colors.blueAccent,
        width: min(MediaQuery.of(context).size.width * .75, 304),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Text(
                "Header",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text("Home"),
              onTap: () => Navigator.pop(context),

            )
          ],
        ),
      ),
    );
  }
}
