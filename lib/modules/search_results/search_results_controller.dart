import 'package:get/get.dart';
import 'package:property_management_system/models/search.dart';
import 'package:property_management_system/models/user.dart';
import 'package:property_management_system/modules/search_results/search_results_services.dart';

class SearchResultsController extends GetxController {
  RxBool isLoading = false.obs;
  late List<Search> post;
  late List<Search> resultProperties;

  final SearchResultsService _searchService = SearchResultsService();

  Future<List> getSearchResult(String value) async {
    post = await _searchService.getSearchProperties(Users.token);
    return resultProperties =
        post.where((search) => search.property?.address == value).toList();
  }
}
