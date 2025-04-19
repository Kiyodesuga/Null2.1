import 'package:flutter/material.dart';
import '../screens/profile_screen.dart';
import '../screens/thought_log_screen.dart';
import '../screens/wave_graph_screen.dart';
import '../screens/settings_screen.dart';

class SidePanel extends StatefulWidget {
  final Widget child;
  const SidePanel({required this.child, Key? key}) : super(key: key);

  @override
  State<SidePanel> createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> with SingleTickerProviderStateMixin {
  static const double width = 408;
  late final AnimationController _ctrl = AnimationController(
    vsync: this, duration: const Duration(milliseconds: 450),
  );
  late final Animation<Offset> _offsetAnim = Tween<Offset>(
    begin: const Offset(-1, 0), end: Offset.zero,
  ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));

  void _toggle() {
    if (_ctrl.isCompleted) _ctrl.reverse(); else _ctrl.forward();
  }

  void _navigate(Widget screen) {
    _ctrl.reverse().then((_) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      widget.child,
      SlideTransition(
        position: _offsetAnim,
        child: GestureDetector(
          onTap: () {}, // consume taps
          child: Container(
            width: width,
            color: Colors.black87,
            padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: _toggle,
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => _navigate(const ProfileScreen()),
                child: const Text('Profile', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              TextButton(
                onPressed: () => _navigate(const ThoughtLogScreen()),
                child: const Text('Thought Log', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              TextButton(
                onPressed: () => _navigate(const WaveGraphScreen()),
                child: const Text('Wave Graph', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              TextButton(
                onPressed: () => _navigate(const SettingsScreen()),
                child: const Text('Settings', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ]),
          ),
        ),
      ),
      Positioned(
        top: 40, left: 16,
        child: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: _toggle,
        ),
      ),
    ]);
  }
}
