import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_grid.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

import 'sites_base.dart';
import 'site_model.dart';

class SitesGrid extends BaseEntitiesWidget<Site, PageLink>
    with SitesBase, EntitiesGridStateBase {
  SitesGrid(
      TbContext tbContext, PageKeyController<PageLink> pageKeyController,
      {searchMode = false})
      : super(tbContext, pageKeyController);
}
