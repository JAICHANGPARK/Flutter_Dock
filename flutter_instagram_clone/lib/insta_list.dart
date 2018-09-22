import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/insta_stories.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => index == 0
          ? new SizedBox(
              child: new InstaStories(),
              height: deviceSize.height * 0.17,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          new Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    image: NetworkImage(
                                        "https://avatars3.githubusercontent.com/u/19484515?s=400&v=4"),
                                    fit: BoxFit.fill)),
                          ),
                          new SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "itsmyowndreamwalker",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
                //두번째 열
                Flexible(
                  fit: FlexFit.loose,
                  child: new Image.network(
                    "https://scontent-sea1-1.cdninstagram.com/vp/a099cf75f94c1388eaa3cae247e561b4/5C62A63F/t51.2885-15/sh0.08/e35/s750x750/15624833_248391622257475_1616706491434139648_n.jpg?ig_cache_key=MTQxNzQ5MDc2OTgyODE3ODEyNg%3D%3D.2",
                    fit: BoxFit.cover,
                  ),
                ),

                //리스트뷰 아이템의 3번째열
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Icon(
                            FontAwesomeIcons.heart,
                          ),
                          new SizedBox(
                            width: 16.0,
                          ),
                          new Icon(
                            FontAwesomeIcons.comment,
                          ),
                          new SizedBox(
                            width: 16.0,
                          ),
                          new Icon(
                            FontAwesomeIcons.paperPlane,
                          ),
                          new SizedBox(
                            width: 16.0,
                          ),
                        ],
                      ),
                      new Icon(
                        FontAwesomeIcons.bookmark,
                      ),
                    ],
                  ),
                ),

                //4th Rows

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Liked by unknwon, test and 123,456,789 others",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                //5th Row

                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                image: NetworkImage(
                                    "https://avatars3.githubusercontent.com/u/19484515?s=400&v=4"),
                                fit: BoxFit.fill)),
                      ),
                      new SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add a comment...",

                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("2 Years Ago", style: TextStyle(color: Colors.grey),),
                )
              ],
            ),
    );
  }
}
