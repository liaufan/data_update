import 'package:cloud_functions/cloud_functions.dart';

class CloudFunctionHelper {
  HttpsCallable queryMemberCallable =
      FirebaseFunctions.instance.httpsCallable("queryMember");
  HttpsCallable queryMembersCallable =
      FirebaseFunctions.instance.httpsCallable("queryMembers");

  Future<HttpsCallableResult> queryMember(String searchTerm) async {
    return await queryMemberCallable
        .call(<String, dynamic>{'search_term': searchTerm});
  }

  Future<HttpsCallableResult> queryMembers(String searchTerm) async {
    return await queryMembersCallable
        .call(<String, dynamic>{'search_term': searchTerm});
  }
}
