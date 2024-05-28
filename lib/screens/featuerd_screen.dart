
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../dbHelper/userprovider.dart';
import '../models/category.dart';
import '../routes/route_helper.dart';
import '../widgets/circle_button.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  @override
  Widget build(BuildContext context) {
    String userrole = '${context.watch<UserProvider>().role}';
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            AppBar(),
            // Body(userrole: userrole),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final String userrole;
  const Body({Key? key, required this.userrole}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: Theme.of(context).textTheme.bodyLarge,
              ),

            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),

          itemBuilder: (context, index) {
            return CategoryCard(
              role: userrole,
              category: categoryList[index],
            );
          },
          itemCount: categoryList.length,
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String role;
  final DataList category;
  const CategoryCard({
    Key? key,
    required this.category,
    required this.role,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        onTap: () {
          Get.toNamed(RouteHelper.getlist(role, category.list));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 4.0,
                  spreadRadius: .05,
                ), //BoxShadow
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Align(
                  child: Text(category.name),
                ),

              ],
            ),
          ),
        ));
  }
}

class AppBar extends StatelessWidget {
  // final String name;
  AppBar({
    Key? key,
    // required this.name,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
    Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.7],
                      colors: [
                        // Color(0xff886ff2),
                        Color.fromARGB(187, 42, 219, 78),
                        Color.fromARGB(255, 37, 211, 230),
                        // Color(0xff6849ef),
                      ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,\nWelcome!",
                textScaler: const TextScaler.linear(0.8),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CircleButton(
                icon: Icons.notifications,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          Center(
            child: Text(
              '${context.watch<UserProvider>().nickname}',
              key: const Key('counterState'),
              textScaler: const TextScaler.linear(3.5),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    ),
  
          Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Center(
            child: Image.asset(
              'assets/images/lg1.png',
              width: 70,
              height: 70,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}


class Name extends StatelessWidget {
  const Name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
      '${context.watch<UserProvider>().name}',
      key: const Key('counterState'),
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
