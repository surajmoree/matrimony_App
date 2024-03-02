import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:strava_clone/src/boot.dart';
import 'package:strava_clone/src/module/components/menu/bloc/menu_bloc.dart';

List<String> bottomNavRoutes = ["/", "/timer", "/second", "/settings","/car", "/wedding"];

class BottomMenu extends StatelessWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuBloc menuBloc = BlocProvider.of<MenuBloc>(context);
    final state = context.watch<MenuBloc>().state;
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.blueAccent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
          backgroundColor: Colors.blueAccent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
          backgroundColor: Colors.blueAccent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          backgroundColor: Colors.blueAccent,
        ),
            BottomNavigationBarItem(
          icon: Icon(Icons.car_crash),
          label: 'add',
          backgroundColor: Colors.blueAccent,
        ),

        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.ring,color: Colors.pink,),
       label: 'weddi',
        backgroundColor: Colors.blueAccent,
        )
      
      ],
      currentIndex: state.bottomMenuSelectedIndex,
      selectedItemColor: Colors.black,
      onTap: (value) {
        if (state.bottomMenuSelectedIndex != value) {
          menuBloc.add(MenuSelected(
              bottomMenuSelectedIndex: value,
              leftMenuSelectedIndex: state.leftMenuSelectedIndex));
          Navigator.pushNamed(context, bottomNavRoutes[value]);
        }
      },
    );
  }
}
