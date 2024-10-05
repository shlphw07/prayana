import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../questionnaire_screen.dart';  // Importing the QuestionnaireScreen

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    
    // Initialize the video controller with the video asset
    _controller = VideoPlayerController.asset('assets/start_screen_animation.mp4')
      ..initialize().then((_) {
        // Once the video is initialized, we start playing it
        setState(() {});
        _controller.play();
        _controller.setLooping(false);  // Set the video to not loop
      });

    // Navigate to QuestionnaireScreen after 4 seconds
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => QuestionnaireScreen()),
      );
    });
  }

  @override
  void dispose() {
    // Dispose of the video controller to free up resources
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),  // Show a loader until the video is ready
      ),
    );
  }
}
