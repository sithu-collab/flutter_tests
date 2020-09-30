part of 'sign_in_form_bloc.dart';
@freezed
abstract class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailAddressChanged(String emailStr) = EmailaddressChanged;
  const factory SignInFormEvent.passwordChanged(String passStr) = PasswordChanged;
  const factory SignInFormEvent.registerWithEmailAndPasswordPressed() = RegisterWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithEmailAndPasswordPressed() = SignInWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithGooglePressed() = SignInWithGooglePressed;

}
