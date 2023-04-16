import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/ui/login/login_screen_controller.dart';
import 'package:sportify/src/ui/signup/signup_screen.dart';
import 'package:sportify/src/utils/routes.dart';
import 'package:sportify/src/utils/sizes_and_orientation.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(loginScreenControllerProvider);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0.ch, horizontal: 5.0.cw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to Sportify",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w600)),
              Text("Your favourite sports app!",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey)),
              SizedBox(
                height: 5.0.ch,
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(label: Text("Email")),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(label: Text("Password")),
              ),
              SizedBox(
                height: 5.0.ch,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45)),
                  onPressed: () {
                    ref
                        .read(loginScreenControllerProvider.notifier)
                        .signInWithEmailAndPassword(
                            emailController.text, passwordController.text);
                  },
                  child: const Text('Login')),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()));
                  },
                  child: const Text("Don't have an account? Signup"))
            ],
          ),
        ),
      ),
    );
  }
}
