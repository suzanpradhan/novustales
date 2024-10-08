import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/layers/presentation/feed/screens/archived/feed_screen.dart';
import 'package:storyv2/old/network/repo/story_repo.dart';
import 'package:storyv2/old/providers/category_view_model.dart';
import 'package:storyv2/old/providers/for_you_view_model.dart';
import 'package:storyv2/old/providers/pinned_view_model.dart';
import 'package:storyv2/old/providers/story_view_model.dart';
import 'package:storyv2/old/screens/pinned/pinned_screen.dart';

import '../../config/notification_navigation_service.dart';
import '../../config/preference_utils.dart';
import '../../providers/auth_view_model.dart';
import '../../providers/coin_view_model.dart';
import '../../providers/common_view_model.dart';
import '../../providers/location_provider.dart';
import '../add_post/widgets/camera_screen.dart';
import '../premium/battle_listing.dart';
import '../profile/user_profile_screen.dart';
import 'components/buttom_bar.dart';

///
/// sammygautam45@gmail.com
/// root

class Navigation extends StatefulWidget {
  const Navigation({
    super.key,
  });

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  final prefs = PreferenceUtils.instance;
  final sharedPreferences = PreferenceUtils.instance;
  late CommonViewModel common;
  late CategoryViewModel categoryViewModel;
  late StoryViewModel storyViewModel;
  late AuthViewModel authViewModel;
  late LocationProvider _locationProvider;
  late CoinViewModel _coinViewModel;
  late PinnedViewModel _provider4;
  late ForYouViewModel _forYouViewModel;

  _onPageChanged(StoryViewModel model, int index) async {
    common.setNavigationIndex(index);
    model.postUserInteraction();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      NotificationRoute.NavigationNavigateService(context);
      common = Provider.of<CommonViewModel>(context, listen: false);
      storyViewModel = Provider.of<StoryViewModel>(context, listen: false);
      _forYouViewModel = Provider.of<ForYouViewModel>(context, listen: false);
      _coinViewModel = Provider.of<CoinViewModel>(context, listen: false);
      _coinViewModel.fetchOwnCoins();
      _provider4 = Provider.of<PinnedViewModel>(context, listen: false);
      categoryViewModel =
          Provider.of<CategoryViewModel>(context, listen: false);
      categoryViewModel.fetchCategories();

      /// 10
      ///

      _forYouViewModel.fetchStoryForYou().then((value) {
        for (int i = 0; i < 3; i++) {
          _forYouViewModel.preload(
              _forYouViewModel.forYou[i]['media_url'], context);
        }
      });

      authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      authViewModel.fetchUser().then((value) {
        for (int i = 0; i < 3; i++) {
          authViewModel.preload(
              authViewModel.userData['stories'][i]['media_urls'], context);
        }
      });
      _locationProvider = Provider.of<LocationProvider>(context, listen: false);

      _provider4.fetchAllPinned();
      // common.fetchFriendRequest();
      // common.fetchAcceptRequestFriendList();
      // _provider5.fetchOwnCoins();
    });

    getData();
    super.initState();
  }

  getData() async {
    final res = await StoryRepo().getStoryForYou();
    print("this is res");
    print(res);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      common.setInitial(0);
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      // User has closed the app or sent it to the background
      storyViewModel.postUserInteraction();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<CommonViewModel, StoryViewModel>(
        builder: (context, common, story, child) {
      return WillPopScope(
        onWillPop: () {
          if (common.navigationIndex == 0) {
          } else {
            common.itemTapped(0);
          }

          _showMaterialDialog();

          return Future.value(false);
        },
        child: Scaffold(
            body: PageView(
              controller: common.pagecontroller,
              onPageChanged: (value) {
                _onPageChanged(story, value);
              },
              physics: const NeverScrollableScrollPhysics(),
              children: const <Widget>[
                FeedScreen(),
                BattleListing(),
                CameraPage(),
                PinnedScreen(),
                UserProfileScreen(),
              ],
            ),
            bottomNavigationBar: BottomBar(
              common: common,
            )),
      );
    });
  }

  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Are you sure'),
            content: const Text('Are you sure you want to close application'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    // _dismissDialog();
                    Navigator.of(context).pop();
                  },
                  child: const Text('No')),
              TextButton(
                onPressed: () => exit(0),
                child: const Text('Yes'),
              )
            ],
          );
        });
  }
}
