import 'package:flutterfire_ui/i10n.dart';

class LabelOverrides extends DefaultLocalizations{
  const LabelOverrides();
}

abstract class FlutterFireUILocalizationLabels{
  const FlutterFireUILocalizationLabels();

  @override
  String get emailInputLabel => '이메일';

  @override
  String get passwordInputLabel => '비밀번호';

  @override
  String get signInText => '로그인';

  @override
  String get registerHintText => '아직 계정이 없으신가요?';

  @override
  String get registerText => '가입하기';

  @override
  String get forgotPasswordButtonLabel => '비밀번호 찾기';


}