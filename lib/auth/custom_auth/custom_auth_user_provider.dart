import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class ProyectoMovilesG3AuthUser {
  ProyectoMovilesG3AuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<ProyectoMovilesG3AuthUser> proyectoMovilesG3AuthUserSubject =
    BehaviorSubject.seeded(ProyectoMovilesG3AuthUser(loggedIn: false));
Stream<ProyectoMovilesG3AuthUser> proyectoMovilesG3AuthUserStream() =>
    proyectoMovilesG3AuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
