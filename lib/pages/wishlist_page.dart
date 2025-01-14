import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)?.settings.arguments as RemoteMessage?;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: message != null 
          ? Column(
              children: [
                Text(message.notification?.title ?? "No Title"),
                Text(message.notification?.body ?? "No Body"),
                Text(message.data.toString()),
              ],
            )
          : const Center(
              child: Text("No Notification Data"),
            ),
    );
  }
}
