import 'package:flutter/material.dart';
import 'package:my_message/core/state_status.dart';
import 'package:my_message/domain/entities/member_entity.dart';
import 'package:my_message/ui/common/widgets/chat_bubble_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stacked/stacked.dart';

import '../../common/widgets/chat_composer_widget.dart';
import 'conversation_viewmodel.dart';

class ConversationView extends StackedView<ConversationViewModel> {
  const ConversationView({Key? key, required this.member}) : super(key: key);

  final MemberEntity member;

  @override
  Widget builder(
    BuildContext context,
    ConversationViewModel viewModel,
    Widget? child,
  ) {
    final nameList = member.fullName.split(' ') ?? [];
    final initial = nameList.isNotEmpty ? nameList[0][0] : '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 40,
          ),
        ),
        actions: const [
          SizedBox(width: 50),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: member.colorValue != null
                    ? Color(member.colorValue!)
                    : Colors.deepOrange,
                borderRadius: BorderRadius.circular(80),
              ),
              alignment: Alignment.center,
              child: Text(
                initial.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              member.fullName,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Builder(builder: (context) {
            if (viewModel.messages.isEmpty &&
                viewModel.stateStatus == StateStatus.loading) {
              return const Expanded(
                child: Column(
                  children: [
                    Expanded(child: SizedBox()),
                    CircularProgressIndicator(),
                    Expanded(child: SizedBox()),
                  ],
                ),
              );
            }

            if (viewModel.messages.isEmpty &&
                viewModel.stateStatus != StateStatus.initial) {
              return Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(child: SizedBox()),
                      Text(
                        'Don\'t be shy',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.sentiment_very_satisfied_rounded,
                        size: 100,
                        color: Colors.grey[800],
                      ),
                      Text(
                        'Say something!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[800],
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
              );
            }

            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 10, right: 10, bottom: 0),
                child: ListView.builder(
                  reverse: true,
                  itemCount: viewModel.messages.length,
                  itemBuilder: (context, index) {
                    final message = viewModel.messages[index];
                    return Column(
                      children: [
                        Visibility(
                          visible: index == viewModel.messages.length - 1 &&
                              viewModel.stateStatus == StateStatus.loading,
                          child: const Align(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        ChatBubbleWidget(
                          id: message.docId,
                          isMe: viewModel.authUserId == message.addedBy,
                          name: member.fullName,
                          message: message.message,
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          }),
          ChatComposerWidget(
            controller: viewModel.composerContnroller,
            send: () {
              viewModel.sendMessage(
                  member.userId, viewModel.composerContnroller.text);
              viewModel.composerContnroller.clear();
            },
          ),
        ],
      ),
    );
  }

  @override
  ConversationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ConversationViewModel();

  @override
  Future<void> onViewModelReady(ConversationViewModel viewModel) async {
    super.onViewModelReady(viewModel);

    viewModel.changeStateStatus(StateStatus.loading);
    await viewModel.getAuthUser();
    await viewModel.getRoomId(member.userId);
    await viewModel.getConversation(viewModel.roomId);
    viewModel.connectToStream();
    viewModel.changeStateStatus(StateStatus.loaded);
  }

  @override
  void onDispose(ConversationViewModel viewModel) {
    super.onDispose(viewModel);
    viewModel.composerContnroller.dispose();
  }
}
