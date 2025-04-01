import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_message/app/app.router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../core/state_status.dart';
import '../../common/widgets/person_item_widget.dart';
import '../../common/widgets/search_field_widget.dart';
import 'people_viewmodel.dart';
import 'people_view.form.dart';

@FormView(fields: [FormTextField(name: 'searchInput')])
class PeopleView extends StackedView<PeopleViewModel> with $PeopleView {
  const PeopleView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PeopleViewModel viewModel,
    Widget? child,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: SearchFieldWidget(
            controller: searchInputController,
          ),
        ),
        Builder(builder: (context) {
          if (viewModel.searchedMembers.isEmpty &&
              viewModel.stateStatus == StateStatus.loading) {
            return const Expanded(
                child: Column(
              children: [
                Expanded(child: SizedBox()),
                CircularProgressIndicator(),
                Expanded(child: SizedBox()),
              ],
            ));
          }

          if (viewModel.searchedMembers.isEmpty &&
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
                      'Where is everyone?',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.sentiment_very_dissatisfied_outlined,
                      size: 100,
                      color: Colors.grey[800],
                    ),
                    Text(
                      'It\'s seems you\'re alone here!',
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
            child: Builder(builder: (context) {
              final isLoading = viewModel.stateStatus == StateStatus.loading;
              return Skeletonizer(
                enabled: isLoading,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: viewModel.scrollController,
                  itemCount: viewModel.searchedMembers.length,
                  itemBuilder: (context, index) {
                    final member = viewModel.searchedMembers[index];
                    return Column(
                      children: [
                        PersonItemWidget(
                          onTap: () {
                            viewModel.navigationService
                                .navigateToConversationView(member: member);
                          },
                          color: !isLoading
                              ? member.colorValue != null
                                  ? Color(member.colorValue!)
                                  : Colors.deepOrange
                              : Colors.grey.withAlpha(100),
                          name: member.fullName,
                        ),
                        Visibility(
                          visible: index ==
                                  viewModel.searchedMembers.length - 1 &&
                              viewModel.paginationStatus == StateStatus.loading,
                          child: const CircularProgressIndicator(),
                        ),
                      ],
                    );
                  },
                ),
              );
            }),
          );
        })
      ],
    );
  }

  @override
  PeopleViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PeopleViewModel();

  @override
  Future<void> onViewModelReady(PeopleViewModel viewModel) async {
    syncFormWithViewModel(viewModel);
    await viewModel.getAuthUser();
    await viewModel.searchMembers(
        stateStatus: StateStatus.loading, newList: true);

    Timer? debounce;

    searchInputController.addListener(() {
      debounce?.cancel();

      debounce =
          Timer.periodic(const Duration(milliseconds: 500), (timer) async {
        await viewModel.searchMembers(
            stateStatus: StateStatus.loading, newList: true);

        timer.cancel();
      });
    });

    viewModel.scrollController.addListener(viewModel.scrollListener);
  }

  @override
  void onDispose(PeopleViewModel viewModel) {
    super.onDispose(viewModel);

    disposeForm();
  }
}
