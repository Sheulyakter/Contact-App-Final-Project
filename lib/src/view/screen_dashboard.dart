import 'package:assignment_flutter_intern/src/model/hero.dart' as model;
import 'package:assignment_flutter_intern/src/utils/helper.dart';
import 'package:assignment_flutter_intern/src/view/screen_hero_details.dart';
import 'package:assignment_flutter_intern/src/view/widget/widget_insert_hero.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

 List<model.Hero> herolist = [];


 @override
  void initState() {
   herolist = Helper.getAllHeroes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
       title: Text("Contacts", style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w700,fontFamily: 'Libre_Baskerville',),),
        actions: [
         IconButton(icon: Icon(Icons.add,color: Colors.red.shade300,size: 35,), onPressed: () {
           Navigator.of(context).push(MaterialPageRoute(
             builder: (context)=>InsertHero(
               onSuccess: () {
                 setState(() {
                   herolist = Helper.getAllHeroes();
                 });
               },),
           ),
           );
         }),
        ],
      ),
      
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.all(14),
               width: MediaQuery.of(context).size.width,
              height:  50,
              child: TextField(
                onChanged: (key) {
                  setState(() {
                    if(key.isNotEmpty) {
                      herolist = Helper.searchHero(key);
                    } else {
                      herolist = Helper.getAllHeroes();
                    }
                  });
                },
                     decoration: InputDecoration(
                       fillColor: Colors.deepPurpleAccent.shade50,
                       filled: true,
                       hintText: "Search",hintStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                       prefixIcon: Icon(Icons.search,size: 30,),
                       border: InputBorder.none,
                     ),
              ),
            ),
            Expanded(
                child: ListView.builder(

              itemBuilder: (context, index) {
                model.Hero hero = herolist[index];
                return ListTile(
                  contentPadding: EdgeInsets.only(bottom: 20,left: 13),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HeroDetails(id: hero.id, onRefresh: () {
                      setState(() {
                        herolist = Helper.getAllHeroes();
                      });
                    },),
                    ),
                    );
                  },
           leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 64,
                      minHeight: 64,
                      maxWidth: 64,
                      maxHeight: 64,
                    ),
             child: Container(child: Center(
               child: Text("${herolist[index].name[0]}",
                 style: TextStyle(fontSize: 27,color: Colors.deepOrange,fontWeight: FontWeight.w800),),
             ),decoration: BoxDecoration(
               border: Border.all(width: 1, color: Colors.red.shade100),
               borderRadius: BorderRadius.all(Radius.circular(9)),
               color: Colors.deepOrange.shade50,
             ),
             ),
                  ),
                    title: Text(hero.name,style: TextStyle(fontSize: 20, fontFamily: 'Roboto',fontWeight: FontWeight.w500),),
                    subtitle: Text(hero.subName,style: TextStyle(fontSize: 19, fontFamily: 'PT_Sans',fontWeight: FontWeight.w400),),
                );
              },
              itemCount: herolist.length,
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),))
          ],
        ),
      )
    );
  }
}
