import 'package:flutter/material.dart';
import 'package:movie_app_flutter/utils/text.dart';

class menu extends StatefulWidget {
  const menu({Key? key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            child: Container(
              height: 200,
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 100,
                foregroundImage: AssetImage(""),
                backgroundImage: AssetImage("assets/images/img_5.png"),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            // color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Madrid City Tour for Designers',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('This is a random description of the topic',
                    style:
                    TextStyle(fontSize: 15, color: Colors.grey.shade200)),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                rowIconText('20', Icons.favorite_rounded),
                rowIconText('34', Icons.upload),
                rowIconText('82', Icons.message),
                rowIconText('295', Icons.share)
              ],
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
                "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry's standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?"),
          ),
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            child:modified_text(text: "your favourat Movies List...", color: Colors.white, size: 26)
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Card(
                color: Colors.blueAccent,
                child: Container(
                  height: 120,
                  width: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/img_4.png"),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                ),
              ),
              Card(
                color: Colors.blueAccent,
                child: Container(
                  height: 120,
                  width: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/img_3.png"),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                ),
              ),
              Card(
                color: Colors.blueAccent,
                child: Container(
                  height: 120,
                  width: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/img_2.png"),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                ),
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),iconSize: 30,),
              IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_outline_outlined),iconSize: 50,),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward),iconSize: 30,)
            ],
          )

        ],
      )
    );

  }
}
Widget rowIconText(String text, IconData icon) {
  return Row(
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        width: 5,
      ),
      Icon(icon)
    ],
  );
}

