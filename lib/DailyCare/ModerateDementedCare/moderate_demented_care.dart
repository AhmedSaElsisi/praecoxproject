import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:praecoxproject/style/app_colors.dart';
import 'package:praecoxproject/views/home_screen/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';
class ModerateCareScreen extends StatefulWidget {
  const ModerateCareScreen({super.key});

  @override
  State<ModerateCareScreen> createState() => _ModerateCareScreenState();
}

class _ModerateCareScreenState extends State<ModerateCareScreen> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> images = [
    {
      'image': 'assets/daily_care/img_13.png',
      'title': '1•Leg Swings',
      'subtitle':
      '1•Stand upright in the water (waist to chest deep). If you need support, hold on to the side of the pool.\n\n'
          '2•Keeping your back upright, swing your leg away from the wall like a pendulum. Repeat for a few swings.\n\n'
          '3•Change the hand you’re using for support, and repeat for the other leg.',
      'url':'https://www.youtube.com/watch?v=ihsH785vBq0'
    },
    {
      'image': 'assets/daily_care/img_14.png',
      'title': '2•Mini Squats',
      'subtitle': '1•Hold on to the pool wall and stand with your feet shoulder width apart in waist or chest-deep water.\n\n'
          '2•Bend your knees to lower down as much as possible (pretend you’re sitting in an invisible chair).\n\n'
          '3•Return to the standing position.',
      'url':'https://www.youtube.com/watch?v=wqCvuhfRXRU',
    },

    {
      'image':'assets/daily_care/img_15.png',
      'title' :'4-Calf Raises',
      'subtitle':'1•Stand in the pool with your feet shoulder width apart and keep your back straight.\n\n'
          '2•Raise your heels slowly, stopping when you’re standing as much on your toes as you can.\n\n'
          '3•Lower your heels back to the starting position.',
      'url':'https://www.youtube.com/watch?v=cqDMYUaIXvw'
    },
    {
      'image':'assets/daily_care/img_16.png',
      'title':'5-Water Walking',
      'subtitle':'1•Stand in the pool waist to chest deep in water.\n\n'
          '2•Start walking across the pool swinging your arms as you do when walking on land.\n\n'
          '3•Avoid walking on your tiptoes and keep your back straight.',
      'url':'https://www.youtube.com/watch?v=O8HWS2srYZQ'
    },
    {
      'image':'assets/daily_care/img_19.png',
      'title':'6-Arm Circles',
      'subtitle':'1•Stand in the pool about neck deep in water with legs apart to maintain balance. This exercise can also be done sitting down.\n\n'
          '2•Raise both arms forward until they are a few inches below water level.\n\n'
          '3•Start making small inward circles with your arms and gradually increase circle size. \n\n'
          '4•Keep your arms straight, and do not let your arms cross.4•Repeat with outward circles.',
      'url':'https://www.youtube.com/watch?v=UVMEnIaY8aU'
    },
    {
      'image':'assets/daily_care/img_18.png',
      'title':'6-Arm Raises',
      'subtitle':'1•Stand in the pool about neck deep in water with legs apart to maintain balance. This exercise can also be done sitting down.\n\n'
    '2•Raise one or both arms forward and upward as high as possible. If one arm is weak, you can help it with the other arm.\n\n'
    '3•Slowly raise both arms out to the side, keeping the palms down. Raise them only to shoulder level. Then, lower your arms.',
      'url':'https://www.youtube.com/watch?v=0qMxUa67a-U'
    },
    {
      'image':'assets/daily_care/img_16.png',
      'title':'8-Push and Pulls',
      'subtitle':'1•Stand in the pool about neck deep in water with legs apart to maintain balance. This exercise can also be done sitting down.\n\n'
          '2•Keeping your arms under water, push your left arm back while pulling your right arm forward. Then swap arms and repeat as fast as you can.',
      'url':'https://www.youtube.com/watch?v=RqT0kT3up9c'
    },
    // Add more images as needed
  ];

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.basieColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(45),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
          },
        ),
        title: const Text('ModerateDemented Care',style:
        TextStyle(
            color: Colors.white
        ),),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: PageView.builder(
                  itemCount: images.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      images[index]['image'],
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                decoration: const BoxDecoration(
                  color: AppTheme.basieColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        images[_currentIndex]['title'],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            children: [
                              TextSpan(
                                text: images[_currentIndex]['Note'],
                                style: TextStyle(color: Colors.white,fontSize: 19),
                              ),
                            ]
                        ),
                      ),
                      SizedBox(height: 10,),
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                text: images[_currentIndex]['subtitle'],
                                style: TextStyle(color: Colors.white,fontSize: 15),
                              ),
                            ]
                        ),
                      ),
                      SizedBox(height: 40,),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Click here for more info about this excersice',
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              _launchURL(images[_currentIndex]['url']);
                            },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

















// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class LocalVideoPlayer extends StatefulWidget {
//   @override
//   _LocalVideoPlayerState createState() => _LocalVideoPlayerState();
// }
//
// class _LocalVideoPlayerState extends State<LocalVideoPlayer> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset('assets/videos/Core Exercise Plank.mkv');
//     _initializeVideoPlayerFuture = _controller.initialize();
//     _controller.setLooping(true);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Local Video Player'),
//       ),
//       body: FutureBuilder(
//         future: _initializeVideoPlayerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: VideoPlayer(_controller),
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             if (_controller.value.isPlaying) {
//               _controller.pause();
//             } else {
//               _controller.play();
//             }
//           });
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }
