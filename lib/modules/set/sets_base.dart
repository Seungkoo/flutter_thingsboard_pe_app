import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';
import 'package:thingsboard_app/utils/utils.dart';
import "sets_model.dart";

mixin SetsBase on EntitiesBase<Set, PageLink> {
  @override
  String get title => '모든 열풍기세트';

  @override
  String get noItemsFoundText => '등록된 세트가 없습니다.';

  @override
  Future<PageData<Set>> fetchEntities(PageLink pageLink) async {
    PageData<Asset> assetPageData = await tbClient.getAssetService().getUserAssets(pageLink, type: 'Set');
    PageData<Set> setPageData = PageData<Set>.fromJson(assetPageData.toJson(), (json) => Set.fromJson(json));
    List<String> attributeKeys = ["location"];
    List<String> telemetryKeys = [];
    for (var e in setPageData.data) {

      List<EntityRelationInfo> parentSites = await tbClient.getEntityRelationService().findInfoByTo(e.getId() as EntityId);
      for (var element in parentSites) {
        e.fromSite = element.fromName;
      }
      List<AttributeKvEntry> attributeKvList = await tbClient.getAttributeService().getAttributeKvEntries(e.getId() as EntityId, attributeKeys);
      for (var element in attributeKvList) {
        if (element.getKey() == "location"){
          e.location = element.getValue();}
      }
      //List<String> tsKeys = await tbClient.getAttributeService().getTimeseriesKeys(e.getId() as EntityId);

      List<TsKvEntry> tsKvList = await tbClient.getAttributeService().getLatestTimeseries(e.getId() as EntityId, telemetryKeys);
      for (var element in tsKvList) {
        if (element.getKey() == "avgTemperature") {
          e.avgTemperature = element.getDoubleValue();
          break;
        }
      }
    }
    return setPageData;
  }
/*
  @override
  void onEntityTap(Asset set) {
    navigateTo('/set/${set.id!.id}');
  }
*/
  @override
  void onEntityTap(Asset set) async {
    HomeDashboardInfo? homeDashBoard = tbContext.homeDashboard;
    if (homeDashBoard!.dashboardId != null) {
      if (hasGenericPermission(Resource.WIDGETS_BUNDLE, Operation.READ) &&
          hasGenericPermission(Resource.WIDGET_TYPE, Operation.READ)) {
        DashboardId? dashboardId = homeDashBoard.dashboardId;
        var state = Utils.createDashboardEntityStateWithState( set.id!,entityName: set.name, entityLabel: set.label, stateId: "Set");
        navigateToDashboard(dashboardId!.id!,
            dashboardTitle: set.name, state: state);
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
  Widget buildEntityListCard(BuildContext context, Set set) {
    return _buildCard(context, set);
  }

  @override
  Widget buildEntityListWidgetCard(BuildContext context, Set set) {
    return _buildListWidgetCard(context, set);
  }

  @override
  Widget buildEntityGridCard(BuildContext context, Set set) {
    return Text(set.name);
  }

  Widget _buildCard(context, Set set) {
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
                                  child: Text('${set.name}',
                                      style: TextStyle(
                                          color: Color(0xFF282828),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          height: 20 / 14))),

                            ]),
                        SizedBox(height: 4),
                        Row(mainAxisSize: MainAxisSize.min,
                            children: [
                            Text(set.location??"배치안됨",
                              style: TextStyle(
                                  color: Color(0xFF282828),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  height: 1.33)
                            ),
                            SizedBox(width: 4),
                            Text(set.fromSite??"현장미투입",
                                style: TextStyle(
                                color: Color(0xFFAFAFAF),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                height: 1.33)
                            )
                        ]),
                    ])),
                SizedBox(width: 16),
                Text(
                    (set.avgTemperature == null) ? "-": set.avgTemperature!.toStringAsFixed(1)+" \u00b0C",
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

  Widget _buildListWidgetCard(BuildContext context, Set set) {
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
                            child: Text('${set.name}',
                                style: TextStyle(
                                    color: Color(0xFF282828),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 1.7))),
                        Row(mainAxisSize: MainAxisSize.min, children: [
                          Text('${set.fromSite} ',
                              style: TextStyle(
                                  color: Color(0xFFAFAFAF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  height: 1.33)),
                          Text('${set.location}',
                            style: TextStyle(
                                color: Color(0xFFAFAFAF),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                height: 1.33)),
                        ],)
                      ],
                    ))
              ])))
    ]);
  }
}
