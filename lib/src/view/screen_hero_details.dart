import 'package:assignment_flutter_intern/src/model/hero.dart' as model;
import 'package:assignment_flutter_intern/src/utils/constraints.dart';
import 'package:assignment_flutter_intern/src/utils/helper.dart';
import 'package:assignment_flutter_intern/src/view/widget/favoriteGrid.dart';
import 'package:assignment_flutter_intern/src/view/widget/widget_update_hero.dart';
import 'package:flutter/material.dart';
import 'package:assignment_flutter_intern/src/view/screen_dashboard.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroDetails extends StatefulWidget {
  final int id;
  final Function onRefresh;
  HeroDetails({this.id,this.onRefresh});


  @override
  _HeroDetailsState createState() => _HeroDetailsState();
}

class _HeroDetailsState extends State<HeroDetails> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    model.Hero hero = Helper.getHeroById(widget.id);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
       // title: Text(hero.name),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(icon: Icon(Icons.star_border, color: Colors.deepOrange,size: 27,
          ),
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
            },

              ),
          IconButton(icon: Icon(Icons.delete,color: Colors.deepOrange,size: 27),
              onPressed: () {
            _showDialog(context);
          } ),
          PopupMenuButton<String>( icon: Icon(Icons.more_vert_rounded,color: Colors.deepOrange,size: 27,),
            color: Colors.deepOrange.shade50,
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return model.Constraints.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                    child: Text(choice),
                );
              }).toList();

            },
             ),
        ],
      ),

      backgroundColor: Colors.white,
     body: Container(
       alignment: Alignment.topCenter,

       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             SizedBox(height: 25,),
             Container(
               height: 150,
               width: 150,
               child: Container(child: Center(
                 child: Text("${hero.name[0]}",
                   style: TextStyle(fontSize: 27,color: Colors.deepOrange,fontWeight: FontWeight.w800),),
               ),decoration: BoxDecoration(
                 border: Border.all(width: 1, color: Colors.red.shade100),
                 borderRadius: BorderRadius.all(Radius.circular(9)),
                 color: Colors.deepOrange.shade50,
               ),), ),
             SizedBox(height: 20,),
             Text(hero.name, style: TextStyle(fontSize: 20, fontFamily: 'Roboto',fontWeight: FontWeight.w500),),
             SizedBox(height: 12,),
             Text(hero.subName,style: TextStyle(fontSize: 19, fontFamily: 'PT_Sans',fontWeight: FontWeight.w400,color: Colors.grey),),
             SizedBox(height: 35,),
             Categories(),
             SizedBox(height: 35,),
             Container(
               child: Column(
                 children: [
                   ListTile(
                     title: Text(hero.number,style: TextStyle(fontSize: 20, fontFamily: 'Roboto',fontWeight: FontWeight.w500),),
                     subtitle: Text("Mobile Number",style: TextStyle(fontSize: 14, fontFamily: 'PT_Sans',fontWeight: FontWeight.w400),),
                     trailing: Wrap(
                       children:  [
                         Ink(
                           decoration: ShapeDecoration(
                             color: Colors.deepPurple.shade50,
                             shape: CircleBorder(),
                           ),
                           child: IconButton(
                             icon: Icon(Icons.call),
                             color: Colors.deepPurple,
                             onPressed:() => launch("tel:${hero.number}"),
                             tooltip: 'Tap to Call',
                           ),
                         ),
                         SizedBox(width: 10,),
                         Ink(
                           decoration: ShapeDecoration(
                             color: Colors.deepOrange.shade50,
                             shape: CircleBorder(),
                           ),
                           child: IconButton(
                             icon: Icon(Icons.textsms_outlined),
                             color: Colors.deepOrange,
                             tooltip: 'Tap to Text',
                             onPressed:() => launch("sms:${hero.number}"),
                           ),
                         ),

                       ],
                     ),
                     leading: IconButton(
                       highlightColor: Colors.deepOrange,
                       onPressed:() {},
                       icon: Icon(Icons.phone),
                       color: Colors.deepPurple,
                       tooltip: 'Tap to Call',
                       iconSize: 27,
                     ),
                   ),

                   ListTile(
                     title: Text("live.beakerbisto",style: TextStyle(fontSize: 20, fontFamily: 'Roboto',fontWeight: FontWeight.w500),),
                     subtitle: Text("Skype Account",style: TextStyle(fontSize: 14, fontFamily: 'PT_Sans',fontWeight: FontWeight.w400),),
                     trailing: Wrap(
                       children:  [
                         Ink(
                           decoration: ShapeDecoration(
                             color: Colors.deepPurple.shade50,
                             shape: CircleBorder(),
                           ),
                           child: IconButton(
                             icon: Icon(Icons.call),
                             color: Colors.deepPurple,
                             onPressed:() => launch("tel:${hero.number}"),
                             tooltip: 'Tap to Call On Skype',
                           ),
                         ),
                         SizedBox(width: 10,),
                         Ink(
                           decoration: ShapeDecoration(
                             color: Colors.deepOrange.shade50,
                             shape: CircleBorder(),
                           ),
                           child: IconButton(
                             icon: Icon(Icons.textsms_outlined),
                             color: Colors.deepOrange,
                             tooltip: 'Tap to Text On Skype',
                             onPressed:() => launch("sms:${hero.number}"),
                           ),
                         ),

                       ],
                     ),
                     leading: ConstrainedBox(
                       constraints: BoxConstraints(
                         minWidth: 44,
                         minHeight: 44,
                         maxWidth: 44,
                         maxHeight: 44,
                       ),
                       child: Image.asset("images/skype.png", fit: BoxFit.cover),
                     ),
                   ),

                   ListTile(
                     title: Text(hero.gmail,style: TextStyle(fontSize: 16, fontFamily: 'Roboto',fontWeight: FontWeight.w500),),
                     subtitle: Text("Gmail Address",style: TextStyle(fontSize: 14, fontFamily: 'PT_Sans',fontWeight: FontWeight.w400),),
                     trailing: Ink(
                       padding: EdgeInsets.symmetric(horizontal: 14),
                           decoration: ShapeDecoration(
                             color: Colors.deepOrange.shade50,
                             shape: CircleBorder(),
                           ),
                           child: IconButton(
                             icon: Icon(Icons.email),
                             color: Colors.deepOrange,
                             onPressed:() {},
                           ),
                         ),

                     leading: ConstrainedBox(
                       constraints: BoxConstraints(
                         minWidth: 40,
                         minHeight: 40,
                         maxWidth: 40,
                         maxHeight: 40,
                       ),
                       child: Image.asset("images/gmail.png", fit: BoxFit.cover),
                     ),
                   ),


                 ],
               ),

             )
           ],
         ),
       ),
     ),

    );
  }
  void choiceAction(String choice){
    if(choice == model.Constraints.Edit)
      {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UpdateHero(
              onSuccess: () {
                widget.onRefresh();
                setState(() {

                });
              }, id: widget.id,),
          ),
        );
      }
    else if(choice== model.Constraints.Stared)
      {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => grid_list(),
          ),
        );
      }
  }

  _showDialog( context) {
    return showDialog(
        context: context,
    builder: (BuildContext context){

          return AlertDialog(
            elevation: 0,
            title: Text("Confirm?"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Are you sure to delete this?")
                ],
              ),
            ),
              actions: <Widget> [
                RaisedButton(
                  elevation: 0,
                  color: Colors.white,
                  child: Text("No"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                RaisedButton(
                  elevation: 0,
                  color: Colors.white,
                  child: Text("Yes"),
                  onPressed: () {
                    if(Helper.deleteHero(widget.id)) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
                      widget.onRefresh();
                    }
                    else {
                      showDialog(context: context,
                        builder: (context)=>AlertDialog(
                          title: Text("Something went wrong"),
                        ),);
                    }
                  },
                ),
              ]
          );
    }
    );
  }

}

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Details", "Call Logs"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(

       padding: const EdgeInsets.symmetric(horizontal: 70,),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                categories[index],
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? Colors.deepOrange.shade500 : Colors.grey,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5), //top padding 5
               height: 2,
                width: 70,
                color: selectedIndex == index ? Colors.deepOrange.shade500 : Colors.transparent,
              )
            ],
          ),
        ),
      ),
    );
  }
}




