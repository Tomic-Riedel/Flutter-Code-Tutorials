/// ------------------------------------------------------------
/// ---------CupertinoTabScaffold - All cupertino widgets---------
/// --------https://medium.com/@tomicriedel/d9908f167178--------
/// ------------------------------------------------------------

/// Snap 1 - Example of CupertinoTabScaffold
class CupertinoTabScaffold extends StatefulWidget {
  const CupertinoTabScaffold({super.key});

  @override
  State<CupertinoTabScaffold> createState() => _CupertinoTabScaffoldState();
}

class _CupertinoTabScaffoldState extends State<CupertinoTabScaffold> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertionTabScaffold(
        tabBar: CupertinoTabBar(
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
        ),
        tabBuilder: (BuildContext, int index) {
          // You can do an if-else statement,
          // to show different pages, we will just
          // use the index to display different
          // text
          return CupertinoTabView(
            builder: (BuildContext context) {
              return CupertinoPageScaffold(
                child: Center(
                  // Challenge for you:
                  //
                  // Try to wrap this in a Button that pushes to another page. 
                  // You will see, that you still can navigate around the tabs
                  // without loosing your navigation stack on specific tabs.
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
