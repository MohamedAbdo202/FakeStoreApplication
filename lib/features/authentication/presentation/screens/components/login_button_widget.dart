import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_button.dart';
import 'package:pyramakerz/core/design_system/common/widgets/default_snack_bar.dart';
import 'package:pyramakerz/core/design_system/core/app_raduis.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';
import 'package:pyramakerz/core/routes/route_navigation.dart';
import 'package:pyramakerz/core/routes/router.dart';
import 'package:pyramakerz/features/authentication/domain/entities/login_request.dart';
import 'package:pyramakerz/features/authentication/presentation/cubit/login_cubit.dart';
import 'package:pyramakerz/features/authentication/presentation/cubit/login_states.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.userNameController,
    required this.passwordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController userNameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is LoginFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                defaultSnackBar(
                  message: state.errorMessage,
                  isSuccess: false,
                  context: context,
                ),
              );
            } else if (state is LoginSuccessState) {
              RouteNavigation.pushAndRemoveUntil(context, HomeRoute());
            }
          },
          builder: (context, state) {
            return DefaultButton(
              radius: AppRadius.extraLarge,
              text: context.localization.login,
              state: state is LoginLoadingState
                  ? ButtonState.loading
                  : ButtonState.normal,
              onPressed: () async {
                FocusScope.of(context).unfocus();

                if (_formKey.currentState?.validate() ?? false) {
                  await AuthCubit.get(context).signInWithUserNameAndPassword(
                    LoginRequestModel(
                      username: userNameController.text,
                      password: passwordController.text,
                    ),
                  );
                }
              },
            );
          },
        ),
      ],
    );
  }
}
