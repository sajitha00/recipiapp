import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipiapp/components/bottomNavigation.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class msgDetails {
  String? name;
  String? time;
  String? imgPath;
  msgDetails({this.name, this.time, this.imgPath});
}

List<msgDetails> myTexts = [
  msgDetails(
    name: "Ganidu",
    time: "Seen on Tuesday",
    imgPath: "images/user7.jpg",
  ),
  msgDetails(
    name: "Sachin",
    time: "Seen on Tuesday",
    imgPath: "images/user1.jpg",
  ),
  msgDetails(
    name: "Sajitha",
    time: "Seen on Tuesday",
    imgPath: "images/user2.jpg",
  ),
  msgDetails(
    name: "Geevinda",
    time: "Seen on Tuesday",
    imgPath: "images/user3.jpg",
  ),
  msgDetails(
    name: "Yasiru",
    time: "Seen on Tuesday",
    imgPath: "images/user4.jpg",
  ),
  msgDetails(
    name: "Binath",
    time: "Seen on Tuesday",
    imgPath: "images/user5.jpg",
  ),
  msgDetails(
    name: "Isuru",
    time: "Seen on Tuesday",
    imgPath: "images/user6.jpg",
  ),
];

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
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
              ))
        ],
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(25),
              child: Expanded(
                child: Column(
                  children: [
                    ...myTexts.map((i) {
                      return Container(
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
                                      child: Image.asset(i.imgPath!)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        i.name!,
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.black),
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

                              //SizedBox(width:100 ,),
                              InkWell(
                                onTap: () {},
                                child: ImageIcon(
                                  AssetImage("images/camera.png"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
