import 'package:my_message/repositories/auth_repository.dart';
import 'package:my_message/repositories/conversation_repository.dart';
import 'package:my_message/repositories/user_repository.dart';
import 'package:my_message/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:my_message/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:my_message/ui/views/home/home_view.dart';
import 'package:my_message/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_message/ui/views/login/login_view.dart';
import 'package:my_message/ui/views/sign_up/sign_up_view.dart';
import 'package:my_message/ui/views/chat/chat_view.dart';
import 'package:my_message/ui/views/people/people_view.dart';
import 'package:my_message/ui/views/profile/profile_view.dart';
import 'package:my_message/ui/views/conversation/conversation_view.dart';
import 'package:my_message/services/auth_service.dart';
import 'package:my_message/ui/dialogs/error/error_dialog.dart';
import 'package:my_message/services/firebase_service.dart';
import 'package:my_message/services/firebase_service.dart';
import 'package:my_message/services/user_service.dart';
import 'package:my_message/services/conversation_service.dart';
import 'package:my_message/services/recent_chats_service.dart';

import '../repositories/recent_chats_repository.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignUpView),
    CustomRoute(page: HomeView, children: [
      CustomRoute(page: ChatView, initial: true),
      CustomRoute(page: PeopleView),
      CustomRoute(page: ProfileView),
    ]),

    MaterialRoute(page: ConversationView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: AuthRepository),
    LazySingleton(classType: UserRepository),
    LazySingleton(classType: ConversationRepository),
    LazySingleton(classType: RecentChatsRepository),

    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: FirebaseService),
    LazySingleton(classType: ConversationService),
    LazySingleton(classType: RecentChatsService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: ErrorDialog),
// @stacked-dialog
  ],
)
class App {}
