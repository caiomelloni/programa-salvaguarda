import 'dart:async';

import 'package:flutter/material.dart';

import 'package:programa_salvaguarda/services/auth/models/user.dart';
import 'package:programa_salvaguarda/services/auth/service/auth_service.dart';

class AuthListenableWidget extends StatefulWidget {
  final Widget Function(
      BuildContext context, SalvaGuardasUser? user) builder;
  const AuthListenableWidget({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  State<AuthListenableWidget> createState() => _AuthListenableWidgetState();
}

class _AuthListenableWidgetState extends State<AuthListenableWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SalvaGuardasUser?>(
      initialData: AuthService.instance.currentUser,
      stream: AuthService.instance.userStream,
      builder: (context, snapshot) => widget.builder(context, snapshot.data),
    );
  }
}
