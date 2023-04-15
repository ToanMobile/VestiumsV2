import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

Handler notHandler = Handler(
  handlerFunc: (context, Map<String, List<String>> params) => Scaffold(
    body: Center(
      child: Text('$params'),
    ),
  ),
);

Handler splashHandler = Handler(
  handlerFunc: (context, Map<String, List<String>> params) => SplashPage(),
);

///Auth
Handler signInHandler = Handler(handlerFunc: (context, Map<String, List<String>> params) {
  return SignInPage();
});
Handler signUpHandler = Handler(handlerFunc: (context, Map<String, List<String>> params) {
  return SignUpPage();
});
Handler forgotPasswordHandler = Handler(handlerFunc: (context, Map<String, List<String>> params) {
  return ForgotPasswordPage();
});

///Home
Handler mainHandler = Handler(handlerFunc: (context, Map<String, List<String>> params) {
  return MainPage();
});
