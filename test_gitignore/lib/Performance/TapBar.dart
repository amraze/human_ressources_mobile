// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wassim_test/Performance/PerCard.dart';
import 'package:wassim_test/Performance/PerCardMicro.dart';
import 'package:wassim_test/Performance/PerCardMicro.dart';

const TextStyle optionStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);

class TabPair {
  final Tab tab;
  final Widget view;
  TabPair({required this.tab, required this.view});
}

// ignore: non_constant_identifier_names
List<TabPair> TabPairs = [
  TabPair(
    // ignore: prefer_const_constructors
    tab: Tab(
      child: const Text(
        'Monthly',
        style: optionStyle,
      ),
    ),
    view: const InfoCard(),
  ),
  TabPair(
    tab: const Tab(
      child: Text(
        'Overall',
        style: optionStyle,
      ),
    ),
    view: const InfoCard(),
  ),
];

class TabBarAndTabViews extends StatefulWidget {
  const TabBarAndTabViews({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TabBarAndTabViewsState createState() => _TabBarAndTabViewsState();
}

class _TabBarAndTabViewsState extends State<TabBarAndTabViews>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: TabPairs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // give the tab bar a height [can change height to preferred height]
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: const Color.fromARGB(0, 255, 255, 255),
              borderRadius: BorderRadius.circular(
                25.0,
              ),
            ),
            margin: const EdgeInsets.only(top: 0.0),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 71, 164, 218),
                          Color.fromARGB(255, 2, 55, 85),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )),
                  labelColor: const Color.fromARGB(255, 0, 0, 0),
                  unselectedLabelColor:
                      const Color.fromARGB(255, 255, 255, 255),
                  tabs: TabPairs.map((tabPair) => tabPair.tab).toList()),
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: TabPairs.map((tabPair) => tabPair.view).toList()),
          ),
        ],
      ),
    );
  }
}
