

import 'package:assignment_flutter_intern/src/model/hero.dart' as model;
import 'package:assignment_flutter_intern/src/utils/constraints.dart';
import 'package:assignment_flutter_intern/src/utils/helper.dart';
import 'package:assignment_flutter_intern/src/view/screen_dashboard.dart';
import 'package:assignment_flutter_intern/src/view/screen_hero_details.dart';
import 'package:assignment_flutter_intern/src/view/widget/widget_update_hero.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class InsertHero extends StatefulWidget {
  final Function() onSuccess;

  InsertHero({this.onSuccess});
  @override
  _InsertHeroState createState() => _InsertHeroState();
}

class _InsertHeroState extends State<InsertHero> {
PickedFile _imageFile;
final ImagePicker _picker = ImagePicker();

  TextEditingController nameController = TextEditingController();
  TextEditingController addController = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController gmailController = TextEditingController();

  model.Hero hero ;

  Widget buildAnother() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {},
        padding: EdgeInsets.only(right: 0),
        child: Text(
          "Add Another Field",
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
            fontSize: 17
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.deepOrange.shade50,
            radius: 80.0,
            backgroundImage: _imageFile==null
                ? AssetImage("images/p.png")
                :FileImage(File(_imageFile.path)),
          ),
          Positioned(
              top: 5.0,
              right:10.0,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(context: context,
                      builder: ((builder)=>bottomSheet()),
                  );
                },
               child : Icon(
                 Icons.add,
                 color: Colors.deepOrange,
                 size: 35,
               )
              ))
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20
      ),
      child: Column(
        children: [
          Text("Choose profile photo", style: TextStyle( fontSize: 20,),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                  icon: Icon(Icons.camera_alt,color: Colors.deepOrange,),
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                   label: Text("Camera"),),
              FlatButton.icon(
                icon: Icon(Icons.image,color: Colors.deepOrange,),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
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
        title: Text("New Contact", style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w700,fontFamily: 'Libre_Baskerville',),),
      actions: [
        IconButton(icon: Icon(Icons.more_vert_rounded,color: Colors.deepOrange,size: 34,), onPressed: () {
        }),
      ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            children: [
              imageProfile(),
               SizedBox(height: 42),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            filled: false,
                            hintText: "Add Name",hintStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                            prefixIcon: Icon(Icons.person_outline,size: 30,color: Colors.deepOrange,),
                          ),
                        ),
                        SizedBox(height: 25,),
                        TextField(
                          controller: addController,
                          decoration: InputDecoration(
                            filled: false,
                            hintText: "Address",hintStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                            prefixIcon: Icon(Icons.location_on_outlined,size: 30,color: Colors.deepOrange,),
                          ),
                        ),
                        SizedBox(height: 25,),
                        TextField(
                          controller: numController,
                          decoration: InputDecoration(
                            filled: false,
                            hintText: "Mobile Number",hintStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                            prefixIcon: Icon(Icons.call,size: 30,color: Colors.deepPurple,),
                          ),
                        ),
              SizedBox(height: 25,),
              TextField(
                controller: gmailController,
                decoration: InputDecoration(
                  filled: false,
                  hintText: "Add Gmail",hintStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                  prefixIcon: Icon(Icons.location_on_outlined,size: 30,color: Colors.deepOrange,),
                ),
              ),
                        SizedBox(height: 25,),

                        RaisedButton(
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.red)),
                          onPressed: () {
                            // ignore: missing_required_param
                            hero = model.Hero(
                              id: Helper.getAllHeroes().first.id+1,
                              name : nameController.text,
                              subName : addController.text,
                              number: numController.text,
                              gmail: gmailController.text,
                            );

                            if(Helper.createHero(hero)) {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
                              widget.onSuccess();
                            } else {
                              print("Insertion failed");
                            }
                          },
                          color: Colors.deepOrange,
                          textColor: Colors.white,
                          child: Text("Create Contact",
                              style: TextStyle(fontSize: 28)),
                        ),
                      ],
                    ),

              )
    );
  }

}
