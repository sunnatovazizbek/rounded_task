import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rounded_task/widgets/home_work_card.dart';
import 'package:rounded_task/widgets/row_button.dart';
import 'package:rounded_task/widgets/show_vedio_card.dart';
import 'package:rounded_task/widgets/vedio_card.dart';
import 'package:http/http.dart' as http;

import '../widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late VideoPlayerController _controller;
  Timer? timer;
  Timer? countTimer;
  List<bool> _tasks = [];
  String image = '';
  final _getStorage = GetStorage();

  _getImage() async {
    final response = await http
        .get(Uri.parse('https://api.unsplash.com/photos/random'), headers: {
      "Authorization": "Client-ID mT8hj53DywChJkbscZAN5aHio9v2M9impW_i-VIc7vs"
    });
    image = jsonDecode(response.body)['urls']['small'];

    if (image.isNotEmpty) {
      _showDialog();
    }
  }

  @override
  void initState() {
    super.initState();
    if (!(_getStorage.read('access') ?? false)) {
      _getImage();
    }
    _tasks = List.filled(5, false);
  }

  _showDialog() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: MediaQuery.of(context).size.height * .24),
            contentPadding: const EdgeInsets.only(
                left: 16, right: 16, top: 16.0, bottom: 17.0),
            titlePadding:
                const EdgeInsets.only(left: 17, right: 17, top: 17),
            actionsPadding:
                const EdgeInsets.only(bottom: 22, left: 16, right: 16),
            buttonPadding: const EdgeInsets.all(0),
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    InkWell(
                      onTap: (){Navigator.pop(context);},
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset("assets/svg_icons/back_icon.svg"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 9,),
                const Text(
                  "Har safar yangi rasm, siz uchun",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff121212),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            content: Container(
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width * .8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(image))),
            ),
            actions: [
              InkWell(
                onTap: () {
                  _getStorage.write('access', true);
                  Navigator.of(context).pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff00AFFF),
                  ),
                  child: const Text(
                    "To’xtatish",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xffffffff)),
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
              const VideoCard(),
              const RowButton(),
              Container(
                margin: const EdgeInsets.only(top: 32, bottom: 24),
                height: 2.5,
                color: const Color(0xffF2F2F2),
                width: MediaQuery.of(context).size.width * 0.9,
              ),
               const ShowVideCard(),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TaskCard(
                      title: "Grammar",
                      speakingIcon: "assets/svg_icons/book_icon.svg",
                      color: const Color(0xff2898FD),
                      onDoubleTap: () {
                        setState(() {
                          _tasks[0] = false;
                        });
                      },
                      onLongTap: () {
                        int count = 0;
                        countTimer =
                            Timer.periodic(const Duration(seconds: 1), (timer) {
                          count++;
                          if (count == 5) {
                            setState(() {
                              _tasks[0] = true;
                            });
                            countTimer?.cancel();
                          }
                        });
                      },
                      isShow: _tasks[0],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    TaskCard(
                      title: "Vocabulary",
                      speakingIcon: "assets/svg_icons/book_icon.svg",
                      color: const Color(0xff2898FD),
                      onDoubleTap: () {
                        setState(() {
                          _tasks[1] = false;
                        });
                      },
                      onLongTap: () {
                        int count = 0;
                        countTimer =
                            Timer.periodic(const Duration(seconds: 1), (timer) {
                          count++;
                          if (count == 5) {
                            setState(() {
                              _tasks[1] = true;
                            });
                            countTimer?.cancel();
                          }
                        });
                      },
                      isShow: _tasks[1],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TaskCard(
                      title: "Speaking",
                      speakingIcon: "assets/svg_icons/speaking_icon.svg",
                      color: const Color(0xff2898FD),
                      onDoubleTap: () {
                        setState(() {
                          _tasks[2] = false;
                        });
                      },
                      onLongTap: () {
                        int count = 0;
                        countTimer =
                            Timer.periodic(const Duration(seconds: 1), (timer) {
                          count++;
                          if (count == 5) {
                            setState(() {
                              _tasks[2] = true;
                            });
                            countTimer?.cancel();
                          }
                        });
                      },
                      isShow: _tasks[2],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    TaskCard(
                      title: "Listening",
                      speakingIcon: "assets/svg_icons/headphones_icon.svg",
                      color: const Color(0xff2898FD),
                      onDoubleTap: () {
                        setState(() {
                          _tasks[3] = false;
                        });
                      },
                      onLongTap: () {
                        int count = 0;
                        countTimer =
                            Timer.periodic(const Duration(seconds: 1), (timer) {
                          count++;
                          if (count == 5) {
                            setState(() {
                              _tasks[3] = true;
                            });
                            countTimer?.cancel();
                          }
                        });
                      },
                      isShow: _tasks[3],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: HomeWork(
                    color: const Color(0xff2898FD),
                    title: "Homework",
                    trophyIcon: "assets/svg_icons/trophy_icon.svg",
                    vectorIcon: "assets/svg_icons/Vector.svg",
                    presentIcon: "assets/svg_icons/0%.svg",
                    description:
                        "Bu joyda barcha ishtirokchilar\ndarajalari bilan tanishing",
                    onDoubleTap: () {
                      setState(() {
                        _tasks[4] = false;
                      });
                    },
                    onLongTap: () {
                      int count = 0;
                      countTimer =
                          Timer.periodic(const Duration(seconds: 1), (timer) {
                        count++;
                        if (count == 5) {
                          setState(() {
                            _tasks[4] = true;
                          });
                          countTimer?.cancel();
                        }
                      });
                    },
                    isShow: _tasks[4]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
