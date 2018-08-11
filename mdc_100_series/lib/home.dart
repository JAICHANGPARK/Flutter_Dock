// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'model/data.dart';
import 'model/product.dart';

class HomePage extends StatelessWidget {
  // TODO: Make a collection of cards (102)
  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(
      // TODO: Add app bar (102)
      appBar: AppBar(
        title: Text('SHRINE'),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu Button Pressed');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search Button');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('Filter Clicked');
            },
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),



//        children: <Widget>[
//          Card(
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                AspectRatio(
//                  aspectRatio: 18.0 / 11.0,
//                  child: Image.asset('assets/diamond.png'),
//                ),
//                new Padding(
//                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0,8.0),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text('Title'),
//                      SizedBox(height: 8.0),
//                      Text('secondary Text'),
//                    ],
//                  ),)
//              ],
//            ),
//          )
//        ],
      ),

      // TODO: Add a grid view (102)
//      body: Center(
//        child: Text('You did it!'),
//      ),
    );
  }
}

// TODO: Make a collection of cards (102)
List<Card> _buildGridCards(BuildContext context) {
  List<Product> product = getProducts(Category.all);
  if(product == null || product.isEmpty){
    return const <Card>[];
  }
  final ThemeData theme = Theme.of(context);
  final NumberFormat formatter = NumberFormat.simpleCurrency(
    locale: Localizations.localeOf(context).toString());

  return product.map((product) {
    return Card(
      // TODO: Adjust card heights (103)

      elevation: 0.0,

      child: Column(
        // TODO: Center items on the card (103)
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          AspectRatio(
            aspectRatio: 18 / 11,
            child: Image.asset(
              product.assetName,
              package: product.assetPackage,
              fit: BoxFit.fitWidth,
              // TODO: Adjust the box size (102)
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                // TODO: Align labels to the bottom and center (103)
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // TODO: Handle overflowing labels (103)
                  Text(
                    product == null ? '' : product.name,
                    style: theme.textTheme.button,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    product == null ? '' : formatter.format(product.price),
                    style: theme.textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }).toList();

//  List<Card> cards = List.generate(
//    count,
//    (int index) => Card(
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              AspectRatio(
//                aspectRatio: 18.0 / 11.0,
//                child: Image.asset('assets/diamond.png'),
//              ),
//              Padding(
//                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text('Title'),
//                    SizedBox(height: 8.0),
//                    Text('Secondary Text'),
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//  );
//
//  return cards;
}
