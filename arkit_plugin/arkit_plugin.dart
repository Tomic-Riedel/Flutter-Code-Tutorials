/// ------------------------------------------------------------
/// ----------Flutter ARKit - the Complete Crash Course---------
/// --------https://medium.com/@tomicriedel/4007f8b7f945--------
/// ------------------------------------------------------------

/// Snap 1 - Info.plit
/// Can be found in Info.plist file

/// Snap 2 - Podfile
/// Can be found in Podfile file

/// Snap 3- Use Create ARKit Controller

// Create a stateful widget
class ARKitExapmle extends StatefulWidget {
  ARKitExapmle({Key? key}) : super(key: key);

  @override
  State<ARKitExapmle> createState() => _ARKitExapmleState();
}

class _ARKitExapmleState extends State<ARKitExapmle> {
  // We won't initialize arkitController in initState
  late ARKitController arkitController;

  // But we have to dispose the controller
  // This is very important
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

/// Snap 4 - Add ARKitSceneView and initalize controller
Widget build(BuildContext context) {
  return Scaffold(
    body: ARKitSceneView(
      onARKitViewCreated: onARKitViewCreated,
    ),
  );
}

void onARKitViewCreated(ARKitController arkitController) {
  this.arkitController = arkitController;
}

/// Snap 5 - Add object to controller
Widget build(BuildContext context) {
  return Scaffold(
    body: ARKitSceneView(
      onARKitViewCreated: onARKitViewCreated,
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: addARKitNode,
      child: Icon(Icons.add),
    ),
  );
}

void addARKitNode(ARKitController arkitController) {
  this.arkitController = arkitController;

  // We call one object a "node"
  final node = ARKitNode(
    //Specify the geometry of the node
    geometry: ARKitSphere(radius: 0.1),
    //Specify the position of th enode
    position: Vector3(0, 0, -0.5),
  );

  // Add the node to the ARKitController
  this.arKitController.add(node);
}

/// Snap 6 - Can be found in Podfile file