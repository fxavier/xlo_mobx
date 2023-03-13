import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/screens/create/create_screen.dart';
import 'package:xlo_mobx/screens/screens.dart';
import 'package:xlo_mobx/stores/store.dart';
import 'package:mobx/mobx.dart';
//import 'package:flutter_mobx/flutter_mobx.dart';

class BaseScreen extends StatefulWidget {
  //BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();
  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    super.initState();
    reaction(
      (_) => pageStore.page,
      (page) => pageController.jumpToPage(page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeScreen(),
          CreateScreen(),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          )
        ],
      ),
    );
  }
}
