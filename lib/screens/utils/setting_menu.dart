// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:volume_control/volume_control.dart';

// void main() => runApp(const SettingMenu());

// class SettingMenu extends StatefulWidget {
//   const SettingMenu({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _SettingMenuState createState() => _SettingMenuState();
// }

// class _SettingMenuState extends State<SettingMenu> {
//   @override
//   void initState() {
//     super.initState();
//     initVolumeState();
//   }

//   //init volume_control plugin
//   Future<void> initVolumeState() async {
//     if (!mounted) return;

//     //read the current volume
//     _val = await VolumeControl.volume;
//     setState(() {});
//   }

//   double _val = 0.5;
//   late Timer timer;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text('Plugin example app'),
//           ),
//           body: Center(
//               child: Slider(
//                   value: _val,
//                   min: 0,
//                   max: 1,
//                   divisions: 100,
//                   onChanged: (val) {
//                     _val = val;
//                     setState(() {});
//                     timer.cancel();

//                     //use timer for the smoother sliding
//                     timer = Timer(const Duration(milliseconds: 200), () {
//                       VolumeControl.setVolume(val);
//                     });
//                   }))),
//     );
//   }
// }
