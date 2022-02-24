// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:mod_adapnavscaff/src/presentation/widgets/view_portal.dart';

class HomeLocation extends BeamLocation<BeamState>{

  @override
  List<String> get pathPatterns => ['/'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('home'),
          title: 'Home',
          child: ViewPortal(viewPortalIndex: 0,),
        ),
      ];

}
