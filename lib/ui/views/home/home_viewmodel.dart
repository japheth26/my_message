import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_message/ui/views/chat/chat_view.dart';
import 'package:my_message/ui/views/people/people_view.dart';
import 'package:my_message/ui/views/profile/profile_view.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  User? _user;

  User? get user => _user;

  List<Widget> pages = [
    const ChatView(),
    const PeopleView(),
    const ProfileView()
  ];

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void selectPage(int i) {
    _currentIndex = i;

    rebuildUi();
  }

  Widget getSelectedPage() {
    return pages[_currentIndex];
  }

  void initializePages() {
    pages[0] = ChatView(
      goToSearchPage: () {
        selectPage(1);
      },
    );
  }
}
