import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

import 'sets_list.dart';

class SetsPage extends TbContextWidget {
  final bool searchMode;

  SetsPage(TbContext tbContext, {this.searchMode = false}) : super(tbContext);

  @override
  _SetsPageState createState() => _SetsPageState();
}

class _SetsPageState extends TbContextState<SetsPage>
    with AutomaticKeepAliveClientMixin<SetsPage> {
  final PageLinkController _pageLinkController = PageLinkController();

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    var setsList = SetsList(tbContext, _pageLinkController,
        searchMode: widget.searchMode);
    PreferredSizeWidget appBar;
    if (widget.searchMode) {
      appBar = TbAppSearchBar(
        tbContext,
        onSearch: (searchText) => _pageLinkController.onSearchText(searchText),
      );
    } else {
      appBar = TbAppBar(tbContext, title: Text(setsList.title), actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            navigateTo('/sets?search=true');
          },
        )
      ]);
    }
    return Scaffold(appBar: appBar, body: setsList);
  }

  @override
  void dispose() {
    _pageLinkController.dispose();
    super.dispose();
  }
}
