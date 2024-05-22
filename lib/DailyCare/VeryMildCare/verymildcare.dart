import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:praecoxproject/style/app_colors.dart';
import 'package:praecoxproject/views/home_screen/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';
class VeryMildCareScreen extends StatefulWidget {
  const VeryMildCareScreen({super.key});

  @override
  State<VeryMildCareScreen> createState() => _VeryMildCareScreenState();
}

class _VeryMildCareScreenState extends State<VeryMildCareScreen> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> images = [
    {
      'image': 'assets/daily_care/Picture1.jpg',
      'title': '1•Squats',
      'Note':"Note: Skip this exercise if you have a knee injury or other major knee issues\n\n",
      'subtitle':
          '1• Stand upright with your feet shoulder-width apart.\n\n'
          '2• Bend your knees to lower down as much as possible (pretend you’re sitting in an invisible chair).\n\n'
          '3• Go back to the standing position.',
      'url':'https://www.youtube.com/watch?v=xqvCmoLULNY'
    },
    {
      'image': 'assets/daily_care/Alternating-Forward-Lunges_Exercise.webp',
      'title': '2•Lunges',
      'Note':'Note: Skip this exercise if you have a knee injury or other major knee issues.\n\n',
      'subtitle': '1•Stand with your feet shoulder width apart.\n\n'
          '2•Step forward with your right foot longer than a walking stride so that your right leg is ahead of your torso and the left leg is behind. Keep your right foot flat; your left heel will rise off of the ground.\n'
          '3•Bend your knees to approximately 90 degrees as you lower yourself.',
      'url':'https://www.youtube.com/watch?v=wrwwXE_x-pQ',
    },
    {
      'image': 'assets/daily_care/Picture3.png',
      'title': '3•Push-ups',
      'Note':'Note: Skip this exercise if you have any major issues with your wrists.\n\n',
      'subtitle': '1•	Place your hands on the floor slightly wider than your shoulders, keep your \n\n'
          '2•	Balance with your weight on your hands and toes and the rest of your body off the floor.\n\n'
          '3•	Bend your elbows and lower yourself to the floor, until your elbows reach a 90-degree angle.\n\n'
          '4•	Push your body up to the start position.',
      'url':'https://www.youtube.com/watch?v=IODxDxX7oi4'
    },
    {
      'image':'assets/daily_care/Picture4.jpg',
      'title' :'4-Planks',
      'subtitle':'1•Place your hands and elbows on the floor so that your forearms are on the floor.\n\n'
          '2.Keep your body stretched and feet together\n\n'
          '3.Make sure your elbows are directly under your shoulders.\n\n'
          '4•To start a plank, keep your back rigid and your body in a straight line from your head to your toes.\n\n'
          '5•Hold this position for 10 seconds, then relax to the floor.\n\n'
          '6•Over time, increase how long you hold the plank position.',
      'url':'https://www.youtube.com/watch?v=Ehy8G39d_PM'
    },
    {
      'image':'assets/daily_care/img.png',
      'title':'5-Bicep Curls',
      'subtitle':' 1•Hold a dumbbell in each hand and keep your arms hanging by your sides. Make sure your elbows are close to your torso and your palms facing forward.\n\n'
          '2•Bend your arms at the elbow and bring the weights to shoulder level.\n\n'
          '3•Over time, increase the weight you use.',
      'url':'https://www.youtube.com/watch?v=TVflFTempWA'
    },
    {
      'image':'assets/daily_care/img2.png',
      'title':'6-Chest Press',
      'subtitle':'1•Lie on your back on a flat bench with a dumbbell in each hand.\n\n'
          '2•Your shoulders should be at about 45 degrees in relation to the body. Bend your arms at the elbows while holding the dumbbells.\n\n'
          '3•Push the weights upwards, keeping your elbows slightly bent.\n\n'
          '4•Slowly lower the weights back to your original position.',
      'url':'https://www.youtube.com/watch?v=X3YrlBmjWrY'
    },
    {
      'image':'assets/daily_care/img_1.png',
      'title':'7-Calf Raises',
      'subtitle':'1•Stand with your feet shoulder width apart and keep your back straight.\n\n'
          '2•Raise your heels slowly, stopping when you’re standing as much on your toes as you can.\n\n'
          '3•Lower your heels back to the starting position.',
      'url':'https://www.youtube.com/watch?v=cqDMYUaIXvw'
    }, {
      'image':'assets/daily_care/img_2.png',
      'title':'8-Leg Stances',
      'Note':'These stances increase in difficulty. Start with the easiest one and work your way up. First is the double leg stance:',
      'subtitle':'1•Stand with both feet placed close together in a corner or against a counter for safety.\n\n'
          '2•Repeat three sets of 30-60 seconds, twice a day\n.3•Once you’re comfortable with this exercise,\n\n'
          ' 4-try doing it with closed eyes for an extra challenge.',
      'url':'https://www.youtube.com/watch?v=97kZE1GPGCQ',
    },
    {
      'image':'assets/daily_care/img_3.png',
      'title':'9-Rock the Boat',
      'subtitle':'1•Stand in front of a stable chair or counter and rock your body from side to side.\n\n'
          '2•As you lean to the right, lift your left leg off the floor slightly. Hold this position for 1-2 seconds.\n\n'
          '3•As you lean to the left, lift your right leg off the floor slightly. Hold this position for 1-2 seconds.\n\n'
          '4•Repeat this exercise with front and back rocks.\n\n'
          '5•Repeat three sets of 30-60 seconds, twice a day.',
      'url':'https://www.youtube.com/watch?v=BmJf1nmuNLA'
    }, {
      'image':'assets/daily_care/img_4.png',
      'title':'10-Marching in Place',
      'subtitle':'1•Stand with both feet together, then bring each leg up, one after another with a bent knee, as if you were marching.\n\n'
          '2•Repeat three sets of 20-30 marches, twice a day.',
      'url':'https://www.youtube.com/watch?v=Ac8M_Osjy6s'
    },
    {
      'image':'assets/daily_care/img_5.png',
      'title':'10-Side-Step Walks',
      'subtitle':'1•With your eyes looking straight forward, take 10 steps sideways to the right,\n\n'
          '2•then 10 steps sideways to the left. Make sure before you start that you have a clear path in both directions!\n\n'
          '3•Repeat three sets of 20 steps in each direction, twice a day.',
      'url':'https://www.youtube.com/watch?v=L9FzqnlmjCE'
    }, {
      'image':'assets/daily_care/img_7.png',
      'title':'12-Sit-To-Stand',
      'subtitle':'1• Sit on the front edge of a chair with your feet shoulder width apart and flat on the floor. Keep your back straight and place your hands lightly on the sides of the chair.\n\n'
          '2•Lean forward slightly and shift your weight to the front of your feet.\n\n'
          '3•Try to slowly stand up with little to no support from your hands.\n\n'
          '4•Stop in the standing position for a few seconds.\n\n'
          '5•Tighten your core and slowly bend your knees to lower your body back into the chair.\n\n'
          '6•Repeat two sets of 10-15 times, twice a day.\n'
          '7•If you’re struggling and need more support, use a chair with arms and use your hands to push you forward. ',
      'url':'https://www.youtube.com/watch?v=8fg-WIZeauU'
    }, {
      'image':'assets/daily_care/hipkick.webp',
      'title':'13-Hip Kicks',
      'subtitle':'1•Place your hand(s) on a counter or a stable chair. Stand with your feet shoulder width apart.\n\n'
          '2•Kick your leg forward, keeping your knee straight, and then return to the starting position.\n\n'
          '3•Kick your leg to the side, keeping your knee straight, and then return to the starting position.\n\n'
          '4•Kick your leg backward, keeping your knee straight, and then return to the starting position.\n\n'
          '5•Repeat each kick 10-15 times. Do two sets of 10-15 kicks, twice a day.',
      'url':'https://www.youtube.com/watch?v=VeejT-ho7hg'
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
        title: const Text('VeryMildMented Care',style:
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
