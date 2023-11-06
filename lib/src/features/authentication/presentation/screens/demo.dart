import 'package:flutter/material.dart';
import 'package:mpp_with_ui_sdk/mpp_sdk.dart';
import 'package:mpp_with_ui_sdk/common_function/showMppErrorMessage.dart';
import 'package:mpp_headless_sdk/generated/OnemoneyMPP.pb.dart';
import 'package:pds_flutter/onemoney_pds.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});
  static const String routeName = "/demo";

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('Current state = $state');
  }

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
              mobileNumber: '9930266934', // 9492602601 // 9988776600
              clientId: 'a4pg25-clinMyP8-iksw5m32smnc',
              appIdentifier: 'MPP',
              apiKey: '3a125570-2265-4dcc-b38b-ce2a7ee3ee4a',
              organisationId: 'CONSUMER011',
              //ssoTimeStamp: "2022-04-21T12:46:13+00:00",
              ssoTimeStamp: "2022-04-21T12:46:13+00:00",
              partyName: "bbbnb",
              consentHandle: '43856559-d594-4071-af62-20b4768e1711',
              onDataUploadStatus: (objectData) {
                if (objectData == true) {
                  print('In Parent Upload Success..$objectData');
                } else {
                  print('In Parent Upload Failure..$objectData');
                }
              },
            );
            
            //await getConsentId(mpp: mppSDK);

            await mppSDK.mppSDKLogin(context: context, mpp: mppSDK);
          },
          child: Text('Open MPP SDK'),
        )),
      ),
    );
  }

  /*=================WE SHOULD NOT CALL THIS=======================*/
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
