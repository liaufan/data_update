import 'package:bmsm/helpers/cloud_function.helper.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  RxList members = [].obs;
  String searchTerm = "";

  @override
  void onInit() {
    super.onInit();
    members.clear();
  }

  searchMembers(String searchTerm) async {
    var result = await CloudFunctionHelper().queryMember(searchTerm);
    print(result);
  }
}
