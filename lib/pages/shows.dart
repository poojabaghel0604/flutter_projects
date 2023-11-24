import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../widgets/toprated.dart';
import '../widgets/trending.dart';
import '../widgets/tv.dart';
import 'movie.dart';

class shows extends StatelessWidget {
  final List tv, topratedmovies, trendingmovies;
  const shows({Key? key,
    required this.tv,
    required this.trendingmovies,
    required this.topratedmovies}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/img_5.png"),
                fit: BoxFit.cover
              ),
              boxShadow: [
                BoxShadow(color:Colors.black12,spreadRadius: -7,blurRadius: 20 )
              ]
            ),
            height: 300,
            width: MediaQuery
                .of(context)
                .size
                .width,
          ),
          SizedBox(height: 30,),
          TV(tv: tv),

          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/img_4.png"),
                    fit: BoxFit.cover
                ),
                boxShadow: [
                  BoxShadow(color:Colors.black12,spreadRadius: -7,blurRadius: 20 )
                ]
            ),
            height: 250,
            width: MediaQuery
                .of(context)
                .size
                .width,
          ),
          TrendingMovies(
            trending: trendingmovies,
          ),

          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/img_5.png"),
                    fit: BoxFit.cover
                ),
                boxShadow: [
                  BoxShadow(color:Colors.black12,spreadRadius: -7,blurRadius: 20 )
                ]
            ),
            height: 250,
            width: MediaQuery
                .of(context)
                .size
                .width,
          ),
          TopRatedMovies(
            toprated: topratedmovies,
          ),
        ],
      ),

    );
  }
}
