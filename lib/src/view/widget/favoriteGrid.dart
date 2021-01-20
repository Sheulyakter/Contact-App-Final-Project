import 'package:assignment_flutter_intern/src/utils/helper.dart';
import 'package:assignment_flutter_intern/src/model/hero.dart' as model;
import 'package:flutter/material.dart';
import 'package:assignment_flutter_intern/src/view/screen_hero_details.dart';
import 'package:assignment_flutter_intern/src/view/widget/widget_insert_hero.dart';
import 'package:assignment_flutter_intern/src/utils/constraints.dart';

class grid_list extends StatefulWidget{
  @override
  _grid_listState createState() => _grid_listState();
}

class _grid_listState extends State<grid_list> {

  List<model.Hero> herolist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.deepOrange,),
            onPressed: () => Navigator.of(context).pop(),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: true,
          // title: Text(hero.name),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            IconButton( icon: Icon(Icons.more_vert_rounded,color: Colors.deepOrange,size: 27,),
              color: Colors.deepOrange.shade50, onPressed: () {  },
            ),
          ],
        ),
        body: GridView.count(crossAxisCount: 2,
          children: <Widget>[
            Card(
              color: Colors.indigo.shade100,
              child: Stack(
                children: <Widget>[
                  Center(

                  ),
                  Container(
                    margin: EdgeInsets.only(top: 160,left:120),
                    child: Text("",style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            Card(
              color: Colors.orange.shade100,
              child: Stack(
                children: <Widget>[
                  Center(
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 160,left:100),
                    child: Text('',style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
