import 'package:flutter/material.dart';
import 'package:storyv2/old/constants/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  ScrollController _scrollController = ScrollController();
  bool isListVisible = false;
  bool scrolled = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _scrollController.addListener(() {
      // Check if the user has scrolled
      if (_scrollController.position.pixels > 0) {
        // User has scrolled
        // You can perform actions or set a flag accordingly
        print("User has scrolled!");
        setState(() {
          scrolled = true;
        });
      } else {
        setState(() {
          scrolled = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: PageView.builder(
            itemCount: 10,
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            onPageChanged: (value) {},
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Image.asset(
                    height: double.infinity,
                    width: double.infinity,
                    "assets/images/home.png",
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 65,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: const TabBar(
                            indicatorColor: Color(0xFfCA7558),
                            dividerColor: Colors.transparent,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: [
                              Tab(text: "Following"),
                              Tab(text: "For You"),
                              Tab(text: "Trending"),
                            ],
                          ),
                        ),
                        // Sliding drawer icon and List in the same line
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: isListVisible
                                ? Colors.black38
                                : Colors.transparent,
                          ),
                          child: Row(
                            children: [
                              // Sliding drawer icon
                              Expanded(
                                flex: scrolled ? 1 : 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isListVisible = !isListVisible;
                                        if (isListVisible) {
                                          _controller.forward();
                                        } else {
                                          _controller.reverse();
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: !isListVisible
                                            ? Colors.black38
                                            : Colors.transparent,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10.0,
                                          right: 10,
                                          top: 5,
                                          bottom: 5,
                                        ),
                                        child: scrolled
                                            ? const Icon(
                                                Icons
                                                    .arrow_back_ios_new_outlined,
                                                color: white,
                                              )
                                            : Row(
                                                children: [
                                                  const Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: white,
                                                      size: 16),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      color: buttonColor,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 8.0,
                                                        right: 8,
                                                        bottom: 8,
                                                        top: 5,
                                                      ),
                                                      child: Text(
                                                        "All",
                                                        style: TextStyle(
                                                          color: white,
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // List
                              Expanded(
                                flex: 7,
                                child: SlideTransition(
                                  position: _offsetAnimation,
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    height: isListVisible ? 60 : 0,
                                    child: isListVisible
                                        ? ListView.builder(
                                            controller: _scrollController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 10,
                                            itemBuilder: (context, index) =>
                                                Card(
                                              margin: EdgeInsets.all(8),
                                              child: Container(
                                                width: 100,
                                                height: 60,
                                                child: Center(
                                                  child: Text('Item $index'),
                                                ),
                                              ),
                                            ),
                                          )
                                        : null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

// Row(
//   children: [
//     Expanded(
//       flex: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: InkWell(
//           onTap: () {
//             setState(() {
//               isListVisible = !isListVisible;
//               if (isListVisible) {
//                 _controller.forward();
//               } else {
//                 _controller.reverse();
//               }
//             });
//           },
//           child: Container(
//             height: 50,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(25),
//               color: Colors.black38,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 left: 10.0,
//                 right: 10,
//                 top: 5,
//                 bottom: 5,
//               ),
//               child: Row(
//                 children: [
//                   const Icon(Icons.arrow_forward_ios,
//                       color: white, size: 16),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                       color: buttonColor,
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                         left: 8.0,
//                         right: 8,
//                         bottom: 8,
//                         top: 5,
//                       ),
//                       child: Text(
//                         "All",
//                         style:
//                             TextStyle(color: white, fontSize: 13),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//     Expanded(
//       flex: 8,
//       child: SlideTransition(
//         position: _offsetAnimation,
//         child: AnimatedContainer(
//           duration: Duration(milliseconds: 300),
//           height: isListVisible ? 200 : 0,
//           child: isListVisible
//               ? SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: List.generate(
//                 10,
//                     (index) => Card(
//                   margin: EdgeInsets.all(8),
//                   child: Container(
//                     width: 100,
//                     height: 150,
//                     child: Center(
//                       child: Text('Item $index'),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           )
//               : null,
//         ),
//       ),
//     ),
//   ],
// ),
