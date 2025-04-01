import 'package:flutter/material.dart';
import 'package:my_message/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Connect',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            horizontalSpaceSmall,
            Text(
              '&',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            horizontalSpaceSmall,
            Text(
              'Chat',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            )
          ],
        ),
        centerTitle: false,
        leading: const SizedBox(),
        leadingWidth: 0,
      ),
      body: viewModel.getSelectedPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            ),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        onTap: viewModel.selectPage,
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
