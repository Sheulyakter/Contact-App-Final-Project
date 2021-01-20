import 'package:assignment_flutter_intern/src/model/hero.dart' as model;
import 'package:assignment_flutter_intern/src/utils/constraints.dart';
import 'package:assignment_flutter_intern/src/utils/helper.dart';
import 'package:flutter/material.dart';


class UpdateHero extends StatefulWidget {
  final int id;
  final Function() onSuccess;

  UpdateHero({this.id, this.onSuccess});
  @override
  _UpdateHeroState createState() => _UpdateHeroState();
}

class _UpdateHeroState extends State<UpdateHero> {

  TextEditingController nameController = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController addController = TextEditingController();
  TextEditingController gmailController = TextEditingController();

  model.Hero hero ;


  void initState() {
    hero = Helper.getHeroById(widget.id);
     nameController.text = hero.name;
     numController.text = hero.number as String;
     addController.text = hero.subName;
     gmailController.text = hero.gmail;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.deepOrange,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        // title: Text(hero.name),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Edit Contact", style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w700,fontFamily: 'Libre_Baskerville',),),
        actions: [
          IconButton(icon: Icon(Icons.more_vert_rounded,color: Colors.deepOrange,size: 34,), onPressed: () {
          }),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        padding: EdgeInsets.all(24),
        children: [
          TextField(
            controller: nameController,
          ),
          SizedBox(height: 12,),
          TextField(
            controller: addController,
          ),

          SizedBox(height: 12,),
          TextField(
            controller: numController,
          ),
          SizedBox(height: 12,),
          TextField(
            controller: gmailController,
          ),

          SizedBox(height: 12,),

          RaisedButton(
            color: Colors.deepOrange.shade100,
              splashColor: Colors.indigo,
              onPressed: () {
                   hero.name = nameController.text;
                   hero.subName = addController.text;
                   hero.number = numController.text;
                   hero.gmail = gmailController.text;

                   if(Helper.updateHero(hero)) {
                     widget.onSuccess();
                     Navigator.of(context).pop();
                   } else {
                     print("Update falied");
                   }
              },
          child: Text("Save"),
          ),
        ],
      ) ,
    );
  }
}
