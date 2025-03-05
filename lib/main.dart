import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: DefaultTabController(
          length: 2, // 2 tab
          child: Scaffold(
            body: NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  const SliverAppBar(
                    pinned: true,
                    floating: true,
                    title: Text("My App"),
                    bottom: TabBar(
                      tabs: [
                        Tab(text: 'Tab 1'),
                        Tab(text: 'Tab 2'),
                      ],
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  // Tab 1 dengan RefreshIndicator sendiri
                  RefreshIndicator(
                    displacement: 10,
                    onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 2));
                    },
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: index.isOdd ? Colors.white : Colors.black12,
                          height: 100.0,
                          child: Center(child: Text('Tab 1 Item $index')),
                        );
                      },
                    ),
                  ),
                  // Tab 2 dengan RefreshIndicator sendiri
                  RefreshIndicator(
                    displacement: 10,
                    onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 2));
                    },
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: index.isOdd ? Colors.white : Colors.black12,
                          height: 100.0,
                          child: Center(child: Text('Tab 2 Item $index')),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
