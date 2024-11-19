import 'dart:async';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Components/custom_button.dart';
import 'package:travelerdubai/core/constants/constants.dart';

class VideoBanner extends StatelessWidget {
  const VideoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 70,vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      constraints: const BoxConstraints(minHeight: 399, maxHeight: 400),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 50,
            child: Container(
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 50,
            child: Container(
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 210,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.amber,),

              child: Row(

                children: [
                  Flexible(flex: 1, child: Container()),
                  SizedBox(width: 80,),
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SelectableText(
                              "Heading",
                              style: H1open(context)
                                  .copyWith(fontWeight: FontWeight.w700,fontSize: 42,color: colorblack),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: SelectableText(
                            "Sub Heading Sub Heading Sub Heading Sub Heading Sub Heading Sub Heading Sub Heading Sub Heading Sub Heading Sub Heading Sub Heading Sub Heading Sub Heading Sub Heading Sub Heading Sub Heading Sub Heading Sub Heading Sub Heading Sub Heading Sub Heading ",
                            style: bodyf.copyWith(color: colorblack),
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              width: 150,
                              child: ButtonView(btnName: "Explore Now",borderColor: colorMediumBlue,bgColor: colorMediumBlue,radius: 3000,onButtonTap: (){
                                Get.toNamed('/experiences');
                              },)),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80.0),
                    child: const VideoApp(),
                  ),
                ),
                Flexible(flex: 2, child: Container())
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late CachedVideoPlayerController _videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      CustomVideoPlayerSettings(
        showDurationRemaining: false,

        showMuteButton: false,
          showPlayButton: true,
          showDurationPlayed: false,
          settingsButtonAvailable: false,
          showSeekButtons: false, settingsButton: Container());

  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();

    _videoPlayerController = CachedVideoPlayerController.network("$baseurl${Videos.video4}")
      ..initialize().then((value) {
        setState(() {
          _videoPlayerController.play();
        });
      });

    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _videoPlayerController.value.isInitialized
          ? ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: CustomVideoPlayer(
                  customVideoPlayerController: _customVideoPlayerController,
                ),
              ),
            )
          : const CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    _hideTimer?.cancel();
    super.dispose();
  }
}
