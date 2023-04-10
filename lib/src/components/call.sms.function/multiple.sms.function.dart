import 'package:url_launcher/url_launcher.dart';

Future<void> sendSMSAll(List<String> phoneNumbers, String message) async {
  String url = 'sms:${phoneNumbers.join(",")}?body=$message';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
