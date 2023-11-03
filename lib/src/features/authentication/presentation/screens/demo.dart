import 'package:flutter/material.dart';
import 'package:mpp_with_ui_sdk/mpp_sdk.dart';
import 'package:mpp_with_ui_sdk/common_function/showMppErrorMessage.dart';
import 'package:mpp_headless_sdk/generated/OnemoneyMPP.pb.dart';
import 'package:pds_flutter/onemoney_pds.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});
  static const String routeName = "/demo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: loadingInit(),
        home: Center(
            child: TextButton(
          style: TextButton.styleFrom(
              primary: Colors.white, backgroundColor: Colors.blue),
          onPressed: () async {
            MppSDK mppSDK = MppSDK(
              baseUrl:
                  'https://mpp-api-uat.moneyone.in', //UAT - https://mpp-api-uat.moneyone.in // PROD - https://mpp-api.moneyone.in
              mobileNumber: '9404016890', // 9492602601 // 9988776600
              clientId: 'bbmclp-clidecimal-gtw4rt67yuop',
              appIdentifier: 'MPP',
              apiKey: 'c7d334z99-99af-0e69-c961-1994s2sd786y',
              organisationId: 'CONSUMER002',
              ssoTimeStamp: "2022-04-21T12:46:13+00:00",
              partyName: "Decimal",
              consentHandle: 'fe0dd82e-5d16-4c38-8ec5-328567194522',
              onDataUploadStatus: (objectData) {
                if (objectData == true) {
                  print('In Parent Upload Success..$objectData');
                } else {
                  print('In Parent Upload Failure..$objectData');
                }
              },
            );

            await getConsentId(mpp: mppSDK);

            await mppSDK.mppSDKLogin(context: context, mpp: mppSDK);
          },
          child: Text('Open MPP SDK'),
        )),
      ),
    );
  }

  Future<String> getConsentId({required MppSDK mpp}) async {
    try {
      RequestConsentResponse requestConsentResponse = await mpp.requestConsent(
        requestConsentRequest: RequestConsentRequest(
          productID: "8", // 7
          partyIdentifierType: "MOBILE",
          partyIdentifierValue: mpp.mobileNumber,
          accountID: "123",
        ),
      );
      return requestConsentResponse.data.consentHandle;
    } catch (err) {
      showMppError(err);
      rethrow;
      //return "error";
      //rethrow;
    }
  }
}
