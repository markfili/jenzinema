import 'package:flutter/material.dart';

import '../../common/helpers/insets.dart';
import '../../common/helpers/j_colors.dart';
import '../movies/favorites_screen.dart';
import '../movies/movies_screen.dart';
import 'widgets/nav_bar_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final List<Widget> screens = [
    const MoviesScreen(),
    const FavoritesScreen(),
  ];
  final List<Tab> barItems = [
    const Tab(
      iconMargin: EdgeInsets.zero,
      child: NavBarItem(icon: Icons.movie_outlined, title: "Movies"),
    ),
    const Tab(
      iconMargin: EdgeInsets.zero,
      child: NavBarItem(icon: Icons.bookmark_border, title: "Favorites"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: barItems.length,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "assets/icons/icon_app_bar_logo.png",
            height: 30,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: screens,
              ),
            ),
            ColoredBox(
              color: JColors.bottomBarBackground,
              child: TabBar(
                indicator: buildBoxDecoration(),
                tabs: barItems,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: JColors.accent,
                labelColor: JColors.accent,
                unselectedLabelColor: Colors.white,
                labelPadding: const EdgeInsets.all(Insets.medium + Insets.xsmall),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      border: Border(
        top: BorderSide(
          width: 3.0,
          color: JColors.accent,
        ),
      ),
    );
  }
}
