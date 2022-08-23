import 'package:flutter/material.dart';

class GridViewExample extends StatefulWidget {
  const GridViewExample({Key? key}) : super(key: key);

  @override
  State<GridViewExample> createState() => _GridViewExampleState();
}

class _GridViewExampleState extends State<GridViewExample> {

  List<String> images = [
    "https://itstuff.com.ua/wp-content/uploads/2021/11/dash1.jpg",
    "https://itstuff.com.ua/wp-content/uploads/2021/11/dash2.jpg",
    "https://lh3.googleusercontent.com/wEpdmU0qYb6-FPLeAwhPGpOG9x9YNz5bXKy1DiLled1xr5HtqwFYAUGIfnr7nNgoKN20WhBQTTs1XoC9aLDUDXx1VkjqEAWgLoaSXWbyek3pkltmYDRaNgPvmcswzZFUg95qDYcURfo=w400",
    "https://pbs.twimg.com/media/DUUxe1VUMAAhpzF.jpg:large",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView Example"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
            itemCount:images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0
            ),
            itemBuilder: (BuildContext context, int index){
              return Image.network(images[index]);
            }),
      ),
    );
  }
}
