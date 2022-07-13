import 'package:bloc/bloc/cartBloc.dart';
import 'package:flutter/material.dart';

class LessonCart extends StatelessWidget {
  const LessonCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Secilen Dersler"),
      ),
      body: StreamBuilder(
          stream: cartBloc.getStream,
          initialData: cartBloc.getCart(),
          builder: (context, snapshot) {
            return buildCart(snapshot);
          }),
    );
  }

  Widget buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index) {
          final Cart = snapshot.data;
          return ListTile(
            title: Text(Cart[index].lesson.name),
            subtitle: Text(Cart[index].lesson.point.toString()),
            trailing: IconButton(
                onPressed: () {
                  cartBloc.removeFromCart(Cart[index]);
                },
                icon: const Icon(Icons.delete)),
          );
        });
  }
}
