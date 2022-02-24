// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/cupertino.dart';

// Gist: Use-Case is that we have appbar actions links on desk and higher but 
//       non-pernament drawer links on mobile.

bool isDeskScreen(BuildContext context) =>
    getWindowType(context) >= AdaptiveWindowType.large;
bool isMobileScreen(BuildContext context) =>
    getWindowType(context) <= AdaptiveWindowType.small;
