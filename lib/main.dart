import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showAppBar = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: NestedScrollView(
              // controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  const SliverAppBar(
                    title: Text('My App'),
                    expandedHeight: 100,
                    pinned: false,
                    floating: true,
                    snap: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TabBar(
                            tabs: [
                              Tab(text: 'Tab 1'),
                              Tab(text: 'Tab 2'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  _buildTabContent("Tab 1"),
                  _buildTabContent("Tab 2"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(String tabName) {
    return RefreshIndicator(
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
            child: Center(child: Text('$tabName Item $index')),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
