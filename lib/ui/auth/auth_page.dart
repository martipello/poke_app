import 'package:built_collection/built_collection.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import '../../extensions/build_context_extension.dart';

const kAuthRoute = '/auth';
const kAuthDisplayName = 'Auth';

enum AuthenticationState { signedIn, signedOut }

class AuthPage extends StatefulWidget {
  const AuthPage({
    super.key,
    required this.providers,
    required this.appDisplayName,
  });

  final BuiltList<AuthProvider> providers;
  final String appDisplayName;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.appDisplayName,
        ),
      ),
      body: _buildSignInScreen(),
    );
  }

  Widget _buildSignInScreen() {
    return SignInScreen(
      headerBuilder: _buildHeader,
      providers: widget.providers.toList(),
      actions: [
        AuthStateChangeAction<AuthFailed>(
          (context, state) {
            // ErrorHandler.handleError(error: state.exception);
          },
        ),
      ],
    );
  }

  Widget _buildHeader(
    BuildContext context,
    BoxConstraints constraints,
    double _,
  ) {
    return ConstrainedBox(
      constraints: constraints,
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: CircleAvatar(
            backgroundColor: context.colors.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/store_image.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
