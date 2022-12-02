import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TaskCard extends StatelessWidget {
  final Color color;
  final String title;
  final String speakingIcon;
  final Function() onDoubleTap;
  final Function() onLongTap;
  final bool isShow;

  const TaskCard(
      {Key? key,
      required this.color,
      required this.title,
      required this.speakingIcon,
      required this.onDoubleTap,
      required this.onLongTap,
      required this.isShow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onDoubleTap: onDoubleTap,
            onLongPress: onLongTap,
            child: Stack(
              children: [
                Positioned(
                  left: 16,
                  top: 17.4,
                  child: SvgPicture.asset(speakingIcon),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: SvgPicture.asset("assets/svg_icons/Vector.svg"),
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
                const Positioned(
                  right: 20,
                  bottom: 12,
                  child: Text(
                    '0%',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
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
                !isShow
                    ? Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.withOpacity(.5)),
                        child: Center(
                          child: SvgPicture.asset(
                              'assets/svg_icons/crown_icon.svg'),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
