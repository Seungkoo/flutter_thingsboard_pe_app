// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ko';

  static String m0(appTitle) =>
      "환영합니다!\n 당신의 계정 ${appTitle}이 생성되었습니다.\n 당신의 ${appTitle} 공간에서 로그인하세요.";

  static String m1(contact) => "확인 코드가 이메일 ${contact}로 전송되었습니다. .";

  static String m2(time) =>
      "Resend code in ${Intl.plural(time, one: '1 second', other: '${time} seconds')}";

  static String m3(contact) => "확인 코드가 전화 ${contact}로 전송되었습니다. .";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "No": MessageLookupByLibrary.simpleMessage("아니오"),
        "OR": MessageLookupByLibrary.simpleMessage("혹은"),
        "Yes": MessageLookupByLibrary.simpleMessage("예"),
        "accept": MessageLookupByLibrary.simpleMessage("승인"),
        "acceptPrivacyPolicyMessage":
            MessageLookupByLibrary.simpleMessage("개인정보 보호정책에 동의하셔야 합니다."),
        "acceptTermsOfUseMessage":
            MessageLookupByLibrary.simpleMessage("이용 약관에 동의하셔야 합니다."),
        "accountActivated":
            MessageLookupByLibrary.simpleMessage("성공적으로 계정이 생성되었습니다!"),
        "accountActivatedText": m0,
        "actionData": MessageLookupByLibrary.simpleMessage("Action data"),
        "activatingAccount": MessageLookupByLibrary.simpleMessage("계정 생성 중..."),
        "activatingAccountText":
            MessageLookupByLibrary.simpleMessage("계정 생성 중입니다.\n잠시 기다리세요..."),
        "active": MessageLookupByLibrary.simpleMessage("켜짐"),
        "address": MessageLookupByLibrary.simpleMessage("주소"),
        "address2": MessageLookupByLibrary.simpleMessage("주소 2"),
        "alarmAcknowledgeText":
            MessageLookupByLibrary.simpleMessage("알람을 인지하셨습니까?"),
        "alarmAcknowledgeTitle": MessageLookupByLibrary.simpleMessage("알람 인지"),
        "alarmClearText": MessageLookupByLibrary.simpleMessage("알람을 해제하시겠습니까?"),
        "alarmClearTitle": MessageLookupByLibrary.simpleMessage("알람 해제"),
        "alarms": MessageLookupByLibrary.simpleMessage("알람"),
        "allDevices": MessageLookupByLibrary.simpleMessage("모든 기기"),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("이미 계정을 가지고 계신가요?"),
        "appTitle": MessageLookupByLibrary.simpleMessage("SEQ 열풍기 콘트롤"),
        "assetName": MessageLookupByLibrary.simpleMessage("자원 이름"),
        "assets": MessageLookupByLibrary.simpleMessage("자원"),
        "assignedToCustomer": MessageLookupByLibrary.simpleMessage("관리자"),
        "auditLogDetails": MessageLookupByLibrary.simpleMessage("상세 감사 로그"),
        "auditLogs": MessageLookupByLibrary.simpleMessage("감사 로그"),
        "backupCodeAuthDescription":
            MessageLookupByLibrary.simpleMessage("백업 코드 중 하나를 입력하세요."),
        "backupCodeAuthPlaceholder":
            MessageLookupByLibrary.simpleMessage("백업 코드"),
        "cancel": MessageLookupByLibrary.simpleMessage("취소"),
        "changePassword": MessageLookupByLibrary.simpleMessage("암호 변경"),
        "city": MessageLookupByLibrary.simpleMessage("도시"),
        "confirmNotRobotMessage":
            MessageLookupByLibrary.simpleMessage("로봇이 아님을 확인해 주셔야 합니다"),
        "continueText": MessageLookupByLibrary.simpleMessage("계속"),
        "country": MessageLookupByLibrary.simpleMessage("국가"),
        "createAccount": MessageLookupByLibrary.simpleMessage("계정 생성"),
        "createPasswordStar": MessageLookupByLibrary.simpleMessage("암호 생성 *"),
        "currentPassword": MessageLookupByLibrary.simpleMessage("현재 암호"),
        "currentPasswordRequireText":
            MessageLookupByLibrary.simpleMessage("현재 암호가 필요합니다."),
        "currentPasswordStar": MessageLookupByLibrary.simpleMessage("현재 암호 *"),
        "customer": MessageLookupByLibrary.simpleMessage("Customer"),
        "customers": MessageLookupByLibrary.simpleMessage("고객"),
        "devices": MessageLookupByLibrary.simpleMessage("기기"),
        "email": MessageLookupByLibrary.simpleMessage("이메일"),
        "emailAuthDescription": m1,
        "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage("이메일 코드"),
        "emailInvalidText":
            MessageLookupByLibrary.simpleMessage("잘못된 이메일 형식입니다."),
        "emailRequireText": MessageLookupByLibrary.simpleMessage("이메일이 필요합니다."),
        "emailStar": MessageLookupByLibrary.simpleMessage("이메일 *"),
        "emailVerification": MessageLookupByLibrary.simpleMessage("이메일 본인 확인"),
        "emailVerificationInstructionsText": MessageLookupByLibrary.simpleMessage(
            "발송된 이메일에 포함된 안내에 따라 회원 가입을 계속 진행하세요. 이메일이 수신되지 않았다면, 스팸 폴더를 확인하거나 \'재전송\' 단추를 눌러 이메일 재전송을 요청하시기 바랍니다."),
        "emailVerificationSentText": MessageLookupByLibrary.simpleMessage(
            "자세한 본인 확인 방법을 해당 이메일 주소로 전송하였습니다."),
        "emailVerified": MessageLookupByLibrary.simpleMessage("이메일 확인됨"),
        "entityType": MessageLookupByLibrary.simpleMessage("엔티티 형식"),
        "failureDetails": MessageLookupByLibrary.simpleMessage("상세 오류"),
        "firstName": MessageLookupByLibrary.simpleMessage("firstName"),
        "firstNameRequireText":
            MessageLookupByLibrary.simpleMessage("이름이 필요합니다."),
        "firstNameStar": MessageLookupByLibrary.simpleMessage("이름 *"),
        "firstNameUpper": MessageLookupByLibrary.simpleMessage("First Name"),
        "home": MessageLookupByLibrary.simpleMessage("홈"),
        "imNotARobot": MessageLookupByLibrary.simpleMessage("로봇이 아닙니다."),
        "inactive": MessageLookupByLibrary.simpleMessage("꺼짐"),
        "inactiveUserAlreadyExists":
            MessageLookupByLibrary.simpleMessage("비활성 계정이 이미 존재합니다."),
        "inactiveUserAlreadyExistsMessage":
            MessageLookupByLibrary.simpleMessage(
                "해당 이메일로 이미 가입된 계정이 있습니다.\n확인 이메일을 다시 보내시려면 \'재전송\' 단추를 누르세요."),
        "invalidPasswordLengthMessage":
            MessageLookupByLibrary.simpleMessage("암호는 최소한 6글자 이상이 필요합니다."),
        "label": MessageLookupByLibrary.simpleMessage("라벨"),
        "lastName": MessageLookupByLibrary.simpleMessage("lastName"),
        "lastNameRequireText":
            MessageLookupByLibrary.simpleMessage("성이 필요합니다."),
        "lastNameStar": MessageLookupByLibrary.simpleMessage("성 *"),
        "lastNameUpper": MessageLookupByLibrary.simpleMessage("Last Name"),
        "listIsEmptyText": MessageLookupByLibrary.simpleMessage("목록이 비었습니다."),
        "login": MessageLookupByLibrary.simpleMessage("로그인"),
        "loginNotification": MessageLookupByLibrary.simpleMessage("로그인"),
        "logoDefaultValue":
            MessageLookupByLibrary.simpleMessage("Samsung Logo"),
        "logout": MessageLookupByLibrary.simpleMessage("로그아웃"),
        "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage("백업 코드"),
        "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("이메일"),
        "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
        "mfaProviderTopt": MessageLookupByLibrary.simpleMessage("인증 앱"),
        "more": MessageLookupByLibrary.simpleMessage("더보기"),
        "newPassword": MessageLookupByLibrary.simpleMessage("새 암호"),
        "newPassword2": MessageLookupByLibrary.simpleMessage("새 암호2"),
        "newPassword2RequireText":
            MessageLookupByLibrary.simpleMessage("새 암호를 다시 입력하세요."),
        "newPassword2Star":
            MessageLookupByLibrary.simpleMessage("새 암호 다시 입력 *"),
        "newPasswordRequireText":
            MessageLookupByLibrary.simpleMessage("새 암호가 필요합니다."),
        "newPasswordStar": MessageLookupByLibrary.simpleMessage("새 암호 *"),
        "newUserText": MessageLookupByLibrary.simpleMessage("새로운 사용자이신가요?"),
        "notImplemented": MessageLookupByLibrary.simpleMessage("지원 하지 않음!"),
        "password": MessageLookupByLibrary.simpleMessage("비밀번호"),
        "passwordErrorNotification":
            MessageLookupByLibrary.simpleMessage("입력한 암호가 이전 암호와 동일합니다!"),
        "passwordForgotText":
            MessageLookupByLibrary.simpleMessage("비밀번호를 잊으셨나요?"),
        "passwordRequireText":
            MessageLookupByLibrary.simpleMessage("비밀번호가 필요합니다."),
        "passwordReset": MessageLookupByLibrary.simpleMessage("비밀번호 초기화"),
        "passwordResetLinkSuccessfullySentNotification":
            MessageLookupByLibrary.simpleMessage("비밀번호 초기화 링크가 발송되었습니다!"),
        "passwordResetText": MessageLookupByLibrary.simpleMessage(
            "가입 시 입력한 이메일 주소를 입력하시면 해당 이메일로 비밀번호 초기화 링크가 발송됩니다."),
        "passwordSuccessNotification":
            MessageLookupByLibrary.simpleMessage("암호가 성공적으로 변경되었습니다."),
        "phone": MessageLookupByLibrary.simpleMessage("전화번호"),
        "postalCode": MessageLookupByLibrary.simpleMessage("우편번호"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("개인정보 보호정책"),
        "profileSuccessNotification":
            MessageLookupByLibrary.simpleMessage("프로필이 성공적으로 변경되었습니다."),
        "repeatPasswordStar":
            MessageLookupByLibrary.simpleMessage("암호 다시 입력 *"),
        "requestPasswordReset":
            MessageLookupByLibrary.simpleMessage("비밀번호 초기화 요청"),
        "resend": MessageLookupByLibrary.simpleMessage("재전송"),
        "resendCode": MessageLookupByLibrary.simpleMessage("확인 코드 재전송"),
        "resendCodeWait": m2,
        "selectWayToVerify": MessageLookupByLibrary.simpleMessage("확인 방법 선택"),
        "sets": MessageLookupByLibrary.simpleMessage("세트"),
        "signIn": MessageLookupByLibrary.simpleMessage("로그인"),
        "signUp": MessageLookupByLibrary.simpleMessage("계정 생성"),
        "sites": MessageLookupByLibrary.simpleMessage("현장"),
        "smsAuthDescription": m3,
        "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("SMS 코드"),
        "stateOrProvince": MessageLookupByLibrary.simpleMessage("지역"),
        "systemAdministrator": MessageLookupByLibrary.simpleMessage("시스템 관리자"),
        "tenantAdministrator": MessageLookupByLibrary.simpleMessage("테넌트 관리자"),
        "termsOfUse": MessageLookupByLibrary.simpleMessage("이용 약관"),
        "title": MessageLookupByLibrary.simpleMessage("성명"),
        "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("코드"),
        "totpAuthDescription":
            MessageLookupByLibrary.simpleMessage("본인 확인 앱에서 인증 코드를 입력하세요."),
        "tryAgain": MessageLookupByLibrary.simpleMessage("다시 시도"),
        "tryAnotherWay": MessageLookupByLibrary.simpleMessage("다른 방법 시도"),
        "type": MessageLookupByLibrary.simpleMessage("형식"),
        "username": MessageLookupByLibrary.simpleMessage("사용자명"),
        "verificationCodeIncorrect":
            MessageLookupByLibrary.simpleMessage("본인 확인 코드가 일치하지 않습니다."),
        "verificationCodeInvalid":
            MessageLookupByLibrary.simpleMessage("잘못된 확인 코드 형식"),
        "verificationCodeManyRequest":
            MessageLookupByLibrary.simpleMessage("본인 확인 코드 요청 횟수가 초과되었습니다."),
        "verifyYourIdentity": MessageLookupByLibrary.simpleMessage("본인 확인")
      };
}
