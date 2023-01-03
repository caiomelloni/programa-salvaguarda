import 'dart:async';

import 'package:flutter/material.dart';

import 'package:programa_salvaguarda/services/auth/models/user.dart';
import 'package:programa_salvaguarda/services/auth/service/auth_service.dart';

class AuthListenableWidget extends StatefulWidget {
  final void Function(SalvaGuardasUser?)? onAuthStateChange;
  final Widget Function(
      BuildContext context, SalvaGuardasUser? user, Widget? child) builder;
  final Widget? child;
  const AuthListenableWidget({
    Key? key,
    this.onAuthStateChange,
    required this.builder,
    this.child,
  }) : super(key: key);

  @override
  State<AuthListenableWidget> createState() => _AuthListenableWidgetState();
}

class _AuthListenableWidgetState extends State<AuthListenableWidget> {
  StreamSubscription<SalvaGuardasUser?>? _userStream;

  @override
  void initState() {
    super.initState();
    if (mounted && widget.onAuthStateChange != null) {
      _userStream = AuthService.service.onAuthStateChange().listen((user) {
        widget.onAuthStateChange!(user);
      });
    }
  }

  @override
  void dispose() {
    _userStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AuthService.instance,
      builder: widget.builder,
      child: widget.child,
    );
  }
}
