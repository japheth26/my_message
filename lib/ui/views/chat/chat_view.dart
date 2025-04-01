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
  const ChatView({Key? key}) : super(key: key);

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
      child: ListView.builder(
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

    await viewModel.getAuthUser();
    await viewModel.getRecentChats(viewModel.authUserId,
        stateStatus: StateStatus.loading);
    viewModel.connectToStream(viewModel.authUserId);
    viewModel.timer();
  }
}
