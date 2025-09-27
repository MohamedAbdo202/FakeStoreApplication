import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_app_bar.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_padding.dart';
import 'package:pyramakerz/core/design_system/core/app_spacing.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';
import 'package:pyramakerz/features/authentication/presentation/screens/components/forget_password_widget.dart';
import 'package:pyramakerz/features/authentication/presentation/screens/components/login_button_widget.dart';
import 'package:pyramakerz/features/authentication/presentation/screens/components/login_footer_widget.dart';
import 'package:pyramakerz/features/authentication/presentation/screens/components/login_form_fields_widget.dart';
import 'package:pyramakerz/features/authentication/presentation/screens/components/login_header_widget.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: SingleChildScrollView(
        child: DefaultPadding(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.large,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHeader(),
                (AppSpacing.extraLarge * 2).verticalSizedBox,
                LoginFormFields(
                  userName: userNameController,
                  passwordController: passwordController,
                ),

                AppSpacing.large.verticalSizedBox,
                ForgetPasswordWidget(),
                (AppSpacing.xxxLarge).verticalSizedBox,

                LoginButton(
                  formKey: _formKey,
                  userNameController: userNameController,
                  passwordController: passwordController,
                ),

                (AppSpacing.extraLarge * 3).verticalSizedBox,
                LoginFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
