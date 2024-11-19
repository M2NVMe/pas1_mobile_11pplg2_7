import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg2_7/Apis/Models/LeagueModel.dart';

class DetailScreen extends StatelessWidget {
  final League post;

  DetailScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(post.strTeam),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(post.strBadge, width: 100, height: 100),
              ),
              SizedBox(height: 20),
              Text(
                post.strTeam,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'League: ${post.strLeague}',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '${post.strDescriptionEN}',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
