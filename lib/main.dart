import 'package:better_map/player.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setLandscape();
  await Flame.device.fullScreen();
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
        cameraConfig: CameraConfig(
          moveOnlyMapArea: true,
        ),
        joystick: Joystick(
          keyboardConfig: KeyboardConfig(),
        ),
        map: TiledWorldMap('tiled/map.json'),
        player: Dummy(Vector2(500, 200)));
  }
}
