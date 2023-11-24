import 'package:flutter/material.dart';
import 'package:movie_app_flutter/widgets/toprated.dart';
import 'package:movie_app_flutter/widgets/trending.dart';
import 'package:movie_app_flutter/widgets/tv.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Home extends StatelessWidget {
  final List tv, topratedmovies, trendingmovies;
  const Home({Key? key,required this.tv,required this.trendingmovies,required this.topratedmovies}): super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/images/img_1.png",
      "assets/images/img_2.png",
      "assets/images/img_3.png",
      "assets/images/img_4.png",
      "assets/images/img_5.png",
      "assets/images/img_6.png",
      "assets/images/img_7.png",
      "assets/images/img_8.png",
      "assets/images/img_9.png"
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(height: 10,),
          Container(
            height: 250,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: CarouselSlider.builder(
                disableGesture: true,
                carouselController: CarouselController(),
                itemCount: images.length,
                itemBuilder: (BuildContext context, int itemIndex,
                    int pageViewIndex) =>
                    Container(
                      child: Image.asset(
                        images[itemIndex],
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ),
                options: CarouselOptions(
                  aspectRatio: 20 / 10,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.5,
                  scrollDirection: Axis.horizontal,
                )),
          ),
          TV(tv: tv),
          TrendingMovies(
            trending: trendingmovies,
          ),
          TopRatedMovies(
            toprated: topratedmovies,
          ),
          TV(tv:tv),
          TrendingMovies(trending: trendingmovies),
          TopRatedMovies(toprated: topratedmovies)
        ],
      ),

    );
  }
}