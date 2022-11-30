import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  final BuildContext? context;

  const HomeScreen({this.context, Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _showDialog();
  }

  _showDialog() async {
    await Future.delayed(const Duration(milliseconds: 50));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
            contentPadding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 12.0),
            titlePadding: const EdgeInsets.only(left: 63.5, right: 63.5),
            title: const Text(
              "Har safar yangi rasm, siz uchun",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xff121212),
                fontSize: 14,
              ),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height*.3,
              width: MediaQuery.of(context).size.width * .8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.red,
              ),
            ),
            actions: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * .8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff00AFFF),
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        titleSpacing: 24,
        elevation: 0,
        title: const Text(
          "ROUNDED TASK",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xff121212),
            fontSize: 16,
          ),
        ),
        backgroundColor: const Color(0xffffffff),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        color: const Color(0xffFFFFFF),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ElevatedButton(onPressed: (){
              //   showDialog(
              //   context: context,
              //   builder: (context) => AlertDialog(
              //     title: Text("salom"),
              //     content: Text("hdsvbkhvbhkdvb"),
              //     actions: [TextButton(onPressed: () {Navigator.pop(context);}, child: Text("ok"))],
              //   ),
              // );}, child: Text("ok")),
              // first video section
              videoCard(),
              buttonsRow(),
              Container(
                margin: const EdgeInsets.only(top: 32, bottom: 24),
                height: 2.5,
                color: const Color(0xffF2F2F2),
                width: MediaQuery.of(context).size.width * 0.9,
              ),
              showVideCard(),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    taskCard(
                      const Color(0xff2898FD),
                      "Grammar",
                      "assets/svg_icons/book_icon.svg",
                      "assets/svg_icons/Vector.svg",
                      "assets/svg_icons/0%.svg",
                      MediaQuery.of(context).size.width * 0.43,
                      MediaQuery.of(context).size.height * 0.25,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    taskCard(
                      const Color(0xff00BC96),
                      "Vocabulary",
                      "assets/svg_icons/book_icon.svg",
                      "assets/svg_icons/Vector.svg",
                      "assets/svg_icons/0%.svg",
                      MediaQuery.of(context).size.width * 0.43,
                      MediaQuery.of(context).size.height * 0.25,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    taskCard(
                      const Color(0xff2898FD),
                      "Speaking",
                      "assets/svg_icons/speaking_icon.svg",
                      "assets/svg_icons/Vector.svg",
                      "assets/svg_icons/0%.svg",
                      MediaQuery.of(context).size.width * 0.43,
                      MediaQuery.of(context).size.height * 0.25,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    taskCard(
                      const Color(0xff00BC96),
                      "Listening",
                      "assets/svg_icons/headphones_icon.svg",
                      "assets/svg_icons/Vector.svg",
                      "assets/svg_icons/0%.svg",
                      MediaQuery.of(context).size.width * 0.43,
                      MediaQuery.of(context).size.height * 0.25,
                    ),
                  ],
                ),
              ),
              homeWorkCard(
                  const Color(0xff2898FD),
                  "Homework",
                  "assets/svg_icons/trophy_icon.svg",
                  "assets/svg_icons/0%.svg",
                  "assets/svg_icons/Vector.svg",
                  "Bu joyda barcha ishtirokchilar\ndarajalari bilan tanishing"),
            ],
          ),
        ),
      ),
    );
  }

  Widget videoCard() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 96,
            width: 96,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.red,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Lesson 2",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff828282))),
              SizedBox(
                height: 8,
              ),
              Text(
                "How to talk about nation\nAsilbek Asqarov Asilbek",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color(0xff4F4F4F),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buttonsRow() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: saveButton(),
          ),
          InkWell(
            onTap: () {},
            child: downlandButton(),
          ),
        ],
      ),
    );
  }

  Widget saveButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.44,
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xfffffFFF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xff00AFFF),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "Saqlab qo’yish",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff00AFFF),
            ),
          ),
          SvgPicture.asset("assets/svg_icons/bookmark_icon.svg"),
        ],
      ),
    );
  }

  Widget downlandButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.44,
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xff00AFFF),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "Yuklab olish",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xffFFFFFF),
            ),
          ),
          SvgPicture.asset("assets/svg_icons/icloud_arrow.svg"),
        ],
      ),
    );
  }

  Widget showVideCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.red,
      ),
    );
  }

  Widget taskCard(
    Color color,
    String title,
    String image,
    String image1,
    String image2,
    double width,
    double height,
  ) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
        ),
        Positioned(
          left: 16,
          top: 17.4,
          child: SvgPicture.asset(image),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: SvgPicture.asset(image1),
        ),
        Positioned(
          left: 12,
          bottom: 36,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Color(0xffFFFFFF),
            ),
          ),
        ),
        Positioned(
          right: 20,
          bottom: 12,
          child: SvgPicture.asset(image2),
        ),
        Positioned(
          left: 12,
          bottom: 15,
          child: Container(
            height: 8,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color(0xffffffff).withOpacity(.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget homeWorkCard(
    Color color,
    String title,
    String image,
    String image1,
    String image2,
    String description,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .93,
            height: MediaQuery.of(context).size.height * .2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color,
            ),
          ),
          Positioned(
            left: 12,
            top: 12,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * .33,
            bottom: 12,
            child: SvgPicture.asset(image1),
          ),
          Positioned(
            left: 12,
            bottom: 15,
            child: Container(
              height: 8,
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0xffffffff).withOpacity(.5),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: SvgPicture.asset(image2),
          ),
          Positioned(
            right: 16,
            top: 26,
            child: SvgPicture.asset(image),
          ),
          Positioned(
            left: 12,
            top: 50,
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xffffffff),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
