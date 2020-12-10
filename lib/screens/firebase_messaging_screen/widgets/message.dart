import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

/// Message route arguments.
class MessageArguments {
  /// The RemoteMessage
  final RemoteMessage message;

  /// Whether this message caused the application to open.
  final bool openedApplication;

  // ignore: public_member_api_docs
  MessageArguments(this.message, this.openedApplication)
      : assert(message != null);
}

/// Displays information about a [RemoteMessage].
class MessageView extends StatelessWidget {
  /// A single data row.
  Widget row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Row(children: [
        Text('$title: '),
        Text(value ?? 'N/A'),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as MessageArguments;
    final message = args.message;
    final notification = message.notification;

    return Scaffold(
      appBar: AppBar(
        title: Text(message.messageId),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          row('Triggered application open', args.openedApplication.toString()),
          row('Message ID', message.messageId),
          row('Sender ID', message.senderId),
          row('Category', message.category),
          row('Collapse Key', message.collapseKey),
          row('Content Available', message.contentAvailable.toString()),
          row('Data', message.data.toString()),
          row('From', message.from),
          row('Message ID', message.messageId),
          row('Sent Time', message.sentTime?.toString()),
          row('Thread ID', message.threadId),
          row('Time to Live (TTL)', message.ttl?.toString()),
          if (notification != null) ...[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                child: Column(children: [
                  Text(
                    'Remote Notification',
                    style: TextStyle(fontSize: 18),
                  ),
                  row(
                    'Title',
                    notification.title,
                  ),
                  row(
                    'Body',
                    notification.body,
                  ),
                  if (notification.android != null) ...[
                    Text(
                      'Android Properties',
                      style: TextStyle(fontSize: 18),
                    ),
                    row(
                      'Channel ID',
                      notification.android.channelId,
                    ),
                    row(
                      'Click Action',
                      notification.android.clickAction,
                    ),
                    row(
                      'Color',
                      notification.android.color,
                    ),
                    row(
                      'Count',
                      notification.android.count?.toString(),
                    ),
                    row(
                      'Image URL',
                      notification.android.imageUrl,
                    ),
                    row(
                      'Link',
                      notification.android.link,
                    ),
                    row(
                      'Priority',
                      notification.android.priority?.toString(),
                    ),
                    row(
                      'Small Icon',
                      notification.android.smallIcon,
                    ),
                    row(
                      'Sound',
                      notification.android.sound,
                    ),
                    row(
                      'Ticker',
                      notification.android.ticker,
                    ),
                    row(
                      'Visibility',
                      notification.android.visibility?.toString(),
                    ),
                  ],
                  if (notification.apple != null) ...[
                    Text(
                      'Apple Properties',
                      style: TextStyle(fontSize: 18),
                    ),
                    row(
                      'Subtitle',
                      notification.apple.subtitle,
                    ),
                    row(
                      'Badge',
                      notification.apple.badge,
                    ),
                    row(
                      'Sound',
                      notification.apple.sound?.name,
                    ),
                  ]
                ]),
              ),
            )
          ]
        ]),
      )),
    );
  }
}
