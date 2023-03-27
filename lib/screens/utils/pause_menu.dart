// /* 
// ====================================================================================================================
// didn't finished
// ====================================================================================================================
// */

// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:vocab_eng_app/games/mygame.dart';
// import 'package:vocab_eng_app/model/player_data.dart';

// import 'hud.dart';
// import 'main_menu.dart';



// class PauseMenu extends StatelessWidget {
//   // An unique identified for this overlay.
//   static const id = 'PauseMenu';

//   // Reference to parent game.
//   final MyGame gameRef;

//   const PauseMenu(this.gameRef, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider.value(
//       value: gameRef.playerData,
//       child: Center(
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//           child: Card(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//             color: Colors.black.withAlpha(100),
//             child: FittedBox(
//               fit: BoxFit.scaleDown,
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 40, horizontal: 100),
//                 child: Wrap(
//                   direction: Axis.vertical,
//                   crossAxisAlignment: WrapCrossAlignment.center,
//                   spacing: 10,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Selector<PlayerData, int>(
//                         selector: (_, playerData) => playerData.currentScore,
//                         builder: (_, score, __) {
//                           return Text(
//                             'Score: $score',
//                             style: const TextStyle(
//                                 fontSize: 40, color: Colors.white),
//                           );
//                         },
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         gameRef.overlays.remove(PauseMenu.id);
//                         gameRef.overlays.add(Hud.id);
//                         gameRef.resumeEngine();
//                       },
//                       child: const Text(
//                         'Resume',
//                         style: TextStyle(
//                           fontSize: 25,
//                         ),
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         gameRef.overlays.remove(PauseMenu.id);
//                         gameRef.overlays.add(MainMenu.id);
//                         gameRef.resumeEngine();
//                         //gameRef.reset();
//                       },
//                       child: const Text(
//                         'Exit',
//                         style: TextStyle(
//                           fontSize: 25,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }