import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_app/constants/seq_assets_path.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "site_model.dart";

mixin SitesBase on EntitiesBase<Site, PageLink> {
  @override
  String get title => '현장 목록';

  @override
  String get noItemsFoundText => '등록된 현장이 없습니다.';

  @override
  Future<PageData<Site>> fetchEntities(PageLink pageLink) async {

    PageData<Asset> assetPageData = await tbClient.getAssetService().getUserAssets(pageLink, type: 'Site');
    PageData<Site> sitePageData = PageData<Site>.fromJson(assetPageData.toJson(), (json) => Site.fromJson(json));
    List<String> attributeKeys = ["const_period","site_address"];
    List<String> telemetryKeys = ["weather","site_temperature","img_src"];
    for (var e in sitePageData.data) {
      List<AttributeKvEntry> attributeKvList = await tbClient.getAttributeService().getAttributeKvEntries(e.getId() as EntityId, attributeKeys);
      for (var element in attributeKvList) {
        if (element.getKey() == "const_period"){
          e.const_period = element.getValue();}
        else if (element.getKey() == "site_address"){
          e.site_address = element.getValue();}
      }
      List<TsKvEntry> tsKvList = await tbClient.getAttributeService().getLatestTimeseries(e.getId() as EntityId, telemetryKeys);
      for (var element in tsKvList) {
        switch (element.getKey()){
          case "weather":
            e.weather = element.getValue();
            break;
          case "site_temperature":
            e.site_temperature = element.getDoubleValue();
            break;
          case "img_src":
            e.img_src = element.getValue();
        }
      }
    }
    return sitePageData;
  }


/*
  @override
  void onEntityTap(Asset site) {
    navigateTo('/site/${site.id!.id}');
  }*/
  @override
  void onEntityTap(Site site) async {
    HomeDashboardInfo? homeDashBoard = tbContext.homeDashboard;
    if (homeDashBoard!.dashboardId != null) {
      if (hasGenericPermission(Resource.WIDGETS_BUNDLE, Operation.READ) &&
          hasGenericPermission(Resource.WIDGET_TYPE, Operation.READ)) {
        DashboardId? dashboardId = homeDashBoard.dashboardId;
        var state = Utils.createDashboardEntityStateWithState( site.id!, entityName: site.name, entityLabel: site.label, stateId: "site");
        navigateToDashboard(dashboardId!.id!,
            dashboardTitle: site.name, state: state);
      } else {
        showErrorNotification(
            '이 작업에 대한 권한이 없습니다!');
      }
    } else {
      if (tbClient.isTenantAdmin()) {
        showWarnNotification(
            '홈 대시보드에서 Sets State가 구성되어 있지 않습니다!');
      }
    }
  }

  @override
  Widget buildEntityListCard(BuildContext context, Site site) {
    return _buildCard(context, site);
  }

  @override
  Widget buildEntityListWidgetCard(BuildContext context, Site site) {
    return _buildListWidgetCard(context, site);
  }

  @override
  Widget buildEntityGridCard(BuildContext context, Site site) {
    return Text(site.name);
  }

  Widget _buildCard(context, Site site) {
    //var hasImage = entity.image != null;
    Widget image;
    BoxFit imageFit;
    double padding;

    imageFit = BoxFit.contain;
    if (site.img_src == null || site.img_src! > 7) {
      site.img_src = 8;
    }
    image = SvgPicture.asset(SeqBlowerImage.weather[site.img_src!],
          //color: Theme.of(context).cardColor,
          //colorBlendMode: BlendMode.dst,
          width: 64,
          height: 64,
          semanticsLabel: site.weather);

    padding = 0;


    return Row(mainAxisSize: MainAxisSize.max, children: [
      Flexible(
          fit: FlexFit.tight,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(width: 16),
                Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.centerLeft,
                                  child: Text(site.name,
                                      style: TextStyle(
                                          color: Color(0xFF282828),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          height: 20 / 14)))
                            ]),
                        SizedBox(height: 4),
                        Text(
                          //entityDateFormat.format(
                          //    DateTime.fromMillisecondsSinceEpoch(
                          //        site.createdTime!)),
                            site.const_period!,
                            style: TextStyle(
                                color: Color(0xFFAFAFAF),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                height: 16 / 12)),
                        SizedBox(height: 4),
                        Text(site.site_address!,
                            style: TextStyle(
                                color: Color(0xFFAFAFAF),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                height: 1.33))
                      ],
                    )),
                SizedBox(width: 4),
                FittedBox(
                    clipBehavior: Clip.hardEdge,
                    fit: imageFit,
                    child: image),

                Text(
                    (site.site_temperature == null) ? "-" : site.site_temperature!.toStringAsFixed(1)+" \u00b0C",
                    style: TextStyle(
                        color: Color(0xFF282828),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        height: 16 / 12)),

                SizedBox(width: 16),
                Icon(Icons.chevron_right, color: Color(0xFFACACAC)),
                SizedBox(width: 16)
              ],
            ),
          ))
    ]);
  }

  Widget _buildListWidgetCard(BuildContext context, Site site) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Flexible(
          fit: FlexFit.loose,
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 16),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Flexible(
                    fit: FlexFit.loose,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.centerLeft,
                            child: Text('${site.name}',
                                style: TextStyle(
                                    color: Color(0xFF282828),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 1.7))),
                        Text('${site.type}',
                            style: TextStyle(
                                color: Color(0xFFAFAFAF),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                height: 1.33))
                      ],
                    ))
              ])))
    ]);
  }
}
