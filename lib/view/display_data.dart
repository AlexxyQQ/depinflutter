// import 'package:flutter/material.dart';

// class DisplayData extends StatefulWidget {
//   const DisplayData({super.key});

//   @override
//   State<DisplayData> createState() => _DisplayDataState();
// }

// class _DisplayDataState extends State<DisplayData> {
//   // var userList = getIt<UserRepository>().getUsers();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Display Data"),
//       ),
//       body: ListView.builder(
//         itemCount: userList.length,
//         itemBuilder: (context, index) {
//           return Card(
//             child: ListTile(
//               leading: CircleAvatar(
//                 child: Text(
//                   userList[index]
//                       .name
//                       .split(' ')
//                       .last
//                       .split('')
//                       .first
//                       .toString(),
//                 ),
//               ),
//               title: Text(userList[index].name),
//               subtitle: Text(userList[index].dob),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
