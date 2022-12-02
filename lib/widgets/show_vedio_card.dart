import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class ShowVideCard extends StatefulWidget {
  const ShowVideCard({Key? key}) : super(key: key);

  @override
  State<ShowVideCard> createState() => _ShowVideCardState();
}

class _ShowVideCardState extends State<ShowVideCard> {
  late VideoPlayerController _controller;
  late Future<void> _videoPlayerFuture;


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _controller = VideoPlayerController.network("http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4");
    _videoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if(_controller.value.isPlaying){
            _controller.pause();
          }else{
            _controller.play();
          }
        });
      },
      child: FutureBuilder(
        future: _videoPlayerFuture,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Container(
                margin: const EdgeInsets.only(bottom: 24),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  // color: Colors.red,
                ),
                child: VideoPlayer(_controller),
              ),
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

