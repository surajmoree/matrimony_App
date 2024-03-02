import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:strava_clone/src/network/models/user_model.dart';
import 'package:strava_clone/src/network/repositories/authentication_repo.dart';
import 'package:strava_clone/src/network/repositories/user_repo.dart';

import 'package:formz/formz.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  
  UserRepo userRepo = UserRepo();

  SignInCubit(this._authenticationRepository) : super(LoginInitial());
  final AuthenticationRepository _authenticationRepository;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        email: state.email,
        password: password,
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> logInWithCredentials() async {
    if (state.status.isInvalid) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
          email: state.email.value, password: state.password.value);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
            errorMessage: e.message, status: FormzStatus.submissionFailure),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.logInWithGoogle();
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on LogInWithGoogleFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzStatus.submissionFailure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
