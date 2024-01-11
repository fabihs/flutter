// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayer extends StatefulWidget {
//   const VideoPlayer(VideoPlayerController controller, {super.key});

//   @override
//   State<VideoPlayer> createState() => _VideoPlayerState();
// }

// class _VideoPlayerState extends State<VideoPlayer> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(
//       Uri.parse(
//         'https://youtu.be/_BcYBFC6zfY?si=cuQ6MQ1OkOWts0gy',
//       ),
//     );

//     _initializeVideoPlayerFuture = _controller.initialize();

//     // _controller.addListener(() {
//     //   setState(() {});
//     // });

//     // _controller.setLooping(true);
//     // _controller.initialize().then((_) => setState(() {}));
//     // _controller.play();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           FutureBuilder(
//             future: _initializeVideoPlayerFuture,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 );
//               } else {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               setState(() {
//                 if (_controller.value.isPlaying) {
//                   _controller.pause();
//                 } else {
//                   _controller.play();
//                 }
//               });
//             },
//             child: Icon(
//                 _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/flutterkonek.appspot.com/o/99%20Cahaya%20Di%20Langit%20Eropa%20-%20The%20Final%20Edition%20-%20Trailer.mp4?alt=media&token=7ffc600e-f9d0-42a3-8830-5571ed1187f9',
      ),
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Butterfly Video'),
      ),
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_controller),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
