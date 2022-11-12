/// ------------------------------------------------------------
/// ----------Fluter Flame - The Complete Crash Course----------
/// --------https://medium.com/@tomicriedel/cf4fe226a3f3--------
/// ------------------------------------------------------------

/// Snap 1 - Create game Widget

// First we have to import flame
import 'dart:html';

import 'package:flame/flame.dart';

void main() {
  // Create game variable -> MyGame does not exist yet
  final game = MyGame();

  // Run app with the GameWidget
  runApp(
    GameWidget(
      // Pass our flame game to the widget
      game: game,
    ),
  );
}

/// Snap 2 - Create game class
import'dart:ui';
import 'package:flame/game.dart';

// Folowing imports does not exist yet
import 'player.dart';
import 'background.dart';
 
// This class has to extend FlameGame,
// to register it as a game
class MyGame extends FlameGame{

    // Both do not exist yet
    Player _player = Player();
    Background _background = Background();

    // Function that FlameGame provides when the app loads
    @override
    Future<void> onLoad() async {
        super.onLoad();

        // First, register player and background
        await add(_background);
        await add(_player);

        // Then, position the player in the middle of the screen
        // Relative to the background
        _player.position = _background.size / 1.5;

        // Later, we will implement a method to move the player
        // That's why we have to follow the player
        camera.followComponent(
            _player, 
            worldBounds: Rect.fromLTRB(
                0, 
                0, 
                _background.size.x, 
                _background.size.y,
            ),
        );
    }
}

/// Snap 3 - Create player and background
