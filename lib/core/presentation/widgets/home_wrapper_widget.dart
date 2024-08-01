import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/internet_status_widget.dart';

class HomeWrapperWidget extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const HomeWrapperWidget({super.key, required this.navigationShell});

  @override
  State<HomeWrapperWidget> createState() => HomeWrapperWidgetState();
}

class HomeWrapperWidgetState extends State<HomeWrapperWidget> {
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   leadingWidth: 100,
      //   leading: Padding(
      //     padding: const EdgeInsets.only(left: 14),
      //     child: Text("LOGO"),
      //   ),
      //   actions: const [],
      // ),
      body: Column(
        children: [
          Expanded(flex: 1, child: widget.navigationShell),
          const InternetStatusBar(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        shadowColor: Colors.white,
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: 1, color: Theme.of(context).colorScheme.outline.withOpacity(0.4)))),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      if (widget.navigationShell.currentIndex != 0) {
                        widget.navigationShell.goBranch(0, initialLocation: true);
                      }
                    },
                    icon: Icon(
                      (widget.navigationShell.currentIndex == 0) ? Icons.home_filled : Icons.home,
                      size: 22,
                      color:
                          (widget.navigationShell.currentIndex == 0) ? Colors.black : Colors.grey,
                    )),
                IconButton(
                    onPressed: () {
                      if (widget.navigationShell.currentIndex != 1) {
                        widget.navigationShell.goBranch(1);
                      }
                    },
                    icon: Icon(
                      (widget.navigationShell.currentIndex == 1) ? Icons.explore : Icons.explore,
                      size: 22,
                      color:
                          (widget.navigationShell.currentIndex == 1) ? Colors.black : Colors.grey,
                    )),
                IconButton(
                    onPressed: () {
                      if (widget.navigationShell.currentIndex != 2) {
                        widget.navigationShell.goBranch(2);
                      }
                    },
                    icon: Icon(
                      (widget.navigationShell.currentIndex == 2)
                          ? Icons.add_box_outlined
                          : Icons.add_box_outlined,
                      size: 22,
                      color:
                          (widget.navigationShell.currentIndex == 2) ? Colors.black : Colors.grey,
                    )),
                IconButton(
                    onPressed: () {
                      if (widget.navigationShell.currentIndex != 3) {
                        widget.navigationShell.goBranch(3);
                      }
                    },
                    icon: Icon(
                      (widget.navigationShell.currentIndex == 3) ? Icons.message : Icons.message,
                      size: 22,
                      color:
                          (widget.navigationShell.currentIndex == 3) ? Colors.black : Colors.grey,
                    )),
                IconButton(
                    onPressed: () {
                      if (widget.navigationShell.currentIndex != 4) {
                        widget.navigationShell.goBranch(4);
                      }
                    },
                    icon: Icon(
                      (widget.navigationShell.currentIndex == 4) ? Icons.person : Icons.person,
                      size: 22,
                      color:
                          (widget.navigationShell.currentIndex == 4) ? Colors.black : Colors.grey,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
