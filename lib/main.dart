import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_app_flutter/pages/home.dart';
import 'package:movie_app_flutter/pages/menu.dart';
import 'package:movie_app_flutter/pages/movie.dart';
import 'package:movie_app_flutter/pages/search.dart';
import 'package:movie_app_flutter/pages/shows.dart';
import 'package:movie_app_flutter/pages/sports.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Hoome(),
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.white,
      ),
    );
  }
}
class Hoome extends StatefulWidget {
  @override
  _HoomeState createState() => _HoomeState();
}

class _HoomeState extends State<Hoome> {

  final String apikey = '1ef8b3ffdd4691f44c60f759aae5ba3e';
  final String readaccesstoken = ''
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZWY4YjNmZmRkNDY5MWY0NGM2MGY3NTlhYWU1YmEzZSIsInN1YiI6IjY0ZTMzMDAxMDc2Y2U4NDNiYTczOTcxMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TCP_jQBIVYHYr1mlD4RuVJ2Q46N_ywey08NRYrjeWxo';
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
  }
  int selectindex=0;
  PageController pageController=PageController();

  void onTaped(int index){
    setState(() {
      selectindex=index;
    });
    pageController.jumpToPage(index);
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      endDrawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              DrawerHeader(padding: EdgeInsets.zero,
                  child: Container(
                    //color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: Row(children: [
                      CircleAvatar(radius: 40,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(""),),
                      SizedBox(width:10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("pooaj baghel",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight:FontWeight.bold),),
                          Text("pooajbaghel0604@gmail.com",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),),
                        ],)
                    ],),
                  )),
              ListTile(
                leading: Icon(Icons.folder),
                title: Text("My folder"),
                iconColor: Colors.white,
                textColor: Colors.white,
              ),ListTile(
                leading: Icon(Icons.group),
                title: Text("share with "),
                iconColor: Colors.white,
                textColor: Colors.white,
              ),ListTile(
                leading: Icon(Icons.star),
                title: Text("started"),
                iconColor: Colors.white,
                textColor: Colors.white,
              ),ListTile(
                leading: Icon(Icons.delete),
                title: Text("Trash"),
                iconColor: Colors.white,
                textColor: Colors.white,
              ),ListTile(
                leading: Icon(Icons.upload),
                title: Text("uploadeds"),
                iconColor: Colors.white,
                textColor: Colors.white,
              ),

              Divider(),
              ListTile(
                leading: Icon(Icons.share),
                title: Text("share"),
                iconColor: Colors.white,
                textColor: Colors.white,
              ),ListTile(
                leading: Icon(Icons.logout),
                title: Text("log out"),
                iconColor: Colors.white,
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:Colors.pinkAccent,
          ),
          child: Icon(Icons.ondemand_video, color: Colors.white, size: 30),
        ),
        title: Text("My Cenima", style: TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold,),),
        backgroundColor: Colors.black,
        actions: <Widget>[

        ],
      ),



      body: PageView(
        controller: pageController,
        children:[
          Home(tv:tv, topratedmovies: topratedmovies, trendingmovies: trendingmovies),
          Day19(),
          Movie(toprated: topratedmovies,),
          shows(tv:tv, topratedmovies: topratedmovies, trendingmovies: trendingmovies),
          menu()]
      ),



      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, color: Colors.white,),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_cricket, color: Colors.white,),
                label: "sports"),
            BottomNavigationBarItem(
                icon: Icon(Icons.ondemand_video_sharp, color: Colors.white,),
                label: "Movie"),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_collection, color: Colors.white,),
                label: "TV Shows"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle, color: Colors.white,), label: "Profile"),
          ],
          currentIndex: selectindex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.pinkAccent,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: onTaped,
        ),
      ),
    );
  }
}


class Drawerwigets extends StatefulWidget {
  const Drawerwigets({Key? key});

  @override
  State<Drawerwigets> createState() => _DrawerwigetsState();
}

class _DrawerwigetsState extends State<Drawerwigets> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        endDrawer: Drawer(
          child: Container(
            color: Colors.black,
            child: ListView(
              children: [
                DrawerHeader(padding: EdgeInsets.zero,
                    child: Container(
                      //color: Colors.white,
                      padding: EdgeInsets.all(10),
                      child: Row(children: [
                        CircleAvatar(radius: 40,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(""),),
                        SizedBox(width:10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("pooaj baghel",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight:FontWeight.bold),),
                            Text("pooajbaghel0604@gmail.com",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),),
                          ],)
                      ],),
                    )),
                ListTile(
                  leading: Icon(Icons.folder),
                  title: Text("My folder"),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                ),ListTile(
                  leading: Icon(Icons.group),
                  title: Text("share with "),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                ),ListTile(
                  leading: Icon(Icons.star),
                  title: Text("started"),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                ),ListTile(
                  leading: Icon(Icons.delete),
                  title: Text("Trash"),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                ),ListTile(
                  leading: Icon(Icons.upload),
                  title: Text("uploadeds"),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                ),

                Divider(),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text("share"),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                ),ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("log out"),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text("Drawer"),),
        body: Container(child: Center(child: Text("May there"),),)
    );
  }
}
