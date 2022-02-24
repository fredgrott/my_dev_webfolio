// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:beamer/beamer.dart';
import 'package:mod_adapnavscaff/src/infrastructure/navigation/home_location.dart';

final routerDelegate = BeamerDelegate(
  locationBuilder: BeamerLocationBuilder(
    // paths are in
    // either dedicated PagenameLocation class or
    // HomeLocation class and referenced here.
    beamLocations: [
      HomeLocation(),

    ],
    
  ),
);
