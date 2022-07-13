import 'package:bloc/bloc/cartBloc.dart';
import 'package:bloc/bloc/lessonBloc.dart';
import 'package:flutter/material.dart';
import '../models/cart.dart';

class LessonList extends StatelessWidget {
  const LessonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dersler",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        leading: const Icon(Icons.library_books),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cart");
              },
              icon: const Icon(Icons.add_circle_outline_sharp))
        ],
      ),
      body: buildLesson(),
    );
  }

  buildLesson() {
    return StreamBuilder(
      initialData: lessonbloc.getAll(),
      stream: lessonbloc.getStream,
      builder: (context, snapshot) {
        //snapShot stremden gelen o anki görüntü
        return buildLessonListItems(snapshot);
      },
    );
  }

  buildLessonListItems(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index) {
          final list = snapshot.data;
          return ListTile(
            title: Text(list[index].name),
            subtitle: Text("Kredi" + list[index].point.toString()),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                cartBloc.addToCart(Cart(list[index]));
              },
            ),
          );
        });
  }
}
