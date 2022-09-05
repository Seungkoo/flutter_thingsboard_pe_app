import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/set/sets_page.dart';

import 'set_details_page.dart';

class SetRoutes extends TbRoutes {
  late var setsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    var searchMode = params['search']?.first == 'true';
    return SetsPage(tbContext, searchMode: searchMode);
  });

  late var setDetailsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return SetDetailsPage(tbContext, params["id"][0]);
  });

  SetRoutes(TbContext tbContext) : super(tbContext);

  @override
  void doRegisterRoutes(router) {
    router.define("/sets", handler: setsHandler);
    router.define("/set/:id", handler: setDetailsHandler);
  }
}
