// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String SearchInputValueKey = 'searchInput';

final Map<String, TextEditingController> _PeopleViewTextEditingControllers = {};

final Map<String, FocusNode> _PeopleViewFocusNodes = {};

final Map<String, String? Function(String?)?> _PeopleViewTextValidations = {
  SearchInputValueKey: null,
};

mixin $PeopleView {
  TextEditingController get searchInputController =>
      _getFormTextEditingController(SearchInputValueKey);

  FocusNode get searchInputFocusNode => _getFormFocusNode(SearchInputValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_PeopleViewTextEditingControllers.containsKey(key)) {
      return _PeopleViewTextEditingControllers[key]!;
    }

    _PeopleViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _PeopleViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_PeopleViewFocusNodes.containsKey(key)) {
      return _PeopleViewFocusNodes[key]!;
    }
    _PeopleViewFocusNodes[key] = FocusNode();
    return _PeopleViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    searchInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    searchInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          SearchInputValueKey: searchInputController.text,
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

    for (var controller in _PeopleViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _PeopleViewFocusNodes.values) {
      focusNode.dispose();
    }

    _PeopleViewTextEditingControllers.clear();
    _PeopleViewFocusNodes.clear();
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

  String? get searchInputValue =>
      this.formValueMap[SearchInputValueKey] as String?;

  set searchInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({SearchInputValueKey: value}),
    );

    if (_PeopleViewTextEditingControllers.containsKey(SearchInputValueKey)) {
      _PeopleViewTextEditingControllers[SearchInputValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasSearchInput =>
      this.formValueMap.containsKey(SearchInputValueKey) &&
      (searchInputValue?.isNotEmpty ?? false);

  bool get hasSearchInputValidationMessage =>
      this.fieldsValidationMessages[SearchInputValueKey]?.isNotEmpty ?? false;

  String? get searchInputValidationMessage =>
      this.fieldsValidationMessages[SearchInputValueKey];
}

extension Methods on FormStateHelper {
  setSearchInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SearchInputValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    searchInputValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      SearchInputValueKey: getValidationMessage(SearchInputValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _PeopleViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _PeopleViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      SearchInputValueKey: getValidationMessage(SearchInputValueKey),
    });
