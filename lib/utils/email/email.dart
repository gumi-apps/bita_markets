import 'package:bita_markets/models/schema.dart';
import 'package:bita_markets/utils/email/email_templates.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class SendMail {
  static const _username = 'bita@gumiapps.com';
  static const _password = 'I*JFc+*BE(W7';
  static const _host = 'mail.gumiapps.com';

  static SmtpServer get _server =>
      SmtpServer(_host, password: _password, username: _username);
  static Future<bool> sendOtp({
    required String email,
    required int otp,
  }) async {
    final content = (await EmailOtpTemplate.content)
        .replaceFirst('{{OTP_HERE}}', otp.toString());

    final message = Message()
      ..subject = 'Verify your account'
      ..from = 'bita@gumiapps.com'
      ..recipients.add(email)
      ..html = content;
    try {
      await send(message, _server);
      return true;
    } catch (_) {
      return false;
    }
  }
}

Future<bool> sendMail(User user, String msg) async {
  // add mail send feature here
  return true;
}
