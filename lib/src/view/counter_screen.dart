import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Freezed Test"),
          ),
          body: Column(
            children: [
              Builder(builder: (context) {
                log("test");
                return TextButton(
                  onPressed: () {
                    context
                        .read<CounterBloc>()
                        .add(const CounterEvent.increment(text: "add value"));
                  },
                  child: const Text("Increment"),
                );
              }),
              Builder(builder: (context) {
                return TextButton(
                  onPressed: () {
                    context
                        .read<CounterBloc>()
                        .add(const CounterEvent.testError());
                  },
                  child: const Text("TestError"),
                );
              }),
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  switch (state.status) {
                    case CounterStatus.initial:
                      return const Center(
                        child: Text("Initial"),
                      );
                    case CounterStatus.success:
                    case CounterStatus.error:
                      return Center(
                        child: Text("Success: ${state.count}"),
                      );
                  }
                },
              ),
            ],
          )),
    );
  }
}
