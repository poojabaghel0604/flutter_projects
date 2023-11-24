import 'package:flutter/material.dart';

import '../utils/text.dart';

class Day19 extends StatefulWidget {
  const Day19({Key? key}) : super(key: key);

  @override
  _Day19State createState() => _Day19State();
}

class _Day19State extends State<Day19> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            Stack(children: [
              Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/img_5.png")
                        )
                    ),
                    // color: Colors.yellow,
                    child: Stack(
                      children: [
                        Positioned(
                            child: Container(
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'http://www.mandysam.com/img/random.jpg'))),
                              height: 450,
                            )),
                        Positioned(
                            bottom: 0,
                            right: 24,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  "assets/img.png"),
                              radius: 50,
                            )),
                      ],
                    ),
                  )),
              Positioned(
                bottom: 100,
                height: 30,
                width: 110,
                child: Container(
                  child: Row(
                    children: [
                      Center(child: IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_outline_outlined),iconSize: 20,)),
                      Center(child: Text(" Watch",style: TextStyle(fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink,
                  ),
                ),
                  ),
              Positioned(
                bottom: 60,
                  child:modified_text(text: " Top Sports Here...", color: Colors.white, size: 25)
              ),
              Positioned(
                  bottom: 10,
                  child: modified_text(text: '⭐ Average Rating - 4.5',
                    color:Colors.white,size: 26,)),
            ]
            ),
            SizedBox(height: 30),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),iconSize: 50,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_outline_outlined),iconSize: 100,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward),iconSize: 50,)
                ],
              ),

          ],
        ),
      ),
    );
  }
}
