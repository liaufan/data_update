import 'package:cloud_functions/cloud_functions.dart';

class CloudFunctionHelper {
  HttpsCallable queryMemberCallable =
      FirebaseFunctions.instance.httpsCallable("queryMember");
  Future<HttpsCallableResult> queryMember(String searchTerm) async {
    return await queryMemberCallable
        .call(<String, dynamic>{'search_term': searchTerm});
  }
}
