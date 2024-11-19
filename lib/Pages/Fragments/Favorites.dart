import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg2_7/controllers/sportscontroller.dart';
import 'package:pas1_mobile_11pplg2_7/databases/FavoritesDatabase.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    final DatabaseUtama datas = Get.put(DatabaseUtama());
    datas.loadFavorites();
    return Scaffold(
        appBar: AppBar(title: Text("Favorites"), automaticallyImplyLeading: false,),
      body: Column(
        children: [
        Expanded(
        child:
        Obx(() {
      if (datas.favorites.isEmpty) {
        return Center(
          child: Text(
            "No favorites yet!",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        );
      }
      return ListView.builder(
        itemCount: datas.favorites.length,
        itemBuilder: (context, index) {
          final item = datas.favorites[index];
          return Card(
            color: Colors.grey.shade100,
            child: ListTile(
              leading: Image.network(
                item['image'],
                width: 70,
                height: 70,
              ),
              title: Text(item['title']),
              subtitle: Text(item['description']),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () async {
                  if (item['id'] != null) {
                    await datas.deleteFav(item['id']);
                    await datas.loadFavorites();
                    final sportsController = Get.find<SportsController>();
                    sportsController.toggleFavorite(item);
                    sportsController.update();
                  }
                },
              ),
            ),
          );
        },
      );
    }),
         ),
       ],
      )
    );
  }
}
