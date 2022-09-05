import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_list_widget.dart';
import 'package:thingsboard_app/modules/site/sites_base.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

class SitesListWidget extends EntitiesListPageLinkWidget<Asset>
    with SitesBase {
  SitesListWidget(TbContext tbContext,
      {EntitiesListWidgetController? controller})
      : super(tbContext, controller: controller);

  @override
  void onViewAll() {
    navigateTo('/sites');
  }
}
