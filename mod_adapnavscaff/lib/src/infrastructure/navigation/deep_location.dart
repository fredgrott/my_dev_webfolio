// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:mod_adapnavscaff/src/infrastructure/navigation/home_location.dart';
import 'package:mod_adapnavscaff/src/presentation/widgets/view_portal.dart';

class DeepLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/books/services/projects/contact'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
    ...HomeLocation().buildPages(context, state),
    if (state.uri.pathSegments.contains('a'))
       const BeamPage(
         key: ValueKey('books'),
         title: 'Books',
         child: ViewPortal(viewPortalIndex: 1,),),
       if (state.uri.pathSegments.contains('services'))
           const BeamPage(
             key: ValueKey('servies'),
             title: "Services",
             child: ViewPortal(
              viewPortalIndex: 2,
            ),
          ),
          if (state.uri.pathSegments.contains('projects'))
            const BeamPage(
              key: ValueKey("projects"),
              title: "Projects",
              child: ViewPortal(viewPortalIndex: 3,),),
              if (state.uri.pathSegments.contains('contac'))
              const BeamPage(
                key: ValueKey("contact"),
                title: "Contact",
                child: ViewPortal(
                    viewPortalIndex: 4,
                ),
              )
  ];
}
