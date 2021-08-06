import 'package:url_launcher/url_launcher.dart';
import 'package:zeitplan/data/phone_call/phone_call.dart';

class LauncherPhoneCallAdapter implements LaunchPhoneCall {
  @override
  Future<void> call(String phone) async {
    final action = "tel:$phone";
    final launchable = await canLaunch(action);
    if (launchable) {
      await launch(action);
    } else {
      throw Exception("The action: ($action), couldn't be launched");
    }
  }
}
