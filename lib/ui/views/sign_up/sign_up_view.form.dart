// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String FullNameInputValueKey = 'fullNameInput';
const String EmailInputValueKey = 'emailInput';
const String PasswordInputValueKey = 'passwordInput';
const String ConfirmPassInputValueKey = 'confirmPassInput';

final Map<String, TextEditingController> _SignUpViewTextEditingControllers = {};

final Map<String, FocusNode> _SignUpViewFocusNodes = {};

final Map<String, String? Function(String?)?> _SignUpViewTextValidations = {
  FullNameInputValueKey: null,
  EmailInputValueKey: null,
  PasswordInputValueKey: null,
  ConfirmPassInputValueKey: null,
};

mixin $SignUpView {
  TextEditingController get fullNameInputController =>
      _getFormTextEditingController(FullNameInputValueKey);
  TextEditingController get emailInputController =>
      _getFormTextEditingController(EmailInputValueKey);
  TextEditingController get passwordInputController =>
      _getFormTextEditingController(PasswordInputValueKey);
  TextEditingController get confirmPassInputController =>
      _getFormTextEditingController(ConfirmPassInputValueKey);

  FocusNode get fullNameInputFocusNode =>
      _getFormFocusNode(FullNameInputValueKey);
  FocusNode get emailInputFocusNode => _getFormFocusNode(EmailInputValueKey);
  FocusNode get passwordInputFocusNode =>
      _getFormFocusNode(PasswordInputValueKey);
  FocusNode get confirmPassInputFocusNode =>
      _getFormFocusNode(ConfirmPassInputValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_SignUpViewTextEditingControllers.containsKey(key)) {
      return _SignUpViewTextEditingControllers[key]!;
    }

    _SignUpViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _SignUpViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_SignUpViewFocusNodes.containsKey(key)) {
      return _SignUpViewFocusNodes[key]!;
    }
    _SignUpViewFocusNodes[key] = FocusNode();
    return _SignUpViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    fullNameInputController.addListener(() => _updateFormData(model));
    emailInputController.addListener(() => _updateFormData(model));
    passwordInputController.addListener(() => _updateFormData(model));
    confirmPassInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    fullNameInputController.addListener(() => _updateFormData(model));
    emailInputController.addListener(() => _updateFormData(model));
    passwordInputController.addListener(() => _updateFormData(model));
    confirmPassInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          FullNameInputValueKey: fullNameInputController.text,
          EmailInputValueKey: emailInputController.text,
          PasswordInputValueKey: passwordInputController.text,
          ConfirmPassInputValueKey: confirmPassInputController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _SignUpViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _SignUpViewFocusNodes.values) {
      focusNode.dispose();
    }

    _SignUpViewTextEditingControllers.clear();
    _SignUpViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get fullNameInputValue =>
      this.formValueMap[FullNameInputValueKey] as String?;
  String? get emailInputValue =>
      this.formValueMap[EmailInputValueKey] as String?;
  String? get passwordInputValue =>
      this.formValueMap[PasswordInputValueKey] as String?;
  String? get confirmPassInputValue =>
      this.formValueMap[ConfirmPassInputValueKey] as String?;

  set fullNameInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FullNameInputValueKey: value}),
    );

    if (_SignUpViewTextEditingControllers.containsKey(FullNameInputValueKey)) {
      _SignUpViewTextEditingControllers[FullNameInputValueKey]?.text =
          value ?? '';
    }
  }

  set emailInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailInputValueKey: value}),
    );

    if (_SignUpViewTextEditingControllers.containsKey(EmailInputValueKey)) {
      _SignUpViewTextEditingControllers[EmailInputValueKey]?.text = value ?? '';
    }
  }

  set passwordInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PasswordInputValueKey: value}),
    );

    if (_SignUpViewTextEditingControllers.containsKey(PasswordInputValueKey)) {
      _SignUpViewTextEditingControllers[PasswordInputValueKey]?.text =
          value ?? '';
    }
  }

  set confirmPassInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ConfirmPassInputValueKey: value}),
    );

    if (_SignUpViewTextEditingControllers.containsKey(
        ConfirmPassInputValueKey)) {
      _SignUpViewTextEditingControllers[ConfirmPassInputValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasFullNameInput =>
      this.formValueMap.containsKey(FullNameInputValueKey) &&
      (fullNameInputValue?.isNotEmpty ?? false);
  bool get hasEmailInput =>
      this.formValueMap.containsKey(EmailInputValueKey) &&
      (emailInputValue?.isNotEmpty ?? false);
  bool get hasPasswordInput =>
      this.formValueMap.containsKey(PasswordInputValueKey) &&
      (passwordInputValue?.isNotEmpty ?? false);
  bool get hasConfirmPassInput =>
      this.formValueMap.containsKey(ConfirmPassInputValueKey) &&
      (confirmPassInputValue?.isNotEmpty ?? false);

  bool get hasFullNameInputValidationMessage =>
      this.fieldsValidationMessages[FullNameInputValueKey]?.isNotEmpty ?? false;
  bool get hasEmailInputValidationMessage =>
      this.fieldsValidationMessages[EmailInputValueKey]?.isNotEmpty ?? false;
  bool get hasPasswordInputValidationMessage =>
      this.fieldsValidationMessages[PasswordInputValueKey]?.isNotEmpty ?? false;
  bool get hasConfirmPassInputValidationMessage =>
      this.fieldsValidationMessages[ConfirmPassInputValueKey]?.isNotEmpty ??
      false;

  String? get fullNameInputValidationMessage =>
      this.fieldsValidationMessages[FullNameInputValueKey];
  String? get emailInputValidationMessage =>
      this.fieldsValidationMessages[EmailInputValueKey];
  String? get passwordInputValidationMessage =>
      this.fieldsValidationMessages[PasswordInputValueKey];
  String? get confirmPassInputValidationMessage =>
      this.fieldsValidationMessages[ConfirmPassInputValueKey];
}

extension Methods on FormStateHelper {
  setFullNameInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FullNameInputValueKey] = validationMessage;
  setEmailInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailInputValueKey] = validationMessage;
  setPasswordInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PasswordInputValueKey] = validationMessage;
  setConfirmPassInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ConfirmPassInputValueKey] =
          validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    fullNameInputValue = '';
    emailInputValue = '';
    passwordInputValue = '';
    confirmPassInputValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FullNameInputValueKey: getValidationMessage(FullNameInputValueKey),
      EmailInputValueKey: getValidationMessage(EmailInputValueKey),
      PasswordInputValueKey: getValidationMessage(PasswordInputValueKey),
      ConfirmPassInputValueKey: getValidationMessage(ConfirmPassInputValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _SignUpViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _SignUpViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      FullNameInputValueKey: getValidationMessage(FullNameInputValueKey),
      EmailInputValueKey: getValidationMessage(EmailInputValueKey),
      PasswordInputValueKey: getValidationMessage(PasswordInputValueKey),
      ConfirmPassInputValueKey: getValidationMessage(ConfirmPassInputValueKey),
    });
