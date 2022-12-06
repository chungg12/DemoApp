import 'package:clean_architecture_tdd_course/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<LoginBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {},
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                TextField(
                  controller: idController,
                ),
                // Top half

                SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                ),
                // Bottom half
                ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginSubmited(123, "abc"));
                    },
                    child: Text("Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
