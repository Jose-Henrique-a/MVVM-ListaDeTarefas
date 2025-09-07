import 'package:flutter/material.dart';
import 'package:flutter_todo_yt/src/viewmodel/todo_viewmodel.dart';
import 'package:provider/provider.dart';

class TodoEdit extends StatefulWidget {
  final todoData;
  const TodoEdit({super.key, required this.todoData});

  @override
  State<TodoEdit> createState() => _TodoEditState();
}

class _TodoEditState extends State<TodoEdit> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final todocontroller = Provider.of<TodoViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: const Text('Editar Tarefa')),
      body: Form(
        key: formKey,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 25),
              Container(
                width: 400,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: todocontroller.titlecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Atualizar Título",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Container(
                width: 400,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: todocontroller.descriptioncontroller,

                  minLines: 3,
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Atualizar Descrição",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    todocontroller.editTodo(widget.todoData.sId);
                  }
                },
                child: Container(
                  width: 400,
                  height: 55,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(
                    child: Text(
                      "Salvar Atualização",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
