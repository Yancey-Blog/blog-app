import 'package:url_launcher/url_launcher.dart';

enum LaunchType { Url, PhoneNumber, SMS, Email }

/// Checks whether the specified URL can be handled by some app installed on
/// the device.
///
/// To open a webview, make a telephone call, send sms or email by specified
/// [url].
///
/// ```dart
///  const _url = 'https://www.yanceyleo.com';
///
///  const _phoneNumber = 'tel:+150xxxxxxxx';
///
///  const _sms = 'sms:150xxxxxxxx';
///
///  final _emailLaunchUri = Uri(
///      scheme: 'mailto',
///      path: 'smith@example.com',
///      queryParameters: {
///        'subject': 'Example Subject & Symbols are allowed!'
///      }).toString();
/// ```
void launchUrl(String url, {type = LaunchType.Url}) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    // TODO: 换成 Toast
    throw 'Could not launch $url';
  }
}

void noop() => {};
