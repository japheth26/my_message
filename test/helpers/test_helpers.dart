import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_message/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_message/services/auth_service.dart';
import 'package:my_message/services/firebase_service.dart';

import 'test_helpers.mocks.dart';
import 'package:my_message/services/user_service.dart';
import 'package:my_message/services/conversation_service.dart';
import 'package:my_message/services/recent_chats_service.dart';
// @stacked-import

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<AuthService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<FirebaseService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<UserService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ConversationService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<RecentChatsService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
  ],
)
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterAuthService();
  getAndRegisterFirebaseService();
  getAndRegisterUserService();
  getAndRegisterConversationService();
  getAndRegisterRecentChatsService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(
    service.showCustomSheet<T, T>(
      enableDrag: anyNamed('enableDrag'),
      enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
      exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
      ignoreSafeArea: anyNamed('ignoreSafeArea'),
      isScrollControlled: anyNamed('isScrollControlled'),
      barrierDismissible: anyNamed('barrierDismissible'),
      additionalButtonTitle: anyNamed('additionalButtonTitle'),
      variant: anyNamed('variant'),
      title: anyNamed('title'),
      hasImage: anyNamed('hasImage'),
      imageUrl: anyNamed('imageUrl'),
      showIconInMainButton: anyNamed('showIconInMainButton'),
      mainButtonTitle: anyNamed('mainButtonTitle'),
      showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
      secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
      showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
      takesInput: anyNamed('takesInput'),
      barrierColor: anyNamed('barrierColor'),
      barrierLabel: anyNamed('barrierLabel'),
      customData: anyNamed('customData'),
      data: anyNamed('data'),
      description: anyNamed('description'),
    ),
  ).thenAnswer(
    (realInvocation) =>
        Future.value(showCustomSheetResponse ?? SheetResponse<T>()),
  );

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockAuthService getAndRegisterAuthService() {
  _removeRegistrationIfExists<AuthService>();
  final service = MockAuthService();
  locator.registerSingleton<AuthService>(service);
  return service;
}

MockFirebaseService getAndRegisterFirebaseService() {
  _removeRegistrationIfExists<FirebaseService>();
  final service = MockFirebaseService();
  locator.registerSingleton<FirebaseService>(service);
  return service;
}

MockUserService getAndRegisterUserService() {
  _removeRegistrationIfExists<UserService>();
  final service = MockUserService();
  locator.registerSingleton<UserService>(service);
  return service;
}

MockConversationService getAndRegisterConversationService() {
  _removeRegistrationIfExists<ConversationService>();
  final service = MockConversationService();
  locator.registerSingleton<ConversationService>(service);
  return service;
}

MockRecentChatsService getAndRegisterRecentChatsService() {
  _removeRegistrationIfExists<RecentChatsService>();
  final service = MockRecentChatsService();
  locator.registerSingleton<RecentChatsService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
