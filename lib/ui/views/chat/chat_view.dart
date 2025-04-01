import 'package:flutter/material.dart';
import 'package:my_message/app/app.router.dart';
import 'package:my_message/ui/common/utils/text.utils.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stacked/stacked.dart';
import 'package:collection/collection.dart';

import '../../../core/state_status.dart';
import '../../common/widgets/chat_item_widget.dart';
import 'chat_viewmodel.dart';

class ChatView extends StackedView<ChatViewModel> {
  const ChatView({Key? key, this.goToSearchPage}) : super(key: key);

  final Function()? goToSearchPage;

  @override
  Widget builder(
    BuildContext context,
    ChatViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.recentChats.isEmpty &&
        viewModel.stateStatus == StateStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Skeletonizer(
      enabled: viewModel.stateStatus == StateStatus.loading,
      child: Builder(builder: (context) {
        if (viewModel.recentChats.isEmpty) {
          return GestureDetector(
            onTap: goToSearchPage,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Empty',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.search,
                    size: 100,
                    color: Colors.grey[800],
                  ),
                  Text(
                    'Let\'s start to connect!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[800],
                    ),
                  ),
                  const Text(
                    'Tap Here!',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          );
        }

        return ListView.builder(
            controller: viewModel.scrollController,
            itemCount: viewModel.recentChats.length,
            itemBuilder: (context, index) {
              final recentChat = viewModel.recentChats[index];
              final member = viewModel.members.firstWhereOrNull(
                  (e) => recentChat.members.keys.contains(e.userId));
              final unread = recentChat.unread[viewModel.authUserId] ?? false;

              late Color color;
              if (member == null) {
                color = Colors.grey;
                viewModel.getMembers(viewModel.authUserId, [recentChat],
                    rebuildAfter: true);
              } else {
                color = member.colorValue != null
                    ? Color(member.colorValue!)
                    : Colors.deepOrange;
              }

              return ChatItemWidget(
                name: member?.fullName ?? 'Retrieving...',
                message: recentChat.message,
                time: TextUtils.timeAgo(recentChat.addedAt),
                color: color,
                unread: unread,
                onTap: () {
                  if (member != null) {
                    if (unread) {
                      viewModel.readRecentChat(
                          recentChat.roomId, viewModel.authUserId);
                    }

                    viewModel.navigationService
                        .navigateToConversationView(member: member);
                  }
                },
              );
            });
      }),
    );
  }

  @override
  ChatViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatViewModel();

  @override
  Future<void> onViewModelReady(ChatViewModel viewModel) async {
    super.onViewModelReady(viewModel);
    viewModel.changeStateStatus(StateStatus.loading);
    await viewModel.getAuthUser();
    await viewModel.getRecentChats(viewModel.authUserId);
    viewModel.connectToStream(viewModel.authUserId);
    viewModel.timer();
    viewModel.changeStateStatus(StateStatus.loaded);
  }
}
