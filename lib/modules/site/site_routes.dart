import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/site/sites_page.dart';

import 'site_details_page.dart';

class SiteRoutes extends TbRoutes {
  late var sitesHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    var searchMode = params['search']?.first == 'true';
    return SitesPage(tbContext, searchMode: searchMode);
  });

  late var siteDetailsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return SiteDetailsPage(tbContext, params["id"][0]);
  });

  SiteRoutes(TbContext tbContext) : super(tbContext);

  @override
  void doRegisterRoutes(router) {
    router.define("/sites", handler: sitesHandler);
    router.define("/site/:id", handler: siteDetailsHandler);
  }
}
