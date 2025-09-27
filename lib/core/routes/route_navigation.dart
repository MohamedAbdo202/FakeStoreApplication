import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class RouteNavigation {
  static void push(BuildContext context, PageRouteInfo route) {
    AutoRouter.of(context).push(route);
  }

  static void pushAndRemoveUntil(BuildContext context, PageRouteInfo route) {
    AutoRouter.of(context).pushAndPopUntil(route, predicate: (_) => false);
  }

  static void back(BuildContext context) {
    if (AutoRouter.of(context).canPop()) {
      AutoRouter.of(context).pop();
    }
  }
}
