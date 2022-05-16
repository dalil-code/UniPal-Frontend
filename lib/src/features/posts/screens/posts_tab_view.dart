import 'package:flutter/material.dart';

// Widgets
import '../widgets/new_post_bar.dart';
import '../widgets/posts_list.dart';

class PostsTabView extends StatelessWidget {
  const PostsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: RefreshIndicator(
        onRefresh: () => Future.delayed(const Duration(seconds: 3)),
        edgeOffset: 150,
        displacement: 5,
        child: CustomScrollView(
          key: const PageStorageKey<String>('Posts'),
          slivers: <Widget>[
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
      
            // New Post Button
            const NewPostBar(),
      
            // Posts List
            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 8),
              sliver: PostsList(),
            ),
          ],
        ),
      ),
    );
  }
}
