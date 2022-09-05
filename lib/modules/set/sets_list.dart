import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

import 'sets_base.dart';

class SetsList extends BaseEntitiesWidget<Asset, PageLink>
    with SetsBase, EntitiesListStateBase {
  SetsList(TbContext tbContext, PageKeyController<PageLink> pageKeyController,
      {searchMode = false})
      : super(tbContext, pageKeyController, searchMode: searchMode);
}
