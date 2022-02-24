// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:mod_adapnavscaff/src/presentation/widgets/adaptive_screens.dart';

// Need TabController  

TabBar appTabBar(BuildContext context, TabController tabController) {
  if (isMobileScreen(context)) {
    return TabBar(
      labelColor: Colors.black87,
      unselectedLabelColor: Colors.grey,
      controller: tabController,
      
      tabs: const [
      Tab(icon: Icon(Icons.home),),
      Tab(icon: Icon(Icons.book),),
      Tab(icon: Icon(Icons.design_services),),
      Tab(icon: Icon(Icons.build),),
      Tab(icon: Icon(Icons.person),),
    ],);
  }
      

  return TabBar(
    labelColor: Colors.black87,
    unselectedLabelColor: Colors.grey,
    controller: tabController,
    tabs: const [
      Tab(
        icon: Icon(Icons.home),
        text: "Home",
      ),
      Tab(
        icon: Icon(Icons.book),
        text: "Books",
      ),
      Tab(
        icon: Icon(Icons.design_services),
        text: "Services",
      ),
      Tab(
        icon: Icon(Icons.build),
        text: "Projects",
      ),
      Tab(
        icon: Icon(Icons.person),
        text: "Contact",
      ),
    ],
  );
}
