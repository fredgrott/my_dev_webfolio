// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:mod_adapnavscaff/src/presentation/books/view_book.dart';
import 'package:mod_adapnavscaff/src/presentation/contact/view_contact.dart';
import 'package:mod_adapnavscaff/src/presentation/home/view_home.dart';
import 'package:mod_adapnavscaff/src/presentation/projects/view_projects.dart';
import 'package:mod_adapnavscaff/src/presentation/services/view_services.dart';
import 'package:mod_adapnavscaff/src/presentation/widgets/app_tabbar.dart';

// Gist: Out use case is that we have a view-portal pattern where a controller
//       indicates to TabrView which tab content to display. It will use
//       a SliversAppBar customized for Mobile and Desktop.
//
//       Mobile gets tabs with just icons with a scrolling tabbar.
//       Desktop gets a tabbar with icons and text that scrolls.
//
//       issues with sliverappbar and flex space, see
//        https://github.com/flutter/flutter/issues/19998

class ViewPortal extends StatefulWidget {
  // when nav paths are resolved the 
  // correct view port index is provided as 
  // parameter to trigger the correct redering of 
  // the right view portal child page in view port.
  final int viewPortalIndex;
  const ViewPortal({
    Key? key,
    required this.viewPortalIndex,
  }) : super(key: key);

  @override
  _ViewPortalState createState() => _ViewPortalState();
}

class _ViewPortalState extends State<ViewPortal>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 5,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: widget.viewPortalIndex,
        length: 5,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  appTabBar(context, controller),
                ),
                pinned: true,
              ),
              SliverAppBar(
                expandedHeight: 200.0,
                // ignore: avoid_redundant_argument_values
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: const Text(
                    "Collapsing Toolbar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  background: Image.asset(
                    "images/black-background.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: controller,
            children: <Widget>[
              ViewHome(),
              ViewBook(),
              ViewServices(),
              ViewProjects(),
              ViewContact(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
