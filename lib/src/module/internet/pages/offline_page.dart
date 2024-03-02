import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cubit/internet_cubit.dart';

class OfflinePage extends StatelessWidget {
  const OfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internet connection is Disconnected'),
      ),
      body: BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state.runtimeType == InternetConnected) {
            Navigator.pushNamed(context, '/');
          }
        },
        buildWhen: (previous, current) => true,
        builder: (context, state) {
          if (state.runtimeType == InternetLoading) {
            return const CircularProgressIndicator();
          } else {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('Please check internet connection')
                ]);
          }
        },
      ),
    );
  }
}
