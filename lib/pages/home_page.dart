import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
        backgroundColor: Colors.amber.shade300,
        actions: [
          IconButton(
            onPressed: () => GoRouter.of(context).push('/add'),
            icon: const Icon(
              Icons.add_box_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // 5. create a consumer for our sppecified provider to display the list on the homepage
        child: Consumer<TodoProvider>(
            builder: (context, todoProvider, child) => ListView.builder(
                shrinkWrap: true,
                // itemCount: context.watch<ToDoProvider>().todos.length,
                itemCount: todoProvider.todos.length,
                itemBuilder: (context, index) => TodoTile(
                    todo: todoProvider.todos[
                        index]) // access one item from the list we use index inside []
                )),
      ),
    );
  }
}
