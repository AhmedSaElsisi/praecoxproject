import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:praecoxproject/style/app_colors.dart';
import 'package:praecoxproject/views/home_screen/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';
class MildCareScreen extends StatefulWidget {
  const MildCareScreen({super.key});

  @override
  State<MildCareScreen> createState() => _MildCareScreenState();
}

class _MildCareScreenState extends State<MildCareScreen> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> images = [
    {
      'image': 'assets/daily_care/img_8.png',
      'title': '1•Wrist Extension Stretch',
      'subtitle':
      ' 1•Extend your arm in front of you with the palm facing down.\n\n'
          '2•Bend your wrist, pointing your fingers up.\n\n'
          '3•With your other hand, gently pull your fingers back until you feel a moderate stretch in your wrist\n\n'
          '4-After stretching, you can work through the following exercises. For each one, do two sets of 10-15 reps for each exercise:.',
      'url':'https://www.youtube.com/watch?v=cOYA0cTIwzM'
    },
    {
      'image': 'assets/daily_care/img_9.png',
      'title': '2•Towel Wringing',
      'subtitle': '1•Grab a towel (either wet or dry).\n\n'
          '2•Wring the towel as much as you can using both hands.\n\n'
          '3•Wring it again in the opposite direction.',
      'url':'https://www.youtube.com/watch?v=cm8m_3S7EbI',
    },

    {
      'image':'assets/daily_care/img_10.png',
      'title' :'4-Rubber Band Finger Extensions',
      'subtitle':'1•Wrap a rubber band around the tips of your fingers.\n\n'
          '2•Spread your fingers and thumb as far apart as possible.\n\n'
          '3•To increase the difficulty, use thicker or multiple bands.',
      'url':'https://www.youtube.com/watch?v=lQPppTK7mFc'
    },
    {
      'image':'assets/daily_care/img_11.png',
      'title':'6-Stress Ball Squeeze',
      'subtitle':'1•For a full grip, place a squeeze ball in the palm of your hand. Press and hold for 3-5 seconds, then relax.\n\n'
    '2•For finger grip, place the ball between the tip of one finger and the thumb. Press and hold for 3-5 seconds,\n\n '
    '3•then relax. You can try this with different fingers.\n\n'
    '4•For a thumb press, place the ball in your palm and press it with your thumb only, pointing towards your little finger.\n\n'
          '5•Hold for 3-5 seconds, then relax.',
      'url':'https://www.youtube.com/watch?v=w5VenxxGJZo'
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
        title: const Text('MildDemented Care',style:
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
