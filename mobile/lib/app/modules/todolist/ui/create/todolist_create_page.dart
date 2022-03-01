import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app/core/custom_validations/custom_validations.dart';
import 'package:mobile/app/modules/todolist/presenter/todolist_controller.dart';
import 'package:mobile/app/modules/todolist/presenter/todolist_state.dart';
import 'package:validatorless/validatorless.dart';

class TodolistCreatePage extends StatefulWidget {
  const TodolistCreatePage({ 
    required TodolistController controller,
    Key? key 
  }) : 
  _controller = controller,
  super(key: key);

  final TodolistController _controller;

  @override
  _TodolistCreatePageState createState() => _TodolistCreatePageState();
}

class _TodolistCreatePageState extends State<TodolistCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _titleEC = TextEditingController();
  final _descriptionEC = TextEditingController();
  final _imageUrlEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Todolist Item'),
        ),
        body: BlocBuilder<TodolistController, TodolistState>(
          bloc: widget._controller,
          builder: (_, state) {
            if (state.isRequesting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Center(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Location title'
                            ),
                            controller: _titleEC,
                            validator: Validatorless.required('Title is required'),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Location description'
                            ),
                            controller: _descriptionEC,
                            validator: Validatorless.required('Description is required'),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Location image URL'
                            ),
                            controller: _imageUrlEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('Image URL is required'),
                              CustomValidations.url('Needs be a URL'),
                            ]),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            widget._controller.validateAndCreateTodolistItem(
                              formKey: _formKey, 
                              imageUrl: _imageUrlEC.text, 
                              title: _titleEC.text, 
                              description: _descriptionEC.text,
                            );
                          }, 
                          child: const Text('Create')
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleEC.dispose();
    _descriptionEC.dispose();
    _imageUrlEC.dispose();

    super.dispose();
  }
}