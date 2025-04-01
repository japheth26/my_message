import 'package:flutter/material.dart';
import 'package:my_message/app/app.router.dart';
import 'package:my_message/ui/common/ui_helpers.dart';
import 'package:my_message/ui/views/login/login_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../core/state_status.dart';
import '../../common/widgets/brand_widget.dart';
import '../../common/widgets/submit_button_widget.dart';
import '../../common/widgets/text_field_widget.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'emailInput'),
  FormTextField(name: 'passwordInput')
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: viewModel.loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                alignment: Alignment.bottomCenter,
                child: const BrandWidget(),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
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
                    verticalSpaceMedium,
                    SubmitButtonWidget(
                      loading: viewModel.stateStatus == StateStatus.loading,
                      label: 'Sign In',
                      onPressed: viewModel.submit,
                    ),
                    verticalSpaceMedium,
                    TextButton(
                        onPressed: () {}, child: const Text('Forgot Password')),
                    verticalSpaceMedium,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account? '),
                        TextButton(
                            onPressed: () {
                              viewModel.navigationService
                                  .navigateToSignUpView();
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.purple[800]!,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
