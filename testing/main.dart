import 'package:flutter/material.dart';
import 'package:testing_app/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Counter counter = Counter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Project to learn testing in Flutter'),
        ),
        body: Center(
          child: Text('${counter.currentValue}'),
        ),
        floatingActionButton: Row(
          children: [
            FloatingActionButton(
              onPressed: () => setState(() => counter.increment()),
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () => setState(() => counter.decrement()),
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

// //   final List<TreeNode> nodes = [
// //     TreeNode(id: '1', name: '1'),
// //     TreeNode(id: '2', name: '2'),
// //     TreeNode(id: '3', name: '3'),
// //     TreeNode(id: '4', name: '4'),
// //     TreeNode(id: '5', name: '5'),
// //     TreeNode(id: '7', name: '7', parentId: '1'),
// //     TreeNode(id: '8', name: '8', parentId: '1'),
// //     TreeNode(id: '9', name: '9', parentId: '2'),
// //     TreeNode(id: '10', name: '10', parentId: '2'),
// //     TreeNode(id: '11', name: '11', parentId: '3'),
// //     TreeNode(id: '12', name: '12', parentId: '3'),
// //     TreeNode(id: '13', name: '13', parentId: '4'),
// //     TreeNode(id: '14', name: '14', parentId: '4'),
// //     TreeNode(id: '15', name: '15', parentId: '5'),
// //     TreeNode(id: '16', name: '16', parentId: '5'),
// //     TreeNode(id: '17', name: '17', parentId: '7'),
// //   ];
// //   List<dynamic> createTree(List<Map<String, dynamic>> list) {
// //     var map = {}, node, roots = [], i;

// //     for (i = 0; i < list.length; i += 1) {
// //       map[list[i]['id']] = i; // initialize the map
// //       list[i]['children'] = []; // initialize the children
// //     }

// //     for (i = 0; i < list.length; i += 1) {
// //       node = list[i];
// //       if (node['parentId']) {
// //         // if you have dangling branches check that map[node.parentId] exists
// //         list[map[node['parentId']]]['children'].add(node);
// //       } else {
// //         roots.add(node);
// //       }
// //     }
// //     return roots;
// //   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: ElevatedButton(
//               onPressed: () => null,
//               child: const Text('Get Tree')),
//         ),
//       ),
//     );
//   }
// }

// class TreeNode {
//   final String name;
//   final String id;
//   final String parentId;
//   TreeNode({
//     required this.name,
//     this.parentId = '',
//     required this.id,
//   });

//   List<dynamic> getTree(List<TreeNode> allNotes) {
//     final List<dynamic> tree = [];
//     for (final note in allNotes) {
//       if (note.parentId == '') {
//         tree.add(note.getNode(allNotes));
//       }
//     }
//     return tree;
//   }

//   Map<String, dynamic> getNode(List<TreeNode> allNotes) {
//     final Map<String, dynamic> node = {};
//     node['name'] = name;
//     node['id'] = id;
//     node['children'] = [];
//     for (final note in allNotes) {
//       if (note.parentId == id) {
//         node['children'].add(note.getNode(allNotes));
//       }
//     }
//     return node;
//   }
// }
