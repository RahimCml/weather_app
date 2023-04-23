import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textcontroller;

  void initState() {
    super.initState();
    _textcontroller = TextEditingController();
  }

  @override
  void dispose() {
    _textcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Temperature'),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: _textcontroller,
              decoration: const InputDecoration(
                  hintText: 'select city..',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Button'))
          ],
        ),
      ),
    );
  }
}
