// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:lottie_package_tutorial/constants.dart';
// import 'package:lottie_package_tutorial/emoji_model.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Facebook Reactions',
//       theme: ThemeData.dark(),
//       home: const ReactionScreen(),
//     );
//   }
// }

// class ReactionScreen extends StatefulWidget {
//   const ReactionScreen({super.key});

//   @override
//   State<ReactionScreen> createState() => _ReactionScreenState();
// }

// class _ReactionScreenState extends State<ReactionScreen>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 2));
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   int currentHoveredEmoji = 100;
//   double currentHoverPosition = 0;

//   final List<Emoji> emojis = [
//     Emoji(path: 'assets/like.json', scale: 1.7),
//     Emoji(path: 'assets/love.json', scale: 1.5),
//     Emoji(path: 'assets/wow.json', scale: 0.7),
//     Emoji(path: 'assets/haha.json', scale: 0.8),
//     Emoji(path: 'assets/anger.json', scale: 0.85),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBar,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20),
//             // width: double.infinity,
//             // height: 50,
//             decoration: roundGrey,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 for (int i = 0; i < emojis.length; i++)
//                   Transform.scale(
//                     scale: emojis[i].scale + (currentHoveredEmoji == i ? 0.7 : 0),
//                     child: Lottie.asset(
//                       emojis[i].path,
//                       controller: currentHoveredEmoji == i ? _controller : null,
//                       height: 50,
//                       animate: false,
//                       fit: BoxFit.cover,
//                     ),
//                   )
//               ],
//             ),
//           ),
//           GestureDetector(
//             onLongPress: () => _controller.repeat(),
//             onLongPressEnd: (_) {
//               setState(() => currentHoveredEmoji = 100);
//               _controller.stop();
//               _controller.reset();
//             },
//             onLongPressDown: (details) {
//               setState(() => currentHoveredEmoji = 2);
//               currentHoverPosition = details.localPosition.dx;
//             },
//             onLongPressMoveUpdate: (details) {
//               final dragDifference =
//                   details.localPosition.dx - currentHoverPosition;
//               if (dragDifference.abs() > 40) {
//                 dragDifference > 0 ? nextEmoji() : previousEmoji();
//                 currentHoverPosition = details.localPosition.dx;
//               }
//             },
//             child: Container(
//               margin: const EdgeInsets.symmetric(vertical: 20),
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 15,
//                 vertical: 5,
//               ),
//               decoration: roundGrey,
//               child: const Text(
//                 'Like',
//                 style: likeButtonTextStyle,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void nextEmoji() {
//     if (currentHoverPosition < emojis.length - 1) {
//       setState(() => currentHoveredEmoji++);
//     }
//   }

//   void previousEmoji() {
//     if (currentHoveredEmoji > 0) {
//       setState(() => currentHoveredEmoji--);
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:lottie_package_tutorial/constants.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reaction Video',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Reaction Button Example"),
          centerTitle: true,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            // width: double.infinity,
            // height: 50,
            decoration: roundGrey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LikeButton(
                  size: 40,
                  circleColor: CircleColor(
                      start: Colors.red, end: Colors.red.withOpacity(0.1)),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Colors.red,
                    dotSecondaryColor: Colors.redAccent,
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.thumb_up,
                      color: isLiked ? Colors.blue : Colors.grey,
                    );
                  },
                  onTap: (bool isLiked) async {
                    if (!isLiked) {
                      setState(() {
                        _selectedOption = 1;
                      });
                    } else {
                      setState(() {
                        _selectedOption = 0;
                      });
                    }
                    print(!isLiked);
                    return Future.value(!isLiked);
                  },
                  isLiked: _selectedOption == 1,
                ),
                LikeButton(
                  size: 40,
                  circleColor: CircleColor(
                      start: Colors.yellow,
                      end: Colors.yellow.withOpacity(0.1)),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Colors.yellow,
                    dotSecondaryColor: Colors.yellowAccent,
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.star,
                      color: isLiked ? Colors.yellow : Colors.grey,
                      size: 30,
                    );
                  },
                  onTap: (bool isLiked) async {
                    if (!isLiked) {
                      setState(() {
                        _selectedOption = 2;
                      });
                    } else {
                      setState(() {
                        _selectedOption = 0;
                      });
                    }
                    print(!isLiked);
                    return Future.value(!isLiked);
                  },
                  isLiked: _selectedOption == 2,
                ),
                LikeButton(
                  size: 40,
                  circleColor: CircleColor(
                      start: Colors.green, end: Colors.green.withOpacity(0.1)),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Colors.green,
                    dotSecondaryColor: Colors.greenAccent,
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: isLiked ? Colors.green : Colors.grey,
                      size: 30,
                    );
                  },
                  onTap: (bool isLiked) {
                    if (!isLiked) {
                      setState(() {
                        _selectedOption = 3;
                      });
                    } else {
                      setState(() {
                        _selectedOption = 0;
                      });
                    }
                    print(!isLiked);
                    return Future.value(!isLiked);
                  },
                  isLiked: _selectedOption == 3,
                ),
                LikeButton(
                  size: 40,
                  circleColor: CircleColor(
                      start: Colors.green, end: Colors.green.withOpacity(0.1)),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Colors.green,
                    dotSecondaryColor: Colors.greenAccent,
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.emoji_emotions_outlined,
                      color: isLiked ? Colors.green : Colors.grey,
                      size: 30,
                    );
                  },
                  onTap: (bool isLiked) {
                    if (!isLiked) {
                      setState(() {
                        _selectedOption = 4;
                      });
                    } else {
                      setState(() {
                        _selectedOption = 0;
                      });
                    }
                    print(!isLiked);
                    return Future.value(!isLiked);
                  },
                  isLiked: _selectedOption == 4,
                ),
                LikeButton(
                  size: 40,
                  circleColor: CircleColor(
                      start: Colors.green, end: Colors.green.withOpacity(0.1)),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Colors.green,
                    dotSecondaryColor: Colors.greenAccent,
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite_outline_outlined,
                      color: isLiked ? Colors.green : Colors.grey,
                      size: 30,
                    );
                  },
                  onTap: (bool isLiked) {
                    if (!isLiked) {
                      setState(() {
                        _selectedOption = 5;
                      });
                    } else {
                      setState(() {
                        _selectedOption = 0;
                      });
                    }
                    print(!isLiked);
                    return Future.value(!isLiked);
                  },
                  isLiked: _selectedOption == 5,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
