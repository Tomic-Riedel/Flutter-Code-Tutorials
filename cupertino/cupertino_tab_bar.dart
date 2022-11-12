/// ------------------------------------------------------------
/// ----------CupertinoTabBar -  All cupertino widgets-----------
/// --------https://medium.com/@tomicriedel/844fdeb06aa8--------
/// ------------------------------------------------------------

/// Snap 1 - CupertinoTabBar Example
class CupertinoTabBarExample extends StatefulWidget {
  const CupertinoTabBarExample({super.key});

  @override
  State<CupertinoTabBarExample> createState() => _CupertinoTabBarExampleState();
}

class _CupertinoTabBarExampleState extends State<CupertinoTabBarExample> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertionTabScaffold(
        tabBar: CupertinoTabBar(
          // Specify the items in your app
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search_circle),
              label: 'Explore',
            ),
          ],
          //Our color options
          activeColor: CupertinoColors.activeOrange,
          inactiveColor: CupertinoColors.systemGrey,
          backgroundColor: CupertinoColors.secondarySystemBackground,

          // Challenge for you:
          //
          // Specify a border, the iconSize and height, as well as
          // the onTap callback. 
        ),
        tabBuilder: (BuildContext, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return CupertinoPageScaffold(
                child: Center(
                  child: Text('We are on page $index'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
