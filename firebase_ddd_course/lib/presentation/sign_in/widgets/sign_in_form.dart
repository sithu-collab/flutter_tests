import 'package:firebase_ddd_course/application/auth/sign_in_form_bloc.dart';
import 'package:firebase_ddd_course/domain/core/failures.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class  SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Form(
          autovalidate: state.showErrorMessages,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(75.0),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/sign_in.jpg'),
                            fit: BoxFit.cover),
                        color: Colors.red),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email), labelText: 'Email'),
                      autocorrect: false,
                      onChanged: (value) =>
                          context
                              .bloc<SignInFormBloc>()
                              .add(SignInFormEvent.emailAddressChanged(value)),
                      validator: (_) =>
                          context
                              .bloc<SignInFormBloc>()
                              .state
                              .emailAddress
                              .value
                              .fold(
                                  (f) =>
                                  f.maybeMap(
                                      invalidEmail: (_) => 'Invalid Email',
                                      orElse: () => null),
                                  (_) => null),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock), labelText: 'Password'),
                      obscureText: true,
                      autocorrect: false,
                      onChanged: (value) =>
                          context
                              .bloc<SignInFormBloc>()
                              .add(SignInFormEvent.passwordChanged(value)),
                      validator: (_) =>
                          context
                              .bloc<SignInFormBloc>()
                              .state
                              .password
                              .value
                              .fold(
                                  (f) =>
                                  f.maybeMap(
                                      shortPassword: (_) => 'Invalid Password',
                                      orElse: () => null),
                                  (_) => null),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        context.bloc<SignInFormBloc>().add(const SignInFormEvent
                            .signInWithEmailAndPasswordPressed());
                      },
                      child: const Text('SIGN IN'),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        context.bloc<SignInFormBloc>().add(const SignInFormEvent
                            .registerWithEmailAndPasswordPressed());
                      },
                      child: const Text('REGISTER'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 45.0,
                  child: RaisedButton(
                    onPressed: () {
                      context.bloc<SignInFormBloc>().add(
                          const SignInFormEvent.signInWithGooglePressed());
                    },
                    color: Colors.blueAccent,
                    child: const Text(
                      'SIGN IN WITH GOOGLE',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
