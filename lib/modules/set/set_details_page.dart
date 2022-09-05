import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entity_details_page.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';
import 'package:thingsboard_app/generated/l10n.dart';

class SetDetailsPage extends EntityDetailsPage<Asset> {
  SetDetailsPage(TbContext tbContext, String setId)
      : super(tbContext,
            entityId: setId,
            defaultTitle: '자원',
            subTitle: '자원 상세정보');

  @override
  Future<Asset?> fetchEntity(String setId) {
    return tbClient.getAssetService().getAsset(setId);
  }

  @override
  Widget buildEntityDetails(BuildContext context, Asset set) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('${S.of(context).assetName}', style: labelTextStyle),
              Text(set.name, style: valueTextStyle),
              SizedBox(height: 16),
              Text('${S.of(context).type}', style: labelTextStyle),
              Text(set.type, style: valueTextStyle),
              SizedBox(height: 16),
              Text('${S.of(context).label}', style: labelTextStyle),
              Text(set.label ?? '', style: valueTextStyle),
            ]));
  }
}
