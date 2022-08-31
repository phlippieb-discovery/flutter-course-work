import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(BentoApp());

class BentoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: SafeArea(
            child: Pages(),
          ),
        ),
      ),
    );
  }
}

class Pages extends StatefulWidget {
  PageController pageController = PageController(initialPage: 1);

  String smallTask = "";
  String mediumTask = "";
  String largeTask = "";

  bool smallTaskComplete = false;
  bool mediumTaskComplete = false;
  bool largeTaskComplete = false;

  // 0 = none, 1 = small, 3 = large
  int focusedTask = 0;

  void onSmallTaskChanged(String text) {
    smallTask = text;
  }

  void onMediumTaskChanged(String text) {
    mediumTask = text;
  }

  void onLargeTaskChanged(String text) {
    largeTask = text;
  }

  void onTaskFocused(int i) {
    focusedTask = i;
  }

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: widget.pageController,
        scrollDirection: Axis.vertical,
        children: getPageViewChildren());
  }

  List<Widget> getPageViewChildren() {
    List<Widget> results = [
      getHelpPage(),
      getHomePage(),
      getPackTasksPage(),
    ];
    // if (isPacked()) {
    results.add(getOverviewPage());
    // }
    if (widget.focusedTask > 0) {
      results.add(getFocusPage());
    }
    return results;
  }

  Widget getHelpPage() => Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: const Text(
            """
Pack your Bento box with your next three tasks. Pick a small, medium, and large task. Then focus on getting just those three tasks done.""",
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );

  Widget getHomePage() => Expanded(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text("Scroll up for help"),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Image.asset(
                  'images/bento1.jpg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text("Scroll down to pack your bento"),
              ),
            ],
          ),
        ),
      );

  Widget getPackTasksPage() {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Text(
          "Small task:",
          style: getStandardTextStyle(),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: TextField(
          onChanged: (text) => widget.smallTask = text,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Text(
          "Medium task:",
          style: getStandardTextStyle(),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: TextField(
          onChanged: (text) => widget.mediumTask = text,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Text(
          "Large task:",
          style: getStandardTextStyle(),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: TextField(
            onChanged: (text) => setState(() {
                  widget.largeTask = text;
                })),
      ),
      Expanded(child: Container()),
      isPacked() ? Text("Scroll down to view your tasks") : Text("")
    ]);
  }

  Widget getOverviewPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Your tasks",
          style: getStandardTextStyle(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Small
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, top: 8, right: 4, bottom: 4),
                            child: Container(
                                color: Colors.white,
                                child: TextButton(
                                  child: Text('Small'),
                                  onPressed: () {
                                    setState(() {
                                      widget.onTaskFocused(1);
                                    });
                                    animateToFocusPage();
                                  },
                                )),
                          ),
                        ),
                        // Medium
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 4, top: 8, right: 8, bottom: 4),
                            child: Container(
                                color: Colors.white,
                                child: TextButton(
                                  child: Text('Medium'),
                                  onPressed: () {
                                    setState(() {
                                      widget.onTaskFocused(2);
                                    });
                                    animateToFocusPage();
                                  },
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Large
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 8, top: 4, right: 8, bottom: 8),
                      child: Container(
                        color: Colors.white,
                        child: TextButton(
                          child: Text("Large"),
                          onPressed: () {
                            setState(() {
                              widget.onTaskFocused(3);
                            });
                            animateToFocusPage();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getFocusPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          getFocusedTaskHeading(),
          style: getStandardTextStyle(),
        ),
        Text(
          getFocusedTask(),
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ],
    );
  }

  String getFocusedTaskHeading() {
    if (widget.focusedTask == 1) {
      return "Small task";
    } else if (widget.focusedTask == 2) {
      return "Medium task";
    } else if (widget.focusedTask == 3) {
      return "Large task";
    } else {
      return "";
    }
  }

  String getFocusedTask() {
    if (widget.focusedTask == 1) {
      return widget.smallTask;
    } else if (widget.focusedTask == 2) {
      return widget.mediumTask;
    } else if (widget.focusedTask == 3) {
      return widget.largeTask;
    } else {
      return "";
    }
  }

  TextStyle getStandardTextStyle() => TextStyle(fontSize: 20);

  bool isPacked() =>
      widget.smallTask != '' &&
      widget.mediumTask != '' &&
      widget.largeTask != '';

  void animateToFocusPage() {
    widget.pageController.animateToPage(
      4,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
