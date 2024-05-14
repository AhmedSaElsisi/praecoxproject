// import 'package:flutter/material.dart';
// class VeryMildCare extends StatefulWidget {
//   const VeryMildCare({super.key});
//
//   @override
//   State<VeryMildCare> createState() => _VeryMildCareState();
// }
//
// class _VeryMildCareState extends State<VeryMildCare> {
//   int _currentIndex = 0;
//
//   final List<Map<String, dynamic>> images = [
//     {
//       'image': 'assets/daily_care/Picture1.jpg',
//       'title': '1•Squats',
//       'subtitle': '1• Stand upright with your feet shoulder-width apart.\n'
//           '2• Bend your knees to lower down as much as possible (pretend you’re sitting in an invisible chair).\n'
//           '3• Go back to the standing position.',
//     },
//     {
//       'image': 'assets/daily_care/Alternating-Forward-Lunges_Exercise.webp',
//       'title': '2•Lunges',
//       'subtitle': '1•Stand with your feet shoulder width apart.\n'
//           '2•Step forward with your right foot longer than a walking stride so that your right leg is ahead of your torso and the left leg is behind. Keep your right foot flat; your left heel will rise off of the ground.\n'
//           '3•Bend your knees to approximately 90 degrees as you lower yourself.',
//     },
//     {
//       'image': 'assets/daily_care/Picture3.png',
//       'title': '3•Push-ups',
//       'subtitle': '1•	Place your hands on the floor slightly wider than your shoulders, keep your \n'
//           '2•	Balance with your weight on your hands and toes and the rest of your body off the floor.\n'
//           '3•	Bend your elbows and lower yourself to the floor, until your elbows reach a 90-degree angle.\n'
//           '4•	Push your body up to the start position.',
//     },
//     // Add more images as needed
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF404040),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(45),
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back,color: Colors.white,),
//           onPressed: () {
//             //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const DailyCareScreen()));
//           },
//         ),
//         title: const Text('VeryMildMented Care',style:
//           TextStyle(
//             color: Colors.white
//           ),),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 15.0),
//         child: SizedBox(
//           height: double.infinity,
//           width: double.infinity,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 15,
//               ),
//               Container(
//                 width: 370,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.white),
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(30),
//                   child: PageView.builder(
//                     itemCount: images.length,
//                     onPageChanged: (index) {
//                       setState(() {
//                         _currentIndex = index;
//                       });
//                     },
//                     itemBuilder: (context, index) {
//                       return Image.asset(
//                         images[index]['image'],
//                       );
//                     },
//                   ),
//                 ),
//               ),
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LocalVideoPlayer extends StatefulWidget {
  @override
  _LocalVideoPlayerState createState() => _LocalVideoPlayerState();
}

class _LocalVideoPlayerState extends State<LocalVideoPlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/Core Exercise Plank.mkv');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Video Player'),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
