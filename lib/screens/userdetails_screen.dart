// import 'package:education_app/constants/color.dart';
// import 'package:education_app/constants/icons.dart';
// import 'package:education_app/models/lesson.dart';
// import 'package:education_app/widgets/custom_icon_button.dart';
// import 'package:education_app/widgets/custom_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smart_hub/models/teacher_model.dart';
//import 'package:video_player/video_player.dart';

import '../constants/color.dart';
import '../constants/icons.dart';
import '../models/lesson.dart';
import '../models/users_modeltemporary.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_video_player.dart';
import '../widgets/lesson_card.dart';

class UserDetailsScreen extends StatefulWidget {
  // final String title;
  const UserDetailsScreen({
    Key? key,
    // required this.title,
  }) : super(key: key);

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  int _selectedTag = 0;

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserModelTemporary user = Get.arguments as UserModelTemporary;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          // "Teacher Details",
                          "Teacher Details",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: CustomIconButton(
                          child: const Icon(Icons.arrow_back),
                          height: 35,
                          width: 35,
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                // const CustomVideoPlayer(),
                SizedBox(
                  height: 200,
                  child: Center(
                    child: Text(
                    // "NICKNAME",
                    user.nickname,
                     style: TextStyle(fontSize: 40)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  // "Full Name",
                  user.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  // "Full Name",
                  user.role,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  // "Teacher Id",
                  user.matric,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  // "Teacher Id",
                  user.emel,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                // const Text(
                //   "Created by DevWheels",
                //   style: TextStyle(
                //     fontWeight: FontWeight.w500,
                //     fontSize: 16,
                //   ),
                // ),
                // const SizedBox(
                //   height: 3,
                // ),
                // Row(
                //   children: [
                //     Image.asset(
                //       icFeaturedOutlined,
                //       height: 20,
                //     ),
                //     const Text(
                //       " 4.8",
                //       style: TextStyle(
                //         color: Colors.grey,
                //         fontWeight: FontWeight.w500,
                //         fontSize: 16,
                //       ),
                //     ),
                //     const SizedBox(
                //       width: 15,
                //     ),
                //     const Icon(
                //       Icons.timer,
                //       color: Colors.grey,
                //     ),
                //     const Text(
                //       " 72 Hours",
                //       style: TextStyle(
                //         color: Colors.grey,
                //         fontWeight: FontWeight.w500,
                //         fontSize: 16,
                //       ),
                //     ),
                //     const Spacer(),
                //     const Text(
                //       " \$40",
                //       style: TextStyle(
                //         color: kPrimaryColor,
                //         fontWeight: FontWeight.w700,
                //         fontSize: 20,
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: 15,
                ),
                // CustomTabView(
                //   index: _selectedTag,
                //   changeTab: changeTab,
                // ),
                // _selectedTag == 0 ? const PlayList() : const Description(),
              ],
            ),
          ),
        ),
        bottomSheet: BottomSheet(
          onClosing: () {},
          backgroundColor: Colors.white,
          enableDrag: false,
          builder: (context) {
            return const SizedBox(
              height: 80,
              child: BacktoHomeButton(),
            );
          },
        ),
      ),
    );
  }
}

class PlayList extends StatelessWidget {
  const PlayList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) {
          return const SizedBox(
            height: 20,
          );
        },
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        shrinkWrap: true,
        itemCount: lessonList.length,
        itemBuilder: (_, index) {
          return LessonCard(lesson: lessonList[index]);
        },
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Text(
          "Build Flutter iOS and Android Apps with a Single Codebase: Learn Google's Flutter Mobile Development Framework & Dart"),
    );
  }
}

class CustomTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;
  const CustomTabView({Key? key, required this.changeTab, required this.index})
      : super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final List<String> _tags = ["Playlist (22)", "Description"];

  Widget _buildTags(int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.changeTab(index);
        },
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .08,
                vertical: 15),
            decoration: BoxDecoration(
              color: widget.index == index ? kPrimaryColor : null,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                _tags[index],
                style: TextStyle(
                  color: widget.index != index ? Colors.black : Colors.white,
                ),
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: _tags
            .asMap()
            .entries
            .map((MapEntry map) => _buildTags(map.key))
            .toList(),
      ),
    );
  }
}

class BacktoHomeButton extends StatefulWidget {
  const BacktoHomeButton({Key? key}) : super(key: key);

  @override
  _BacktoHomeButtonState createState() => _BacktoHomeButtonState();
}

class _BacktoHomeButtonState extends State<BacktoHomeButton> {
  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.symmetric(
    //     horizontal: 30.0,
    //   ),
    //   child: Row(
    //     children: [
    //       CustomIconButton(
    //         onTap: () {},
    //         height: 45,
    //         width: 45,
    //         child: const Icon(
    //           Icons.favorite,
    //           color: Colors.pink,
    //           size: 30,
    //         ),
    //       ),
    //       const SizedBox(
    //         width: 20,
    //       ),
    //       Expanded(
    //         child: CustomIconButton(
    //           onTap: () {},
    //           color: kPrimaryColor,
    //           height: 45,
    //           width: 45,
    //           child: const Text(
    //             "Enroll Now",
    //             style: TextStyle(
    //               color: Colors.white,
    //               fontSize: 18,
    //             ),
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomIconButton(
                onTap: () {
                  print("back!");

                  Navigator.pop(context);
                },
                // color: kPrimaryColor,
                // color: Colors.white,
                height: 45,
                width: 150,
                child: const Text(
                  "Back to Home ",
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
