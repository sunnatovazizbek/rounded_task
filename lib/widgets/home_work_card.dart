
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeWork extends StatefulWidget {
  final Color color;
  final String title;
  final String trophyIcon;
  final String presentIcon;
  final String vectorIcon;
  final String description;
  final Function() onDoubleTap;
  final Function() onLongTap;
  final bool isShow;

  const HomeWork({
    Key? key,
    required this.color,
    required this.title,
    required this.trophyIcon,
    required this.presentIcon,
    required this.vectorIcon,
    required this.description,
    required this.onDoubleTap,
    required this.onLongTap,
    required this.isShow,
  }) : super(key: key);

  @override
  State<HomeWork> createState() => _HomeWorkState();
}

class _HomeWorkState extends State<HomeWork> {
  Timer? countTimer;
  List<bool> _tasks = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tasks = List.filled(5, false);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: widget.color,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onDoubleTap: () {
            setState(() {
              _tasks[4] = false;
            });
          },
          onLongPress: () {
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
          child: Stack(
            children: [
              Positioned(
                left: 12,
                top: 12,
                child: Text(
                  widget.title,
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
                child: SvgPicture.asset(widget.presentIcon),
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
                child: SvgPicture.asset(widget.vectorIcon),
              ),
              Positioned(
                right: 16,
                top: 26,
                child: SvgPicture.asset(widget.trophyIcon),
              ),
              Positioned(
                left: 12,
                top: 50,
                child: Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
              !widget.isShow
                  ? Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.withOpacity(.5)),
                      child: Center(
                        child:
                            SvgPicture.asset('assets/svg_icons/crown_icon.svg'),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
