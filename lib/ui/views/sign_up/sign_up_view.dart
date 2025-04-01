import 'package:flutter/material.dart';
import 'package:my_message/core/state_status.dart';
import 'package:my_message/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../common/widgets/brand_widget.dart';
import '../../common/widgets/submit_button_widget.dart';
import '../../common/widgets/text_field_widget.dart';
import 'sign_up_viewmodel.dart';
import 'sign_up_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'fullNameInput'),
  FormTextField(name: 'emailInput'),
  FormTextField(name: 'passwordInput'),
  FormTextField(name: 'confirmPassInput'),
])
class SignUpView extends StackedView<SignUpViewModel> with $SignUpView {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignUpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
            onPressed: viewModel.navigationService.back,
            icon: Icon(
              Icons.chevron_left,
              color: Colors.purple[800],
              size: 40,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80,
              alignment: Alignment.bottomCenter,
              child: const BrandWidget(),
            ),
            Container(
              height: 100,
              alignment: Alignment.center,
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: viewModel.signUpFormKey,
                child: Column(
                  children: [
                    TextFieldWidget(
                      enabled: viewModel.stateStatus != StateStatus.loading,
                      labelText: 'Full Name',
                      controller: fullNameInputController,
                      validator: viewModel.validateFullName,
                    ),
                    verticalSpaceSmall,
                    TextFieldWidget(
                      enabled: viewModel.stateStatus != StateStatus.loading,
                      labelText: 'Email',
                      controller: emailInputController,
                      validator: viewModel.validateEmail,
                    ),
                    verticalSpaceSmall,
                    TextFieldWidget(
                      enabled: viewModel.stateStatus != StateStatus.loading,
                      labelText: 'Password',
                      obscureText: true,
                      controller: passwordInputController,
                      validator: viewModel.validatePassword,
                    ),
                    verticalSpaceSmall,
                    TextFieldWidget(
                      enabled: viewModel.stateStatus != StateStatus.loading,
                      labelText: 'Confirm Password',
                      obscureText: true,
                      controller: confirmPassInputController,
                      validator: viewModel.validateConfirmPass,
                    ),
                    verticalSpaceMedium,
                    SubmitButtonWidget(
                      loading: viewModel.stateStatus == StateStatus.loading,
                      label: 'Sign Up',
                      onPressed: viewModel.signUp,
                    ),
                    verticalSpaceLarge
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignUpViewModel();

  @override
  void onViewModelReady(viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(SignUpViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
