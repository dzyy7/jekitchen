import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:jekitchen/main.dart';

class FirebaseApi {
  //create an instance of firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future <void> initNotifications() async{
  // request permission from user (will prompt user)
    await _firebaseMessaging.requestPermission();


    final fCMToken = await _firebaseMessaging.getToken();

    print ('Token: $fCMToken');

    initPushNotifications();
  }

  void handleMessage (RemoteMessage? message){
    if (message == null) return;

   navigatorKey.currentState?.pushNamed(
  '/notification', 
  arguments: message,
);

  }

  Future initPushNotifications() async{
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}