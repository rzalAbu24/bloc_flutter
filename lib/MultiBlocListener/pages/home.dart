import 'package:bloc_flutter/MultiBlocListener/bloc/counter.dart';
import 'package:bloc_flutter/MultiBlocListener/bloc/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBloc myCounter = context.read<CounterBloc>();
    ThemeBloc myTheme = context.read<ThemeBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Bloc Listener'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MultiBlocListener(
              listeners: [
                BlocListener<CounterBloc, int>(
                  listener: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Diatas 10"),
                      duration: Duration(seconds: 1),
                    ));
                  },
                  listenWhen: (previous, current) {
                    if (current > 10) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                ),
                BlocListener<ThemeBloc, bool>(
                  listener: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Tema Gelap"),
                      duration: Duration(seconds: 1),
                    ));
                  },
                  listenWhen: (previous, current) {
                    if (current == false) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                ),
              ],
              child: BlocBuilder<CounterBloc, int>(
                bloc: myCounter,
                builder: (context, state) {
                  return Text(
                    "$state",
                    style: TextStyle(fontSize: 50),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    myCounter.remove();
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    myCounter.add();
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        myTheme.changeTheme();
      }),
    );
  }
}
