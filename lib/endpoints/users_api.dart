import 'dart:convert';
import 'dart:io';

import 'package:bita_markets/models/schema.dart';
import 'package:bita_markets/utils/function/request_handler_wrapper.dart';
import 'package:bita_markets/utils/utils.dart';
import 'package:d_orm/database/database.dart';
import 'package:postgres/postgres.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
part 'users_api.g.dart';

class UsersApi {
  Router get router => _$UsersApiRouter(this);
  @Route.put('/<id>')
  Future<Response> getAUser(Request request, String id) async {
    final data = await form(
      request,
      fields: [
        FieldValidator(name: 'data'),
        FieldValidator(name: 'extra_data'),
      ],
    );

    return Response.forbidden(
      jsonEncode({'detail': 'you don have permission'}),
      headers: {HttpHeaders.contentTypeHeader: ContentType.json.value},
    );
  }

  @Route.delete('/<id>')
  Future<Response> delAUser(Request request, String id) async {
    return Response.forbidden(
      jsonEncode({'detail': 'you don have permission'}),
      headers: {HttpHeaders.contentTypeHeader: ContentType.json.value},
    );
  }

  @Route.post('/getStartedWithEmail')
  Future<Response> getStartedEmail(Request request) =>
      handleRequestWithPermission(
        request,
        permission: () {},
        endpoint: () async {
          final data = await form(
            request,
            fields: [
              FieldValidator<String>(
                name: 'email',
                isRequired: true,
                validator: (value) => RegExp(r'.+@.+\..+').hasMatch(value)
                    ? null
                    : 'Incorrect email format',
              ),
            ],
          );
          User? user;

          final email = data['email'] as String;

          user = await UserDb.get(where: (t) => t.email.equals(email));
          user ??= await UserDb.create(email: email);
          var pass =
              await PasswordDb.get(where: (t) => t.userId.equals(user!.id!));

          pass ??= await PasswordDb.create(userId: user!.id!);

          final otp = generateSecureRandom();
          pass!.emailOtp = otp.toString();

          await pass.save();

          await SendMail.sendOtp(otp.toString(), user!);
          return jsonResponse(
            body: {
              'user': user.toJson(),
              'isRegistrationComplete': user.firstName != null,
            },
          );
        },
      );
  @Route.post('/getStartedWithPhone')
  Future<Response> getStartedPhone(Request request) =>
      handleRequestWithPermission(
        request,
        permission: () {},
        endpoint: () async {
          final data = await form(
            request,
            fields: [
              FieldValidator<String>(
                name: 'phoneNumber',
                isRequired: true,
                validator: (value) => RegExp(r'(7|9)\d{8}').hasMatch(value)
                    ? null
                    : 'Incorrect phone format',
              ),
            ],
          );
          User? user;

          final phoneNumber = data['phoneNumber'] as String;

          user =
              await UserDb.get(where: (t) => t.phoneNumber.equals(phoneNumber));
          user ??= await UserDb.create(phoneNumber: phoneNumber);
          var pass =
              await PasswordDb.get(where: (t) => t.userId.equals(user!.id!));

          pass ??= await PasswordDb.create(userId: user!.id!);

          final otp = generateSecureRandom();
          pass!.phoneOtp = otp.toString();

          await pass.save();

          await SendSms.sendOtp(otp.toString(), user!);
          return jsonResponse(
            body: {
              'user': user.toJson(),
              'isRegistrationComplete': user.firstName != null,
            },
          );
        },
      );
  @Route.post('/verifyOtp')
  Future<Response> verifyOtp(Request request) => handleRequestWithPermission(
        request,
        permission: () {},
        endpoint: () async {
          final data = await form(
            request,
            fields: [
              FieldValidator<int>(
                name: 'otp',
                isRequired: true,
                validator: (value) => value > 99999 && value <= 999999
                    ? null
                    : 'otp should be six digit',
              ),
              FieldValidator<String>(
                name: 'otpType',
                isRequired: true,
                validator: (value) => ['email', 'phone'].contains(value)
                    ? null
                    : 'Unknown otpType',
              ),
              FieldValidator<int>(
                name: 'userId',
                isRequired: true,
              ),
            ],
          );

          final sql = Sql.named('''
SELECT "user".*,"password".* from "user" join "password" on "user"."userId"="password"."userId" where "user"."userId"= @userId and "password"."${data['otpType']}Otp"=@otp
    ''');
          data.remove('otpType');
          final res = await Database().execute(sql, parameters: data);

          final users = UserDb.fromResult(res);

          return jsonResponse(body: users.map((e) => e.toJson()));
        },
      );
}