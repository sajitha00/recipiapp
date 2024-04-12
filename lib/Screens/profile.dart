import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipiapp/components/bottomNavigation.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    String name = "Ganindu Happuarachchi";
    String subText = "Sunmanasiri";
    String description =
        "Flaky flatbreads are served alongside curries or stuffed with flavorful fillings.";
    String imgPath = "images/containImg.png";
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        colors: [
          Color(0xFF444141), // #444141
          Color(0xFF1D1C1C), // #1D1C1C
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
      bottomNavigationBar:
          SizedBox(height: 70, child: BottomMainNavigationBar()),
      appBar: AppBar(
        toolbarHeight: 86,
        backgroundColor: Color(0xFFD77E15),
        title: Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: 'Poppins',
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Expanded(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xFFD0D0D0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("images/Profileuser.png"),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ganindu Happuarachchi",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Restaurant Chef:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      "The backbone of the professional kitchen, leading a team and ensuring smooth operations while creating delicious dishes. They may specialize in a certain cuisine or be known for their innovative flair.")
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Follow",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    color: Colors.white,
                                  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color.fromRGBO(0, 135, 255, 0.7),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFD0D0D0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                print("profile clicked");
                              },
                              child: ImageIcon(
                                AssetImage("images/user2.png"),
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  subText,
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w200,
                                      height: 0.8,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.2,
                      ),
                      Image(image: AssetImage(imgPath)),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 6,
                          right: 6,
                          top: 4,
                        ),
                        child: Text(
                          description,
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 6,
                          top: 2,
                          bottom: 6,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.favorite_border),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.share_rounded),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.chat_bubble_outline),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
