import 'package:url_launcher/url_launcher.dart';

Future<void> sendSMSAll(List<String> phoneNumbers, String message) async {
  Uri uri = Uri.parse('sms:${phoneNumbers.join(",")}?body=$message');
  if (await launchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch ${uri.data}';
  }
}
