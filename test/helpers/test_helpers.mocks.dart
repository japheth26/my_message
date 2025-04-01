// Mocks generated by Mockito 5.4.5 from annotations
// in my_message/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i11;
import 'dart:ui' as _i12;

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:dartz/dartz.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i2;
import 'package:flutter/material.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i9;
import 'package:my_message/domain/vo/get_conversation_vo.dart' as _i21;
import 'package:my_message/domain/vo/get_recent_chat_vo.dart' as _i27;
import 'package:my_message/domain/vo/login_vo.dart' as _i15;
import 'package:my_message/domain/vo/search_member_vo.dart' as _i18;
import 'package:my_message/domain/vo/send_message_vo.dart' as _i22;
import 'package:my_message/domain/vo/sign_up_vo.dart' as _i14;
import 'package:my_message/domain/vo/update_recent_chat_vo.dart' as _i25;
import 'package:my_message/services/auth_service.dart' as _i13;
import 'package:my_message/services/conversation_service.dart' as _i20;
import 'package:my_message/services/dto/member_dto.dart' as _i19;
import 'package:my_message/services/dto/message_dto.dart' as _i23;
import 'package:my_message/services/dto/recent_chat_dto.dart' as _i26;
import 'package:my_message/services/dto/retrieved_messages_dto.dart' as _i6;
import 'package:my_message/services/dto/retrieved_recent_chats_dto.dart' as _i7;
import 'package:my_message/services/dto/searched_members_dto.dart' as _i5;
import 'package:my_message/services/firebase_service.dart' as _i16;
import 'package:my_message/services/recent_chats_service.dart' as _i24;
import 'package:my_message/services/user_service.dart' as _i17;
import 'package:stacked_services/stacked_services.dart' as _i8;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUser_0 extends _i1.SmartFake implements _i2.User {
  _FakeUser_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUnit_1 extends _i1.SmartFake implements _i3.Unit {
  _FakeUnit_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFirebaseAuth_2 extends _i1.SmartFake implements _i2.FirebaseAuth {
  _FakeFirebaseAuth_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFirebaseFirestore_3 extends _i1.SmartFake
    implements _i4.FirebaseFirestore {
  _FakeFirebaseFirestore_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSearchedMembersDto_4 extends _i1.SmartFake
    implements _i5.SearchedMembersDto {
  _FakeSearchedMembersDto_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRetrievedMessagesDto_5 extends _i1.SmartFake
    implements _i6.RetrievedMessagesDto {
  _FakeRetrievedMessagesDto_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRetrievedRecentChatsDto_6 extends _i1.SmartFake
    implements _i7.RetrievedRecentChatsDto {
  _FakeRetrievedRecentChatsDto_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i8.NavigationService {
  @override
  String get previousRoute => (super.noSuchMethod(
        Invocation.getter(#previousRoute),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.getter(#previousRoute),
        ),
        returnValueForMissingStub: _i9.dummyValue<String>(
          this,
          Invocation.getter(#previousRoute),
        ),
      ) as String);

  @override
  String get currentRoute => (super.noSuchMethod(
        Invocation.getter(#currentRoute),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.getter(#currentRoute),
        ),
        returnValueForMissingStub: _i9.dummyValue<String>(
          this,
          Invocation.getter(#currentRoute),
        ),
      ) as String);

  @override
  _i10.GlobalKey<_i10.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(
        Invocation.method(
          #nestedNavigationKey,
          [index],
        ),
        returnValueForMissingStub: null,
      ) as _i10.GlobalKey<_i10.NavigatorState>?);

  @override
  void config({
    bool? enableLog,
    bool? defaultPopGesture,
    bool? defaultOpaqueRoute,
    Duration? defaultDurationTransition,
    bool? defaultGlobalState,
    _i8.Transition? defaultTransitionStyle,
    String? defaultTransition,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #config,
          [],
          {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransitionStyle: defaultTransitionStyle,
            #defaultTransition: defaultTransition,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.Future<T?>? navigateWithTransition<T>(
    _i10.Widget? page, {
    bool? opaque,
    String? transition = '',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i10.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i8.Transition? transitionClass,
    _i8.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i11.Future<T?>?);

  @override
  _i11.Future<T?>? replaceWithTransition<T>(
    _i10.Widget? page, {
    bool? opaque,
    String? transition = '',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i10.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i8.Transition? transitionClass,
    _i8.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i11.Future<T?>?);

  @override
  bool back<T>({
    dynamic result,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #back,
          [],
          {
            #result: result,
            #id: id,
          },
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  void popUntil(
    _i10.RoutePredicate? predicate, {
    int? id,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
          {#id: id},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void popRepeated(int? popTimes) => super.noSuchMethod(
        Invocation.method(
          #popRepeated,
          [popTimes],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.Future<T?>? navigateTo<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i10.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateTo,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i11.Future<T?>?);

  @override
  _i11.Future<T?>? navigateToView<T>(
    _i10.Widget? view, {
    dynamic arguments,
    int? id,
    bool? opaque,
    _i10.Curve? curve,
    Duration? duration,
    bool? fullscreenDialog = false,
    bool? popGesture,
    bool? preventDuplicates = true,
    _i8.Transition? transition,
    _i8.Transition? transitionStyle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToView,
          [view],
          {
            #arguments: arguments,
            #id: id,
            #opaque: opaque,
            #curve: curve,
            #duration: duration,
            #fullscreenDialog: fullscreenDialog,
            #popGesture: popGesture,
            #preventDuplicates: preventDuplicates,
            #transition: transition,
            #transitionStyle: transitionStyle,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i11.Future<T?>?);

  @override
  _i11.Future<T?>? replaceWith<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i10.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i11.Future<T?>?);

  @override
  _i11.Future<T?>? clearStackAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i11.Future<T?>?);

  @override
  _i11.Future<T?>? clearStackAndShowView<T>(
    _i10.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i11.Future<T?>?);

  @override
  _i11.Future<T?>? clearTillFirstAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i11.Future<T?>?);

  @override
  _i11.Future<T?>? clearTillFirstAndShowView<T>(
    _i10.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i11.Future<T?>?);

  @override
  _i11.Future<T?>? pushNamedAndRemoveUntil<T>(
    String? routeName, {
    _i10.RoutePredicate? predicate,
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamedAndRemoveUntil,
          [routeName],
          {
            #predicate: predicate,
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i11.Future<T?>?);
}

/// A class which mocks [BottomSheetService].
///
/// See the documentation for Mockito's code generation for more information.
class MockBottomSheetService extends _i1.Mock
    implements _i8.BottomSheetService {
  @override
  void setCustomSheetBuilders(Map<dynamic, _i8.SheetBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #setCustomSheetBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.Future<_i8.SheetResponse<dynamic>?> showBottomSheet({
    required String? title,
    String? description,
    String? confirmButtonTitle = 'Ok',
    String? cancelButtonTitle,
    bool? enableDrag = true,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
    double? elevation = 1.0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {
            #title: title,
            #description: description,
            #confirmButtonTitle: confirmButtonTitle,
            #cancelButtonTitle: cancelButtonTitle,
            #enableDrag: enableDrag,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
            #elevation: elevation,
          },
        ),
        returnValue: _i11.Future<_i8.SheetResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i11.Future<_i8.SheetResponse<dynamic>?>.value(),
      ) as _i11.Future<_i8.SheetResponse<dynamic>?>);

  @override
  _i11.Future<_i8.SheetResponse<T>?> showCustomSheet<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i12.Color? barrierColor = const _i12.Color(2315255808),
    double? elevation = 1.0,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    String? barrierLabel = '',
    dynamic customData,
    R? data,
    bool? enableDrag = true,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSheet,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #elevation: elevation,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
            #enableDrag: enableDrag,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i11.Future<_i8.SheetResponse<T>?>.value(),
        returnValueForMissingStub: _i11.Future<_i8.SheetResponse<T>?>.value(),
      ) as _i11.Future<_i8.SheetResponse<T>?>);

  @override
  void completeSheet(_i8.SheetResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeSheet,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i8.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i8.DialogBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void registerCustomDialogBuilder({
    required dynamic variant,
    required _i10.Widget Function(
      _i10.BuildContext,
      _i8.DialogRequest<dynamic>,
      dynamic Function(_i8.DialogResponse<dynamic>),
    )? builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.Future<_i8.DialogResponse<dynamic>?> showDialog({
    String? title,
    String? description,
    String? cancelTitle,
    _i12.Color? cancelTitleColor,
    String? buttonTitle = 'Ok',
    _i12.Color? buttonTitleColor,
    bool? barrierDismissible = false,
    _i10.RouteSettings? routeSettings,
    _i10.GlobalKey<_i10.NavigatorState>? navigatorKey,
    _i8.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #buttonTitle: buttonTitle,
            #buttonTitleColor: buttonTitleColor,
            #barrierDismissible: barrierDismissible,
            #routeSettings: routeSettings,
            #navigatorKey: navigatorKey,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i11.Future<_i8.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i11.Future<_i8.DialogResponse<dynamic>?>.value(),
      ) as _i11.Future<_i8.DialogResponse<dynamic>?>);

  @override
  _i11.Future<_i8.DialogResponse<T>?> showCustomDialog<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i12.Color? barrierColor = const _i12.Color(2315255808),
    bool? barrierDismissible = false,
    String? barrierLabel = '',
    bool? useSafeArea = true,
    _i10.RouteSettings? routeSettings,
    _i10.GlobalKey<_i10.NavigatorState>? navigatorKey,
    _i10.RouteTransitionsBuilder? transitionBuilder,
    dynamic customData,
    R? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #barrierLabel: barrierLabel,
            #useSafeArea: useSafeArea,
            #routeSettings: routeSettings,
            #navigatorKey: navigatorKey,
            #transitionBuilder: transitionBuilder,
            #customData: customData,
            #data: data,
          },
        ),
        returnValue: _i11.Future<_i8.DialogResponse<T>?>.value(),
        returnValueForMissingStub: _i11.Future<_i8.DialogResponse<T>?>.value(),
      ) as _i11.Future<_i8.DialogResponse<T>?>);

  @override
  _i11.Future<_i8.DialogResponse<dynamic>?> showConfirmationDialog({
    String? title,
    String? description,
    String? cancelTitle = 'Cancel',
    _i12.Color? cancelTitleColor,
    String? confirmationTitle = 'Ok',
    _i12.Color? confirmationTitleColor,
    bool? barrierDismissible = false,
    _i10.RouteSettings? routeSettings,
    _i8.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showConfirmationDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #confirmationTitle: confirmationTitle,
            #confirmationTitleColor: confirmationTitleColor,
            #barrierDismissible: barrierDismissible,
            #routeSettings: routeSettings,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i11.Future<_i8.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i11.Future<_i8.DialogResponse<dynamic>?>.value(),
      ) as _i11.Future<_i8.DialogResponse<dynamic>?>);

  @override
  void completeDialog(_i8.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeDialog,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthService extends _i1.Mock implements _i13.AuthService {
  @override
  _i11.Future<_i2.User> signUp(_i14.SignUpVo? vo) => (super.noSuchMethod(
        Invocation.method(
          #signUp,
          [vo],
        ),
        returnValue: _i11.Future<_i2.User>.value(_FakeUser_0(
          this,
          Invocation.method(
            #signUp,
            [vo],
          ),
        )),
        returnValueForMissingStub: _i11.Future<_i2.User>.value(_FakeUser_0(
          this,
          Invocation.method(
            #signUp,
            [vo],
          ),
        )),
      ) as _i11.Future<_i2.User>);

  @override
  _i11.Future<_i2.User> login(_i15.LoginVo? vo) => (super.noSuchMethod(
        Invocation.method(
          #login,
          [vo],
        ),
        returnValue: _i11.Future<_i2.User>.value(_FakeUser_0(
          this,
          Invocation.method(
            #login,
            [vo],
          ),
        )),
        returnValueForMissingStub: _i11.Future<_i2.User>.value(_FakeUser_0(
          this,
          Invocation.method(
            #login,
            [vo],
          ),
        )),
      ) as _i11.Future<_i2.User>);

  @override
  _i11.Future<_i3.Unit> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i11.Future<_i3.Unit>.value(_FakeUnit_1(
          this,
          Invocation.method(
            #logout,
            [],
          ),
        )),
        returnValueForMissingStub: _i11.Future<_i3.Unit>.value(_FakeUnit_1(
          this,
          Invocation.method(
            #logout,
            [],
          ),
        )),
      ) as _i11.Future<_i3.Unit>);
}

/// A class which mocks [FirebaseService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseService extends _i1.Mock implements _i16.FirebaseService {
  @override
  _i2.FirebaseAuth get firebaseAuth => (super.noSuchMethod(
        Invocation.getter(#firebaseAuth),
        returnValue: _FakeFirebaseAuth_2(
          this,
          Invocation.getter(#firebaseAuth),
        ),
        returnValueForMissingStub: _FakeFirebaseAuth_2(
          this,
          Invocation.getter(#firebaseAuth),
        ),
      ) as _i2.FirebaseAuth);

  @override
  _i4.FirebaseFirestore get firebaseFirestore => (super.noSuchMethod(
        Invocation.getter(#firebaseFirestore),
        returnValue: _FakeFirebaseFirestore_3(
          this,
          Invocation.getter(#firebaseFirestore),
        ),
        returnValueForMissingStub: _FakeFirebaseFirestore_3(
          this,
          Invocation.getter(#firebaseFirestore),
        ),
      ) as _i4.FirebaseFirestore);
}

/// A class which mocks [UserService].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserService extends _i1.Mock implements _i17.UserService {
  @override
  _i11.Future<_i3.Unit> saveUser(
    String? userId,
    _i14.SignUpVo? vo,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveUser,
          [
            userId,
            vo,
          ],
        ),
        returnValue: _i11.Future<_i3.Unit>.value(_FakeUnit_1(
          this,
          Invocation.method(
            #saveUser,
            [
              userId,
              vo,
            ],
          ),
        )),
        returnValueForMissingStub: _i11.Future<_i3.Unit>.value(_FakeUnit_1(
          this,
          Invocation.method(
            #saveUser,
            [
              userId,
              vo,
            ],
          ),
        )),
      ) as _i11.Future<_i3.Unit>);

  @override
  _i11.Future<_i5.SearchedMembersDto> searchMembers(_i18.SearchMemberVo? vo) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMembers,
          [vo],
        ),
        returnValue:
            _i11.Future<_i5.SearchedMembersDto>.value(_FakeSearchedMembersDto_4(
          this,
          Invocation.method(
            #searchMembers,
            [vo],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<_i5.SearchedMembersDto>.value(_FakeSearchedMembersDto_4(
          this,
          Invocation.method(
            #searchMembers,
            [vo],
          ),
        )),
      ) as _i11.Future<_i5.SearchedMembersDto>);

  @override
  _i11.Future<List<_i19.MemberDto>> getMembers(List<String>? userIds) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMembers,
          [userIds],
        ),
        returnValue:
            _i11.Future<List<_i19.MemberDto>>.value(<_i19.MemberDto>[]),
        returnValueForMissingStub:
            _i11.Future<List<_i19.MemberDto>>.value(<_i19.MemberDto>[]),
      ) as _i11.Future<List<_i19.MemberDto>>);
}

/// A class which mocks [ConversationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockConversationService extends _i1.Mock
    implements _i20.ConversationService {
  @override
  _i11.Future<String> getRoomId(
    String? userId1,
    String? userId2,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRoomId,
          [
            userId1,
            userId2,
          ],
        ),
        returnValue: _i11.Future<String>.value(_i9.dummyValue<String>(
          this,
          Invocation.method(
            #getRoomId,
            [
              userId1,
              userId2,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<String>.value(_i9.dummyValue<String>(
          this,
          Invocation.method(
            #getRoomId,
            [
              userId1,
              userId2,
            ],
          ),
        )),
      ) as _i11.Future<String>);

  @override
  _i11.Future<_i6.RetrievedMessagesDto> getConversation(
          _i21.GetConversationVo? vo) =>
      (super.noSuchMethod(
        Invocation.method(
          #getConversation,
          [vo],
        ),
        returnValue: _i11.Future<_i6.RetrievedMessagesDto>.value(
            _FakeRetrievedMessagesDto_5(
          this,
          Invocation.method(
            #getConversation,
            [vo],
          ),
        )),
        returnValueForMissingStub: _i11.Future<_i6.RetrievedMessagesDto>.value(
            _FakeRetrievedMessagesDto_5(
          this,
          Invocation.method(
            #getConversation,
            [vo],
          ),
        )),
      ) as _i11.Future<_i6.RetrievedMessagesDto>);

  @override
  _i11.Future<_i3.Unit> sendMessage(_i22.SendMessageVo? vo) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendMessage,
          [vo],
        ),
        returnValue: _i11.Future<_i3.Unit>.value(_FakeUnit_1(
          this,
          Invocation.method(
            #sendMessage,
            [vo],
          ),
        )),
        returnValueForMissingStub: _i11.Future<_i3.Unit>.value(_FakeUnit_1(
          this,
          Invocation.method(
            #sendMessage,
            [vo],
          ),
        )),
      ) as _i11.Future<_i3.Unit>);

  @override
  _i11.Stream<List<_i23.MessageDto>> connectConversationStream(
          String? roomId) =>
      (super.noSuchMethod(
        Invocation.method(
          #connectConversationStream,
          [roomId],
        ),
        returnValue: _i11.Stream<List<_i23.MessageDto>>.empty(),
        returnValueForMissingStub: _i11.Stream<List<_i23.MessageDto>>.empty(),
      ) as _i11.Stream<List<_i23.MessageDto>>);
}

/// A class which mocks [RecentChatsService].
///
/// See the documentation for Mockito's code generation for more information.
class MockRecentChatsService extends _i1.Mock
    implements _i24.RecentChatsService {
  @override
  _i11.Future<_i3.Unit> updateRecentChat(_i25.UpdateRecentChatVo? vo) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateRecentChat,
          [vo],
        ),
        returnValue: _i11.Future<_i3.Unit>.value(_FakeUnit_1(
          this,
          Invocation.method(
            #updateRecentChat,
            [vo],
          ),
        )),
        returnValueForMissingStub: _i11.Future<_i3.Unit>.value(_FakeUnit_1(
          this,
          Invocation.method(
            #updateRecentChat,
            [vo],
          ),
        )),
      ) as _i11.Future<_i3.Unit>);

  @override
  _i11.Future<_i3.Unit> readRecentChat(
    String? roomId,
    String? authUserId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #readRecentChat,
          [
            roomId,
            authUserId,
          ],
        ),
        returnValue: _i11.Future<_i3.Unit>.value(_FakeUnit_1(
          this,
          Invocation.method(
            #readRecentChat,
            [
              roomId,
              authUserId,
            ],
          ),
        )),
        returnValueForMissingStub: _i11.Future<_i3.Unit>.value(_FakeUnit_1(
          this,
          Invocation.method(
            #readRecentChat,
            [
              roomId,
              authUserId,
            ],
          ),
        )),
      ) as _i11.Future<_i3.Unit>);

  @override
  _i11.Stream<List<_i26.RecentChatDto>> connectRecentChatsStream(
          String? authUserId) =>
      (super.noSuchMethod(
        Invocation.method(
          #connectRecentChatsStream,
          [authUserId],
        ),
        returnValue: _i11.Stream<List<_i26.RecentChatDto>>.empty(),
        returnValueForMissingStub:
            _i11.Stream<List<_i26.RecentChatDto>>.empty(),
      ) as _i11.Stream<List<_i26.RecentChatDto>>);

  @override
  _i11.Future<_i7.RetrievedRecentChatsDto> getRecentChats(
          _i27.GetRecentChatsVo? vo) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRecentChats,
          [vo],
        ),
        returnValue: _i11.Future<_i7.RetrievedRecentChatsDto>.value(
            _FakeRetrievedRecentChatsDto_6(
          this,
          Invocation.method(
            #getRecentChats,
            [vo],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<_i7.RetrievedRecentChatsDto>.value(
                _FakeRetrievedRecentChatsDto_6(
          this,
          Invocation.method(
            #getRecentChats,
            [vo],
          ),
        )),
      ) as _i11.Future<_i7.RetrievedRecentChatsDto>);
}
