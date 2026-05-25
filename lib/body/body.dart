import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:animated_floating_buttons/widgets/animated_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:showcaseview/showcaseview.dart';

import '../azkar_and_dua/page_view.dart';
import '../bottom_menu/bottom_menu.dart';
import '../color/gradient_text.dart';
import '../extension/icons/IconTasbeeh.dart';
import '../leading_menu/menu_leading.dart';

class BodyTasbeeh extends StatefulWidget {
  const BodyTasbeeh({super.key});

  @override
  State<BodyTasbeeh> createState() => _BodyTasbeehState();
}

class _BodyTasbeehState extends State<BodyTasbeeh> {
  final GlobalKey<AnimatedFloatingActionButtonState> key =
      GlobalKey<AnimatedFloatingActionButtonState>();
  final TextEditingController _textController = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  //This is keys for ShowCaseView;
  final _key1 = GlobalKey();
  final _key2 = GlobalKey();
  final _key3 = GlobalKey();
  final _key4 = GlobalKey();
  late final ShowcaseView _showcaseView;

  @override
  //initState make when you openProject automaticilly start ShowCaseView
  void initState() {
    super.initState();
    _showcaseView = ShowcaseView.register();
  }

  @override
  void dispose() {
    _showcaseView.unregister();
    _textController.dispose();
    super.dispose();
  }

  //Counter Value;
  int _number = 0;
  //this is to know your tasbeeh,like how much your tasbeeh;
  int _howMuchTasbeeh = 0;
  //_pagesNum help to return first page PageView;
  int _pagesNum = 0;
  //all function tasbeeh number counter;
  void counterFunction() {
    if (_number == 34) return;
    _number += 1;
    setState(() {});
    if (_number == 34) {
      _pagesNum += 1;
      // ignore: avoid_print
      print("current page value $_pagesNum");
    }
    //if the your tasbeeh == 34, number automatically equal 0,
    //and pageview moving next page 1 <-> 2;
    if (_number == 34) {
      _number = 0;
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      setState(() {});
    }
    //Moving to First page PageView -> function;
    //when _pagesNum == 34 -> _pagesNum(1),
    //when _pagesNum(3) -> pageView(1),
    if (_pagesNum == 3) {
      _pagesNum = 0;
      _howMuchTasbeeh += 1;
      pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      setState(() {});
    }
    /////////////////////////////
  }

  //reset only counter;
  void resetCounter() {
    _number = 0;
    setState(() {});
  }

