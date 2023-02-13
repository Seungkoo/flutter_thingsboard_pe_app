import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entity_details_page.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';
import 'package:thingsboard_app/generated/l10n.dart';

class SiteDetailsPage extends EntityDetailsPage<Asset> {
  SiteDetailsPage(TbContext tbContext, String siteId)
      : super(tbContext,
            entityId: siteId,
            defaultTitle: '현장',
            subTitle: '현장 상세정보');

  @override
  Future<Asset?> fetchEntity(String siteId) {
    return tbClient.getAssetService().getAsset(siteId);
  }

  @override
  Widget buildEntityDetails(BuildContext context, Asset site) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('${S.of(context).assetName}', style: labelTextStyle),
              Text(site.name, style: valueTextStyle),
              SizedBox(height: 16),
              Text('${S.of(context).type}', style: labelTextStyle),
              Text(site.type, style: valueTextStyle),
              SizedBox(height: 16),
              Text('${S.of(context).label}', style: labelTextStyle),
              Text(site.label ?? '', style: valueTextStyle),
            ]));
  }
}
