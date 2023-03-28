import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  CupertinoTextField(
    autofillHints: [AutofillHints.addressCity],
    ...
  )
''';

class AutofillHintsScreen extends ConsumerWidget {
  const AutofillHintsScreen({super.key});

  static const routeName = 'services/AutofillHints';
  static const title = 'AutofillHints';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const PageScaffold(
      title: title,
      explanation: '不同平台上常用的自动填表提示字符串的集合。',
      code: _code,
      constants: [
        ListTile(
          name: 'addressCity → const String',
        ),
        ListTile(
          name: 'addressCityAndState → const String',
        ),
        ListTile(
          name: 'addressState → const String',
        ),
        ListTile(
          name: 'birthday → const String',
        ),
        ListTile(
          name: 'birthdayDay → const String',
        ),
        ListTile(
          name: 'birthdayMonth → const String',
        ),
        ListTile(
          name: 'birthdayYear → const String',
        ),
        ListTile(
          name: 'countryCode → const String',
        ),
        ListTile(
          name: 'countryName → const String',
        ),
        ListTile(
          name: 'creditCardExpirationDate → const String',
        ),
        ListTile(
          name: 'creditCardExpirationDay → const String',
        ),
        ListTile(
          name: 'creditCardExpirationMonth → const String',
        ),
        ListTile(
          name: 'creditCardExpirationYear → const String',
        ),
        ListTile(
          name: 'creditCardFamilyName → const String',
        ),
        ListTile(
          name: 'creditCardGivenName → const String',
        ),
        ListTile(
          name: 'creditCardMiddleName → const String',
        ),
        ListTile(
          name: 'creditCardName → const String',
        ),
        ListTile(
          name: 'creditCardNumber → const String',
        ),
        ListTile(
          name: 'creditCardSecurityCode → const String',
        ),
        ListTile(
          name: 'creditCardType → const String',
        ),
        ListTile(
          name: 'email → const String',
        ),
        ListTile(
          name: 'familyName → const String',
        ),
        ListTile(
          name: 'fullStreetAddress → const String',
        ),
        ListTile(
          name: 'gender → const String',
        ),
        ListTile(
          name: 'givenName → const String',
        ),
        ListTile(
          name: 'impp → const String',
        ),
        ListTile(
          name: 'jobTitle → const String',
        ),
        ListTile(
          name: 'language → const String',
        ),
        ListTile(
          name: 'location → const String',
        ),
        ListTile(
          name: 'middleInitial → const String',
        ),
        ListTile(
          name: 'middleName → const String',
        ),
        ListTile(
          name: 'name → const String',
        ),
        ListTile(
          name: 'namePrefix → const String',
        ),
        ListTile(
          name: 'nameSuffix → const String',
        ),
        ListTile(
          name: 'newPassword → const String',
        ),
        ListTile(
          name: 'newUsername → const String',
        ),
        ListTile(
          name: 'nickname → const String',
        ),
        ListTile(
          name: 'oneTimeCode → const String',
        ),
        ListTile(
          name: 'organizationName → const String',
        ),
        ListTile(
          name: 'password → const String',
        ),
        ListTile(
          name: 'photo → const String',
        ),
        ListTile(
          name: 'postalAddress → const String',
        ),
        ListTile(
          name: 'postalAddressExtended → const String',
        ),
        ListTile(
          name: 'postalAddressExtendedPostalCode → const String',
        ),
        ListTile(
          name: 'postalCode → const String',
        ),
        ListTile(
          name: 'streetAddressLevel1 → const String',
        ),
        ListTile(
          name: 'streetAddressLevel2 → const String',
        ),
        ListTile(
          name: 'streetAddressLevel3 → const String',
        ),
        ListTile(
          name: 'streetAddressLevel4 → const String',
        ),
        ListTile(
          name: 'streetAddressLine1 → const String',
        ),
        ListTile(
          name: 'streetAddressLine2 → const String',
        ),
        ListTile(
          name: 'streetAddressLine3 → const String',
        ),
        ListTile(
          name: 'sublocality → const String',
        ),
        ListTile(
          name: 'telephoneNumber → const String',
        ),
        ListTile(
          name: 'telephoneNumberAreaCode → const String',
        ),
        ListTile(
          name: 'telephoneNumberCountryCode → const String',
        ),
        ListTile(
          name: 'telephoneNumberDevice → const String',
        ),
        ListTile(
          name: 'telephoneNumberExtension → const String',
        ),
        ListTile(
          name: 'telephoneNumberLocal → const String',
        ),
        ListTile(
          name: 'telephoneNumberLocalPrefix → const String',
        ),
        ListTile(
          name: 'telephoneNumberLocalSuffix → const String',
        ),
        ListTile(
          name: 'telephoneNumberNational → const String',
        ),
        ListTile(
          name: 'transactionAmount → const String',
        ),
        ListTile(
          name: 'transactionCurrency → const String',
        ),
        ListTile(
          name: 'url → const String',
        ),
        ListTile(
          name: 'username → const String',
        ),
      ],
    );
  }
}
