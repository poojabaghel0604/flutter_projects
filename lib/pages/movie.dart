import 'package:flutter/material.dart';
import '../utils/text.dart';
import 'description.dart';
class Movie extends StatelessWidget {
  final List toprated;
  const Movie({Key? key ,required this.toprated}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
              text: 'Movies..',
              size: 26,
              color:Colors.white
          ),
          SizedBox(height: 10),
          Container(
              height: 500,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: toprated.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                  name: toprated[index]['title'],
                                  bannerurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                      toprated[index]['backdrop_path'],
                                  posterurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                      toprated[index]['poster_path'],
                                  description: toprated[index]['overview'],
                                  vote: toprated[index]['vote_average']
                                      .toString(),
                                  launch_on: toprated[index]
                                  ['release_date'],
                                )
                            )
                        );
                      },
                      child: Container(
                        width: 250,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          toprated[index]['poster_path']),
                                ),
                              ),
                              height: 400,
                            ),
                            SizedBox(height: 10),
                            Container(
                              child:modified_text(size: 15,color:Colors.white,
                                  text: toprated[index]['title'] != null
                                      ? toprated[index]['title']
                                      : 'Loading'),
                              height: 40,
                              color: Colors.black,
                            ),
                            modified_text(text: '⭐ Average Rating - ' + toprated[index]['vote_average'].toString(),
                              color:Colors.white,size: 26,),
                            SizedBox(height: 40),

                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