  //onLongPress to reset all things page,tasbeeh,howMuchTasbeeh
  void resetAll() {
    _number = 0;
    _howMuchTasbeeh = 0;
    _pagesNum = 0;
    pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final witdh = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFDF4E5),
      drawer: LeadingMenu(),
      appBar: _appBar(),
      bottomNavigationBar: const BottomNavigation(),
      key: _key,
      body: Stack(
        children: <Widget>[
          //This Container for App background,
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 1,
                image: AssetImage('assets/image/first_screen.jpg'),
              ),
            ),
          ),
          //PageView
          const AzkarAndDua(),
          //Counter buttons
          Padding(
            padding: const EdgeInsets.only(top: 320),
            child: _counter(),
          ),
        ],
      ),
      floatingActionButton: AnimatedFloatingActionButton(
          //Fab list
          fabButtons: <Widget>[float1(), float2(), float3()],
          key: key,
          colorStartAnimation: const Color(0xE7BB9B49),
          colorEndAnimation: const Color(0xE7BB9B49),
          animatedIconData: AnimatedIcons.menu_close //To principal button
          ),
    );
  }

  Column _counter() {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //This button to reset iTasbeeh equal == 0
            Padding(
              padding: const EdgeInsets.only(right: 20),
              //This button to reset iTasbeeh equal == 0
              child: GestureDetector(
                onLongPress: () {
                  resetAll();
                  HapticFeedback.vibrate();
                },
                onTap: () {
                  resetCounter();
                  HapticFeedback.vibrate();
                },
                child: Showcase(
                  key: _key4,
                  title: 'Tap the button to Reset',
                  description: 'On long Press to reset your all Result',
                  targetShapeBorder: const CircleBorder(),
                  tooltipBackgroundColor: const Color(0xFFF9E2C8),
                  descTextStyle: const TextStyle(
                    color: Color(0xFF313030),
                    fontFamily: 'Bodoni',
                    fontWeight: FontWeight.w600,
                  ),
                  targetPadding: const EdgeInsets.all(8),
                  tooltipPadding: const EdgeInsets.all(20),
                  child: Container(
                    // ignore: sort_child_properties_last
                    child: const FaIcon(
                      FontAwesomeIcons.rotate,
                      color: Color(0xE7BB9B49),
                      size: 28,
                    ),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 252, 233, 213),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            //top right shadow
                            color: Colors.grey.shade600,
                            offset: const Offset(4, 4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                          //bottom left shadow
                          const BoxShadow(
                            //top right shadow
                            color: Color.fromARGB(255, 252, 233, 213),
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            //This is counter tasbeeh
            Showcase(
              key: _key2,
              description: 'In there you can see your Result',
              targetShapeBorder: const RoundedRectangleBorder(),
              tooltipBackgroundColor: const Color(0xFFF9E2C8),
              descTextStyle: const TextStyle(
                color: Color(0xFF313030),
                fontFamily: 'Bodoni',
                fontWeight: FontWeight.w600,
              ),
              targetPadding: const EdgeInsets.all(8),
              tooltipPadding: const EdgeInsets.all(20),
              child: Container(
                // ignore: sort_child_properties_last
                child: Center(
                  child: AnimatedFlipCounter(
                    value: _number,
                    textStyle: const TextStyle(
                      color: Color(0xE7BB9B49),
                      fontSize: 36,
                    ),
                  ),
                ),
                height: 68,
                width: 120,
                decoration: BoxDecoration(
                    color: const Color(0xFFFCE9D5),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        //top right shadow
                        color: Colors.grey.shade600,
                        offset: const Offset(4, 4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                      //bottom left shadow
                      const BoxShadow(
                        //top right shadow
                        color: Color.fromARGB(255, 252, 233, 213),
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ]),
              ),
            ),
            //In this Container you can see your result how much tasbeeh
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Showcase(
                key: _key3,
                description: 'In there you can see your how much your Tasbeeh',
                targetShapeBorder: const CircleBorder(),
                tooltipBackgroundColor: const Color(0xFFF9E2C8),
                descTextStyle: const TextStyle(
                  color: Color(0xFF313030),
                  fontFamily: 'Bodoni',
                  fontWeight: FontWeight.w600,
                ),
                targetPadding: const EdgeInsets.all(8),
                tooltipPadding: const EdgeInsets.all(20),
                child: Container(
                  // ignore: sort_child_properties_last
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _howMuchTasbeeh.toString(),
                          style: const TextStyle(
                            color: Color(0xE7BB9B49),
                            fontSize: 34,
                          ),
                        ),
                        const Text(
                          'Your Tasbeeh',
                          style: TextStyle(
                            color: Color(0xE7BB9B49),
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                  height: 70,
                  width: 72,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 252, 233, 213),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          //top right shadow
                          color: Colors.grey.shade600,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                        //bottom left shadow
                        const BoxShadow(
                          //top right shadow
                          color: Color.fromARGB(255, 252, 233, 213),
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ]),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 50),
        //to add number
        GestureDetector(
          onTap: () {
            counterFunction();
            HapticFeedback.vibrate();
          },
          child: Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              color: const Color(0xFFFCE9D5),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  //top right shadow
                  color: Colors.grey.shade600,
                  offset: const Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                //bottom left shadow
                const BoxShadow(
                  //top right shadow
                  color: Color.fromARGB(255, 252, 233, 213),
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Showcase(
              key: _key1,
              description: 'Tap the button to count',
              targetShapeBorder: const CircleBorder(),
              tooltipBackgroundColor: const Color(0xFFF9E2C8),
              descTextStyle: const TextStyle(
                color: Color(0xFF313030),
                fontFamily: 'Bodoni',
                fontWeight: FontWeight.w600,
              ),
              targetPadding: const EdgeInsets.all(8),
              tooltipPadding: const EdgeInsets.all(20),
              child: const FaIcon(
                FontAwesomeIcons.plus,
                color: Color(0xE7BB9B49),
                size: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 55,
      elevation: 0,
      centerTitle: true,
      backgroundColor: const Color(0xFFFDF4E5),
      title: const GradientText(
        "iTasbeeh",
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(235, 209, 151, 25),
            Color.fromRGBO(180, 136, 17, 25),
            Color.fromRGBO(162, 121, 13, 25),
            Color.fromRGBO(187, 155, 73, 25),
          ],
        ),
        style: TextStyle(
          fontFamily: 'Julius',
          fontWeight: FontWeight.w800,
          fontSize: 30,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 10, 6),
          child: AnimSearchBar(
            closeSearchOnSuffixTap: true,
            width: 390,
            animationDurationInMilli: 675,
            textController: _textController,
            helpText: 'Search by iTasbeeh...',
            color: const Color(0xFFFDF4E5),
            prefixIcon: const FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: Color.fromRGBO(187, 155, 73, 25),
              size: 18,
            ),
            suffixIcon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onSuffixTap: () {
              setState(() {});
            },
            onSubmitted: (value) {},
          ),
        )
      ],
      leading: IconButton(
        onPressed: () => _key.currentState!.openDrawer(),
        icon: const Icon(
          IconTasbeeh.menuicon,
          color: Color(0xE7BB9B49),
        ),
      ),
    );
  }

  ///float1 for floatingActionButton Lists
  Widget float1() {
    return const FloatingActionButton(
      backgroundColor: Color(0xE7BB9B49),
      onPressed: null,
      heroTag: "Vibration",
      tooltip: 'Vibration',
      child: Icon(Icons.vibration_rounded),
    );
  }

  ///float2 for floatingActionButton Lists
  Widget float2() {
    return const FloatingActionButton(
      backgroundColor: Color(0xE7BB9B49),
      onPressed: null,
      heroTag: "DarkMode",
      tooltip: 'DarkMode',
      child: Icon(Icons.dark_mode_rounded),
    );
  }

  ///float3 for floatingActionButton Lists
  Widget float3() {
    return const FloatingActionButton(
      backgroundColor: Color(0xE7BB9B49),
      onPressed: null,
      heroTag: "info",
      tooltip: 'info',
      child: Icon(Icons.info_outline_rounded),
    );
  }
}
