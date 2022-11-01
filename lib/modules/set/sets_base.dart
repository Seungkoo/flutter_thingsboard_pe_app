import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';
import 'package:thingsboard_app/utils/utils.dart';

mixin SetsBase on EntitiesBase<Asset, PageLink> {
  @override
  String get title => '열풍기세트 목록';

  @override
  String get noItemsFoundText => '등록된 세트가 없습니다.';

  @override
  Future<PageData<Asset>> fetchEntities(PageLink pageLink) {
    return tbClient.getAssetService().getUserAssets(pageLink, type: 'Set');
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
  Widget buildEntityListCard(BuildContext context, Asset set) {
    return _buildCard(context, set);
  }

  @override
  Widget buildEntityListWidgetCard(BuildContext context, Asset set) {
    return _buildListWidgetCard(context, set);
  }

  @override
  Widget buildEntityGridCard(BuildContext context, Asset set) {
    return Text(set.name);
  }

  Widget _buildCard(context, Asset set) {
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
                              Text(
                                  entityDateFormat.format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          set.createdTime!)),
                                  style: TextStyle(
                                      color: Color(0xFFAFAFAF),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      height: 16 / 12))
                            ]),
                        SizedBox(height: 4),
                        Text('${set.type}',
                            style: TextStyle(
                                color: Color(0xFFAFAFAF),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                height: 1.33))
                      ],
                    )),
                SizedBox(width: 16),
                Icon(Icons.chevron_right, color: Color(0xFFACACAC)),
                SizedBox(width: 16)
              ],
            ),
          ))
    ]);
  }

  Widget _buildListWidgetCard(BuildContext context, Asset set) {
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
                        Text('${set.type}',
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