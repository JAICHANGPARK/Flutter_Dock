import 'package:flutter/material.dart';
import 'package:flutter_game_of_thrones/got.dart';

class EpisodesPage extends StatelessWidget {
  final List<Episodes> episodes;
  final MyImage myImage;

  EpisodesPage({this.episodes, this.myImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Episodes"),
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0),
      itemBuilder: (context, index) => Card(
            child: Stack(
              children: <Widget>[
                Image.network(myImage.original),

              ],
            ),
          ),
      itemCount: episodes.length,
    );
  }
}
