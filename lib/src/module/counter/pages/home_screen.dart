import 'package:strava_clone/src/module/app/app_layout/main_layout.dart';
import 'package:strava_clone/src/module/app/bloc/app_bloc.dart';
// import 'package:strava_clone/src/module/components/profile_image/profile_image_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../module.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, this.color});
  final String title;
  final Color? color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String flowerImage =
      'https://images.unsplash.com/photo-1515041219749-89347f83291a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FydG9vbnxlbnwwfHwwfHw%3D&w=1000&q=80';
  // String flowerImage = '';
  String StaticImagePath =
      "https://images.pexels.com/photos/60597/dahlia-red-blossom-bloom-60597.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

  //TO DO: Pass it from local referncd area Or Main Action component of the App
  List<Widget> getAction(BuildContext context) {
    return [
      Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.search,
              size: 26.0,
            ),
          )),
      Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: const Icon(Icons.more_vert),
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MainLayout(
        drawer: const AppMenu(),
        bootomNavigationBar: const BottomMenu(),
        actions: getAction(context),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BlocConsumer<CounterCubit, CounterState>(
                      listener: (context, state) {
                        if (state.wasIncremented == true) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Incremented!'),
                            duration: Duration(milliseconds: 300),
                          ));
                        }
                        if (state.wasIncremented == false) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Decremented!'),
                            duration: Duration(milliseconds: 300),
                          ));
                        }
                      },
                      builder: (context, state) {
                        if (state.counterValue < 0) {
                          return Text(
                            '${state.counterValue}  : -VE Value',
                            style: Theme.of(context).textTheme.headline4,
                          );
                        } else {
                          return Text(
                            '${state.counterValue} : +VE Value',
                            style: Theme.of(context).textTheme.headline4,
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          heroTag: "Decrement",
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).decrement();
                          },
                          tooltip: 'Decrement',
                          child: const Icon(Icons.remove),
                        ),
                        FloatingActionButton(
                          heroTag: "increment",
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).increment();
                          },
                          tooltip: 'Increment',
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    MaterialButton(
                      color: widget.color,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/second');
                      },
                      child: const Text('Go To Second Page'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      color: widget.color,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/third');
                      },
                      child: const Text('Go To Third Page'),
                    ),
                    MaterialButton(
                      color: widget.color,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/timer');
                      },
                      child: const Text('Timer'),
                    ),
                    const SizedBox(height: 20),
                    // UserProfileImage(imagePath: StaticImagePath),
                    const SizedBox(height: 20),
                    // UserProfileImage(imagePath: flowerImage),
                    const SizedBox(height: 20),
                    MaterialButton(
                      color: widget.color,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/settings');
                      },
                      child: const Text('Settings'),
                    ),
                    
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ]),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
