import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:oru_phones/global_widgets/global_widgets.dart';

import '../utils/utils.dart';

class NotificationScreen extends StatelessWidget {
  static const String route = 'Notification Screen';

  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var message = ModalRoute.of(context)?.settings.arguments as RemoteMessage?;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: OruColors.white,
        ),
        backgroundColor: OruColors.appBar,
        centerTitle: true,
        title: const OruText(
          text: 'Notification Screen',
          fontColor: OruColors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            OruText(
              text: message != null ? '${message.notification?.title}' : '',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            verticalMargin12,
            OruText(
              text: message != null ? '${message.notification?.body}' : '',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            verticalMargin12,
            OruText(
              text: message != null ? '${message.data}' : '',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
