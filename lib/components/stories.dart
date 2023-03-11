import 'package:flutter/material.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  var storiesList = [
    Story(userName: 'markguddest', image: 'mark_avatar.png'),
    Story(userName: 'markguddest', image: 'mark_avatar.png'),
    Story(userName: 'markguddest', image: 'mark_avatar.png'),
    Story(userName: 'markguddest', image: 'mark_avatar.png'),
    Story(userName: 'markguddest', image: 'mark_avatar.png'),
    Story(userName: 'markguddest', image: 'mark_avatar.png'),
    Story(userName: 'markguddest', image: 'mark_avatar.png'),
    Story(userName: 'markguddest', image: 'mark_avatar.png'),
    '',
    '',
    '',
    '',
    '',
    '',
  ]; //fix this

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      margin: const EdgeInsets.only(top: 10.0),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: storiesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 68,
                height: 68,
                padding: const EdgeInsets.all(3),
                margin: const EdgeInsets.only(left: 5, right: 5, bottom: 4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color(0xFFfeda75),
                    Color(0xFFfa7e1e),
                    Color(0xFFd62976),
                    Color(0xFF962fbf),
                    Color(0xFF4f5bd5),
                  ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 34,
                  child: CircleAvatar(
                    radius: 29,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        AssetImage('assets/imgs/photo_2022-12-19_01-11-27.png'),
                  ),
                ),
              ),
              Text('Olegggggg'.length > 8
                  ? 'Olegggggg'.replaceRange(7, 'Olegggggg'.length, '...')
                  : 'Olegggggg')
            ],
          );
        },
      ),
    );
  }
}

// class Stories extends StatelessWidget {
//   static var storiesList = [
//     Story(userName: 'markguddest', image: 'mark_avatar.png')
//   ];
//   const Stories({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 88,
//       margin: const EdgeInsets.only(top: 10.0),
//       width: MediaQuery.of(context).size.width,
//       child: ListView.builder(
//         itemCount: storiesList.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               Container(
//                 width: 68,
//                 height: 68,
//                 padding: const EdgeInsets.all(3),
//                 margin: const EdgeInsets.only(left: 5, right: 5, bottom: 4),
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: LinearGradient(colors: [
//                     Color(0xFFfeda75),
//                     Color(0xFFfa7e1e),
//                     Color(0xFFd62976),
//                     Color(0xFF962fbf),
//                     Color(0xFF4f5bd5),
//                   ], begin: Alignment.bottomLeft, end: Alignment.topRight),
//                 ),
//                 child: const CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 34,
//                   child: CircleAvatar(
//                     radius: 29,
//                     backgroundColor: Colors.transparent,
//                     backgroundImage:
//                         AssetImage('assets/imgs/photo_2022-12-19_01-11-27.png'),
//                   ),
//                 ),
//               ),
//               Text(storiesList[index].userName ?? "")
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

class Story {
  final String _userName = '', _image = '';

  Story({required String userName, required String image});

  String get userName => _userName;
  String get image => _image;
}
