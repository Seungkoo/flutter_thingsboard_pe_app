import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

import 'sites_base.dart';
import 'site_model.dart';

class SitesList extends BaseEntitiesWidget<Site, PageLink>
    with SitesBase, EntitiesListStateBase {
  SitesList(TbContext tbContext, PageKeyController<PageLink> pageKeyController,
      {searchMode = false})
      : super(tbContext, pageKeyController, searchMode: searchMode);
}
