import 'package:flutter/material.dart';
import 'package:flutter_use_case/model/reply_model.dart';
import 'package:flutter_use_case/model/user_model.dart';
import 'package:kartal/kartal.dart';

class SpecialSearchView extends StatefulWidget {
  const SpecialSearchView({super.key});

  @override
  State<SpecialSearchView> createState() => _SpecialSearchViewState();
}

class _SpecialSearchViewState extends State<SpecialSearchView> {
  late final SearchUserReply searchUserReply;

  List<Reply> _searchedReplies = [];
  List<User> _searchedUser = [];

  @override
  void initState() {
    super.initState();
    searchUserReply =
        SearchUserReply(users: User.users, replies: Reply.replies);
    _searchListUpdate(searchUserReply);
  }

  void _searchListUpdate(SearchUserReply searchUserReply) {
    _searchedUser = searchUserReply.users.toList();
    _searchedReplies = searchUserReply.replies.toList();
  }

  void _searchKey(String key) {
    final newSearch = searchUserReply.find(key);
    setState(() {
      _searchListUpdate(newSearch);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          TextField(
            onChanged: _searchKey,
          ).toSliver,
          Text(
            'User List',
            style: context.general.textTheme.headlineSmall,
          ).ext.toVisible(value: _searchedUser.isNotEmpty).toSliver,
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  child: Text(_searchedUser[index].name ?? ''),
                );
              },
              childCount: _searchedUser.length,
            ),
          ),
          context.sized.emptySizedHeightBoxHigh.toSliver,
          Text(
            'Reply List',
            style: context.general.textTheme.headlineSmall,
          ).ext.toVisible(value: _searchedReplies.isNotEmpty).toSliver,
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  child: Text(_searchedReplies[index].result ?? ''),
                );
              },
              childCount: _searchedReplies.length,
            ),
          ),
        ],
      ),
    );
  }
}

extension WidgetExtension on Widget {
  Widget get toSliver => SliverToBoxAdapter(
        child: this,
      );
}

class SearchUserReply {
  SearchUserReply({required this.users, required this.replies});

  final List<User> users;
  final List<Reply> replies;

  SearchUserReply find(String key) {
    final items =
        users.where((element) => element.name?.contains(key) ?? false).toList();
    final itemSearchedReply = replies
        .where((element) => element.result?.contains(key) ?? false)
        .toList();
    return SearchUserReply(users: items, replies: itemSearchedReply);
  }
}
