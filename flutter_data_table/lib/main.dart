import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Widget bodyData() => DataTable(
      onSelectAll: (b) {},
      sortColumnIndex: 1,
      sortAscending: true,
      //테이블의 컬럼 생성하기
      columns: <DataColumn>[
        DataColumn(
            label: Text("First Name"),
            numeric: false,
            onSort: (i, b) {
              print('$i $b');
              setState(() {
                names.sort((a,b) => a.firstName.compareTo(b.firstName));
              });

            },
            tooltip: "To display first name of the name"),
        DataColumn(
            label: Text("Last Name"),
            numeric: false,
            onSort: (i, b) {
              setState(() {
                names.sort((a,b) => a.lastName.compareTo(b.lastName));
              });
            },
            tooltip: "To display Last name of the name"),
      ],
      rows: names
          .map((name) => DataRow(
//              onSelectChanged: (b){},
//          selected: true,
                  cells: [
                    DataCell(Text(name.firstName),
                        showEditIcon: false, placeholder: false),
                    DataCell(Text(name.lastName),
                        showEditIcon: false, placeholder: false)
                  ]))
          .toList()
//          DataRow(
//            cells: <DataCell>[
//              DataCell(Text("jeff"), placeholder: true,  showEditIcon: true, onTap: (){
//              }),
//              DataCell(Text("rey")),
//            ]
//          ),
//          DataRow(
//              cells: <DataCell>[
//                DataCell(Text("jeff"), ),
//                DataCell(Text("rey")),
//              ]
//          )

      );

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Data Table',
      theme: new ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Data Table"),
        ),
        body: Container(
          child: bodyData(),
        ),
      ),
//      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class Name {
  String firstName;
  String lastName;

  Name({this.firstName, this.lastName});
}

var names = <Name>[
  Name(firstName: "paul", lastName: "a"),
  Name(firstName: "jhon", lastName: "b"),
  Name(firstName: "jeff", lastName: "c"),
  Name(firstName: "william", lastName: "d"),
  Name(firstName: "state", lastName: "e"),
];
