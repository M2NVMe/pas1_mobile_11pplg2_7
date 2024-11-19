import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_7/Pages/Detailed.dart';
import 'package:pas1_mobile_11pplg2_7/controllers/sportscontroller.dart';
import 'package:pas1_mobile_11pplg2_7/databases/FavoritesDatabase.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final SportsController controller = Get.put(SportsController());
    final DatabaseUtama datas = Get.put(DatabaseUtama());
    return Scaffold(
      appBar: AppBar(title: Text("Home"), automaticallyImplyLeading: false,),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Text("Tekan sekali untuk favoritkan, tekan lama untuk detail", style: TextStyle(color: CupertinoColors.inactiveGray),),
          SizedBox(height: 10,),
          Expanded(
            child: Obx(() {
              if (controller.ld.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: ListView.builder(
                    itemCount: controller.list.length,
                    itemBuilder: (context, index) {
                      final post = controller.list[index];
                      return
                        ClipRRect(
                          child: Card(
                            elevation: 0,
                            color: Colors.grey.shade100,
                            child:
                            ListTile(
                              leading: Image.network(
                                post.strBadge,
                                width: 70,
                                height: 70,
                              ),
                              title: Text(post.strTeam),
                              subtitle: Text(post.strLeague),
                              onTap: () {
                                  post.isSaved.value = false;
                                  controller.toggleFavorite({
                                    'image': post.strBadge,
                                    'title': post.strTeam,
                                    'description': post.strLeague,
                                });
                              },
                              onLongPress: () {
                                Get.to(() => DetailScreen(post: post));
                              },
                              trailing: Obx(() {
                                final isFav = controller.isFavorite(post.strTeam);
                                return Icon(
                                  isFav ? Icons.favorite : Icons.favorite_border,
                                  color: isFav ? Colors.red : Colors.grey,
                                );
                              }),
                            ),
                          ),
                        );
                    },
                  ),
                );
              }
            }),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
