import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/state_status.dart';
import '../../common/widgets/logout_button_widget.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.stateStatus == StateStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: viewModel.profileBackgroundColor,
              child: Text(
                viewModel.user?.displayName?[0].toUpperCase() ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              viewModel.user?.displayName ?? '',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              viewModel.user?.email ?? '',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
          const Expanded(child: SizedBox()),
          LogoutButtonWidget(
            loading: viewModel.stateStatus == StateStatus.loading,
            label: 'Logout',
            onPressed: viewModel.logout,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();

  @override
  Future<void> onViewModelReady(ProfileViewModel viewModel) async {
    super.onViewModelReady(viewModel);

    await viewModel.getCurrentUser();
  }
}
