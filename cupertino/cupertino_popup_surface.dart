/// ------------------------------------------------------------
/// -------CupertinoPopupSurface - All Cupertino Widgets--------
/// --------https://medium.com/@tomicriedel/dc00dfdf856d--------
/// ------------------------------------------------------------

/// Snap 1 - CupertinoPopupSurface Example
class CupertinoPopupSurfaceExample extends StatelessWidget {
  const CupertinoPopupSurfaceExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Some other widgets like CupertionPageScaffold etc.
    return CupertinoButton(
      onPressed: () => showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CupertinoPopupSurface(
            isSurfacePainted: true,

            // Put in here whatever widget you want
            child: Container(),
          );
        },
      ),
      child: Text('Show popup surface'),
    );
  }
}
