import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_ddd_course/domain/auth/auth_failures.dart';
import 'package:firebase_ddd_course/domain/auth/i_auth_facade.dart';
import 'package:firebase_ddd_course/domain/auth/value_objects.dart';
import 'package:firebase_ddd_course/domain/core/value_validators.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';
@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial());

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    yield* event.map(
        emailAddressChanged: (e) async* {
          yield state.copyWith(
            emailAddress: EmailAddress(e.emailStr),
            authFailureOrSuccess: none(),
          );
        },

        passwordChanged: (e) async* {
          yield state.copyWith(
            password: Password(e.passStr),
            authFailureOrSuccess: none()
          );
        },

        registerWithEmailAndPasswordPressed: (e) async* {
          yield* _performActionOnAuthFacadeWithEmailAndPassword(
            _authFacade.registerWithEmailAndPassword,
          );
        },

        signInWithEmailAndPasswordPressed: (e) async* {
          yield* _performActionOnAuthFacadeWithEmailAndPassword(
            _authFacade.signInWithEmailAndPassword,
          );
        },

        signInWithGooglePressed: (e) async* {
          yield state.copyWith(
              isSubmitting: true,
              authFailureOrSuccess: none());

          final failureOrSuccess = await _authFacade.signInWithGoogle();
          yield state.copyWith(
            isSubmitting: false,
            authFailureOrSuccess: some(failureOrSuccess),
          );
        });
  }

  Stream<SignInFormState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      @required EmailAddress emailAddress,
      @required Password password,
    })
      forwardedCall,
  ) async* {
    Either<AuthFailure, Unit> failureOrSuccess;
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccess: none(),
      );

      failureOrSuccess = await forwardedCall(
          emailAddress: state.emailAddress,
          password: state.password,
      );
    }
    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccess: optionOf(failureOrSuccess),
    );
  }
}
