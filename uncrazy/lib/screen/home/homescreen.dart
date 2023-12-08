import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uncrazy/screen/home/home_screen_controller.dart';
import 'package:uncrazy/screen/home/home_screen_model.dart';
import 'package:uncrazy/screen/note/note_screen.dart';
import 'package:uncrazy/screen/profile/profile_screen.dart';
import 'package:uncrazy/screen/task/task_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uncrazy/widget/search_widget.dart';

// ignore: must_be_immutable
class HomeScreen extends ConsumerStatefulWidget {
  int? initialIndex;
  // ignore: use_key_in_widget_constructors
  HomeScreen([this.initialIndex]);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  final refresher = RefreshController(initialRefresh: true);
  final StateProvider<bool> isSearchProvider = StateProvider((ref) => false);
  final StateProvider<Color> searchIndicatorProvider =
      StateProvider((ref) => Colors.white);
  final StateProvider<int> indexProvider = StateProvider((ref) => 0);

  late HomeScreenController homeScreenController;
  late HomeScreenModel model;

  final searchController = TextEditingController();

  int tabIndex = 0;
  late TabController tabController2;

  DateTime pickedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    tabController2 = TabController(length: 2, vsync: this);
    tabController2.addListener(() {
      setState(() {
        tabIndex = tabController2.index;
        print(tabIndex);
        resetIcon();
      });
    });
  }

  void resetIcon() {
    ref.read(isSearchProvider.notifier).state = false;
    ref.read(searchIndicatorProvider.notifier).state = Colors.white;
  }

  Widget searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(children: [
        TextFormField(
          controller: searchController,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.white,
              hintText: "Search"),
          style: const TextStyle(color: Colors.black, fontSize: 18),
          onEditingComplete: () {
            if (tabController2.index == 0) {
              homeScreenController.searchTask(searchController.text);
            } else {
              homeScreenController.searchNote(searchController.text);
            }
            searchController.clear();
          },
        ),
        Positioned(
          right: 0,
          top: 5,
          child: IconButton(
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.black,
                size: 20,
              ),
              onPressed: () {
                if (tabController2.index == 0) {
                  homeScreenController.searchTask(searchController.text);
                } else {
                  homeScreenController.searchNote(searchController.text);
                }
              }),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    homeScreenController = ref.watch(homeScreenVMProvider.notifier);
    model = ref.watch(homeScreenVMProvider);
    Size screensize = MediaQuery.of(context).size;
    final isSearch = ref.watch(isSearchProvider);
    final searchIndicator = ref.watch(searchIndicatorProvider);
    final taskContainerText = ref.watch(sharedDataProvider);

    return SafeArea(
        child: DefaultTabController(
            initialIndex: 1,
            length: 2,
            child: SmartRefresher(
              controller: refresher,
              onRefresh: () {
                refresher.headerMode?.value = RefreshStatus.idle;
                homeScreenController.getProfile();
                if (tabController2.index == 0) {
                  homeScreenController.getTasksByDate(
                      DateFormat('yyyy-MM-dd').format(pickedDate));
                  homeScreenController.getTasksOverdue(
                      DateFormat('yyyy-MM-dd').format(DateTime.now()));
                  homeScreenController.getTasksOverdue(
                      DateFormat('yyyy-MM-dd').format(DateTime.now()));
                } else {
                  homeScreenController.getNotes();
                }
                refresher.loadComplete();
              },
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: const Color(0xFF2B2B2B),

                //Appbar for the tabbar, welcome message, and profile picture
                appBar: AppBar(
                  toolbarHeight: screensize.height * 0.1,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  automaticallyImplyLeading: false,

                  //title = welcome message
                  title: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "GREETINGS, ${model.user.name.toUpperCase()}",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal),
                    ),
                  ),

                  //action = profile picture to profile setting
                  actions: [
                    TextButton(
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  model.user.image ?? 'assets/images/logo.png'),
                              fit: BoxFit.cover
//                            AssetImage('')
                              ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                                builder: ((context) =>
                                    ProfileScreen(model.user))))
                            .then((value) => homeScreenController.getProfile());
                      },
                    ),
                  ],
                ),

                //body = tabbar
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Container(
                      height: screensize.height * 0.04,
                      width: screensize.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 9,
                            child: Container(
                              width: screensize.width,
                              height: screensize.height,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 5, 54, 141),
                              ),
                              child: TabBar(
                                controller: tabController2,
                                indicatorColor: Colors.black,
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        10), // Creates border
                                    color: Colors.blue),
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.black,
                                onTap: (index) {
                                  //resetIcon(tabController2.index);
                                },
                                tabs: [
                                  Container(
                                    child: Text(
                                      "Task",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Notes",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: screensize.height,
                              child: TextButton(
                                child: Icon(
                                  Icons.search,
                                  color: searchIndicator,
                                  size: 20,
                                ),
                                onPressed: () {
                                  if (isSearch == false) {
                                    ref.read(isSearchProvider.notifier).state =
                                        true;
                                    ref
                                        .read(searchIndicatorProvider.notifier)
                                        .state = Colors.orange;
                                    ref
                                        .read(sharedDataProvider.notifier)
                                        .setData(1);
                                  } else {
                                    ref.read(isSearchProvider.notifier).state =
                                        false;
                                    ref
                                        .read(searchIndicatorProvider.notifier)
                                        .state = Colors.white;
                                    ref
                                        .read(sharedDataProvider.notifier)
                                        .setData(0);
                                  }
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    // Search box
                    SizedBox(height: screensize.height * 0.01),

                    Visibility(visible: isSearch, child: searchField()),

                    //Tabbar view, view from another screen
                    SizedBox(height: screensize.height * 0.01),
                    Expanded(
                      flex: 9,
                      child: TabBarView(
                        controller: tabController2,
                        children: [
                          TaskScreen(
                            taskScreenController: homeScreenController,
                            onDateChange: (val) {
                              setState(() {
                                pickedDate = val;
                              });
                            },
                          ),
                          NoteScreen(
                              noteScreenController: homeScreenController),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}

class ShareData extends ChangeNotifier {
  int data = 0;
  int get fetchdata => data;
  void setData(int newData) {
    data = newData;
    notifyListeners();
  }
}

final sharedDataProvider =
    ChangeNotifierProvider<ShareData>(((ref) => ShareData()));
