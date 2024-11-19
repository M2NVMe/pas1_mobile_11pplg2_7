import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_7/Apis/Models/LeagueModel.dart';
import 'package:pas1_mobile_11pplg2_7/Apis/sportsdbapi.dart';
import 'package:pas1_mobile_11pplg2_7/databases/FavoritesDatabase.dart';

class SportsController extends GetxController {
  var ld = true.obs;
  var list = <League>[].obs;
  final DatabaseUtama dbHelper = DatabaseUtama();

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
    dbHelper.loadFavorites();
  }

  void fetchPosts() async {
    try {
      ld(true);
      var posts = await Sportsdbapi().fetchPosts();
      list.assignAll(posts);
    } finally {
      ld(false);
    }
  }
  bool isFavorite(String title) {
    return dbHelper.favorites.any((fav) => fav['title'] == title);
  }

  Future<void> toggleFavorite(Map<String, dynamic> item) async {
    if (isFavorite(item['title'])) {
      final fav = dbHelper.favorites.firstWhere((fav) => fav['title'] == item['title']);
      await dbHelper.deleteFav(fav['id']);
      Get.snackbar('Removed from Favorites', item['title']);
    } else {
      await dbHelper.addFav({
        'image': item['image'],
        'title': item['title'],
        'description': item['description'],
      });
      Get.snackbar('Added to Favorites', item['title']);
    }
    await dbHelper.loadFavorites();
    update();
  }
}
