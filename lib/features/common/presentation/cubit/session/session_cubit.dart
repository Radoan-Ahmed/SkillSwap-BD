import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'session_cubit.freezed.dart';
part 'session_state.dart';

@lazySingleton
class SessionCubit extends Cubit<SessionState> {
  SessionCubit(this._supabase) : super(const SessionState.initial()) {
    _init();
  }

  final SupabaseClient _supabase;
  StreamSubscription<AuthState>? _authSubscription;

  void _init() {
    final currentSession = _supabase.auth.currentSession;
    if (currentSession != null) {
      emit(SessionState.authenticated(userId: currentSession.user.id));
    } else {
      emit(const SessionState.unauthenticated());
    }

    _authSubscription = _supabase.auth.onAuthStateChange.listen((data) {
      final session = data.session;
      if (session != null) {
        emit(SessionState.authenticated(userId: session.user.id));
      } else {
        emit(const SessionState.unauthenticated());
      }
    });
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
