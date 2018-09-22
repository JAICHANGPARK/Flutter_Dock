import 'package:flutter/cupertino.dart';

void main() => runApp(new CupertinoApp(home: MyFirstCupertino(),
debugShowCheckedModeBanner: false,));

class MyFirstCupertino extends StatelessWidget {
  
  Widget cupertinoPageScaffold() => CupertinoPageScaffold(
        child: Center(
          child: Text("Hello Cupertino iOS"),
        ),
        navigationBar: CupertinoNavigationBar(
          leading: Icon(CupertinoIcons.back),
          middle: Text("Cupertino"),
          trailing: Icon(CupertinoIcons.search),
        ),
//      backgroundColor: CupertinoColors.black,
      );

  Widget cupertinoTabScaffold() => CupertinoTabScaffold(
    tabBar: CupertinoTabBar(items: [
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone), title: Text("Phone")),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone), title: Text("Phone")),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone), title: Text("Phone")),

    ],),
    tabBuilder: (context, i) => CupertinoPageScaffold(
      child: Center(
        child: i == 0? Text("Phone"): Text("Chat"),
      ),
    ),
  );

  Widget cupertinoSliverNavigationBar() =>  CupertinoPageScaffold(
    child: CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text("Chats"),
        ),
        SliverFillRemaining(
          child: Center(
            child: Text("What?"),
          ),
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return cupertinoSliverNavigationBar();
  }

}
