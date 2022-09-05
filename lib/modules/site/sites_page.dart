import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

import 'sites_grid.dart';  //for grid layout
import 'sites_list.dart';

class SitesPage extends TbContextWidget {
  final bool searchMode;

  SitesPage(TbContext tbContext, {this.searchMode = false}) : super(tbContext);

  @override
  _SitesPageState createState() => _SitesPageState();
}

class _SitesPageState extends TbContextState<SitesPage>
    with AutomaticKeepAliveClientMixin<SitesPage> {
  final PageLinkController _pageLinkController = PageLinkController();

  @override
  bool get wantKeepAlive {
    return true;
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
 //   var sitesList = SitesGrid(tbContext, _pageLinkController,
    var sitesList = SitesList(tbContext, _pageLinkController,
        searchMode: widget.searchMode);
    PreferredSizeWidget appBar;
    if (widget.searchMode) {
      appBar = TbAppSearchBar(
        tbContext,
        onSearch: (searchText) => _pageLinkController.onSearchText(searchText),
      );
    } else {
      appBar = TbAppBar(tbContext, title: Text(sitesList.title), actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            navigateTo('/sites?search=true');
          },
        )
      ]);
    }
    return Scaffold(appBar: appBar, body: sitesList);
  }

  @override
  void dispose() {
    _pageLinkController.dispose();
    super.dispose();
  }
}
