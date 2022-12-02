import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class RowButton extends StatefulWidget {
  const RowButton({Key? key}) : super(key: key);

  @override
  State<RowButton> createState() => _RowButtonState();
}

class _RowButtonState extends State<RowButton> {
  Future openFile({required String url, required String? fileName}) async {
    final file = await downloadFile(url, fileName!);

    if (file == null) return;

    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File("${appStorage.path}/$name");
    try {
      final response = await Dio().get(
          url,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0,
          ));
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: saveButton(
              title: "Saqlab q'yish",
              icon: "assets/svg_icons/bookmark_icon.svg",
              context: context,
              backColor: const Color(0xfffffFFF),
              border: Border.all(
                color: const Color(0xff00AFFF),
              ),
              titleColor: const Color(0xff00AFFF),
            ),
          ),
          InkWell(
            onTap: () {
            //  downloadFile("http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4", "ElephantsDream.mp4");
              openFile(url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4", fileName: "ElephantsDream.mp4");
            },
            child: saveButton(context: context,
              title: "Yuklab olish",
              icon: "assets/svg_icons/icloud_arrow.svg",
              backColor: const Color(0xff00AFFF),
              titleColor: const Color(0xffFFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}

Widget saveButton({
  required BuildContext context,
  required String title,
  required String icon,
  Color? backColor,
  BoxBorder? border,
  Color? titleColor,
}) {
  return Container(
    width: MediaQuery
        .of(context)
        .size
        .width * 0.44,
    height: 50,
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
    decoration: BoxDecoration(
      color: backColor,
      borderRadius: BorderRadius.circular(8),
      border: border,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: titleColor,
          ),
        ),
        SvgPicture.asset(icon),
      ],
    ),
  );
}

