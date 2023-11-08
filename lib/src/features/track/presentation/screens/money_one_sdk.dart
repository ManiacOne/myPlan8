import 'package:flutter/material.dart';
import 'package:mpp_with_ui_sdk/mpp_sdk.dart';
// import 'package:mpp_with_ui_sdk/common_function/showMppErrorMessage.dart';
// import 'package:mpp_headless_sdk/generated/OnemoneyMPP.pb.dart';
import 'package:my_plan8/core/client/http.dart';
import 'package:pds_flutter/onemoney_pds.dart';

class MoneyOneSDK extends StatefulWidget {
  const MoneyOneSDK({super.key});
  static const String routeName = "/demo";

  @override
  State<MoneyOneSDK> createState() => _MoneyOneSDKState();
}

class _MoneyOneSDKState extends State<MoneyOneSDK> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: loadingInit(),
        home: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white, backgroundColor: Colors.blue),
              onPressed: () async {
                MppSDK mppSDK = MppSDK(
                  baseUrl:
                      'https://mpp-api.moneyone.in',
                  mobileNumber: '8017118135',
                  clientId: 'a4pg25-clinMyP8-iksw5m32smnc',
                  appIdentifier: 'MPP',
                  apiKey: '3a125570-2265-4dcc-b38b-ce2a7ee3ee4a',
                  organisationId: 'CONSUMER011',
                  ssoTimeStamp: "2022-04-21T12:46:13+00:00",
                  partyName: "bbbnb",
                  consentHandle: '4d0e4fdf-9b16-47a8-a804-30c1d00300e7',
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
            ),
            TextButton(
                onPressed: () async {
                  HTTP jttp = HTTP();
                  dynamic respones = await jttp.get(
                      "/user/26ce794e-f4ca-427a-a849-ebac84c9320d",
                      token :"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNrbXVraGVyamVlMjAyMUBnbWFpbC5jb20iLCJuYW1lIjoic2ttdWtoZXJqZWUyMDIxIiwidHlwZSI6IkxPQ0FMIiwidXNlcklkIjoiMjZjZTc5NGUtZjRjYS00MjdhLWE4NDktZWJhYzg0YzkzMjBkIiwiaWF0IjoxNjk4OTk3OTgwLCJleHAiOjE2OTk2MDI3ODB9.pR3FYnOA6OTbl_OsPavQ_JqxxZ6ShD093-Ddp6qNBWY");
                  print(respones);
                },
                child: Text("get"))
          ],
        )),
      ),
    );
  }

  /*=================WE SHOULD NOT CALL THIS=======================*/
  // Future<String> getConsentId({required MppSDK mpp}) async {
  //   try {
  //     RequestConsentResponse requestConsentResponse = await mpp.requestConsent(
  //       requestConsentRequest: RequestConsentRequest(
  //         productID: "8", // 7
  //         partyIdentifierType: "MOBILE",
  //         partyIdentifierValue: mpp.mobileNumber,
  //         accountID: "123",
  //       ),
  //     );
  //     return requestConsentResponse.data.consentHandle;
  //   } catch (err) {
  //     showMppError(err);
  //     rethrow;
  //     //return "error";
  //     //rethrow;
  //   }
  // }
}
