import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipiapp/Screens/chatScreen.dart';
import 'package:recipiapp/components/bottomNavigation.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class MsgDetails {
  String? name;
  String? time;
  String? imgPath;
  //UID is needed from the users collection
  MsgDetails({this.name, this.time, this.imgPath});
}

List<MsgDetails> myTexts = [
  MsgDetails(
    name: "Ganidu",
    time: "Seen on Tuesday",
    imgPath: "images/user7.jpg",
  ),
  MsgDetails(
    name: "Sachin",
    time: "Seen on Tuesday",
    imgPath: "images/user1.jpg",
  ),
  MsgDetails(
    name: "Sajitha",
    time: "Seen on Tuesday",
    imgPath: "images/user2.jpg",
  ),
  MsgDetails(
    name: "Geevinda",
    time: "Seen on Tuesday",
    imgPath: "images/user3.jpg",
  ),
  MsgDetails(
    name: "Yasiru",
    time: "Seen on Tuesday",
    imgPath: "images/user4.jpg",
  ),
  MsgDetails(
    name: "Binath",
    time: "Seen on Tuesday",
    imgPath: "images/user5.jpg",
  ),
  MsgDetails(
    name: "Isuru",
    time: "Seen on Tuesday",
    imgPath: "images/user6.jpg",
  ),
];

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      bottomNavigationBar:
          SizedBox(height: 70, child: BottomMainNavigationBar()),
      gradient: LinearGradient(
        colors: [
          Color(0xFF444141), // #444141
          Color(0xFF1D1C1C), // #1D1C1C
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
      appBar: AppBar(
        toolbarHeight: 86,
        backgroundColor: Color(0xFFD77E15),
        title: Text(
          "Messages",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: 'Poppins',
            color: Color(0xFFFFFFFF),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Requests",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                color: Color(0xFF222222),
              ),
            ),
          )
        ],
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                ...myTexts.map((i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(name: i.name),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFD9D9D9),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Image.asset(i.imgPath!),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      i.name!,
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      i.time!,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Poppins",
                                        color: Color(0xFF000000),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {},
                              child: ImageIcon(
                                AssetImage("images/camera.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
