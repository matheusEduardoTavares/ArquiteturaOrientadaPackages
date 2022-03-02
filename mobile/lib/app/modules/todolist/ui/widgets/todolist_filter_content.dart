import 'package:business_layer/business_layer.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/modules/todolist/presenter/todolist_controller.dart';
import 'package:mobile/app/modules/todolist/ui/widgets/todolist_filter_item.dart';

class TodolistFilterContent extends StatefulWidget {
  const TodolistFilterContent({ 
    required TodolistController controller,
    required this.todolistItems,
    Key? key
  }) : 
  _controller = controller,
  super(key: key);

  final List<TodolistModel> todolistItems;
  final TodolistController _controller;

  @override
  State<TodolistFilterContent> createState() => _TodolistFilterContentState();
}

class _TodolistFilterContentState extends State<TodolistFilterContent> {
  @override
  void initState() {
    super.initState();

    widget._controller.initializeTimerAndTextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: LayoutBuilder(
          builder: (_, constraints) {
            return SingleChildScrollView(
              child: SizedBox(
                height: constraints.maxHeight - 30,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: widget._controller.filterEC,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              labelText: 'Search by title',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (widget._controller.filterEC != null) {
                              widget._controller.clearFilterTodolistItems(widget._controller.filterEC!);
                            }
                          }, 
                          child: const Icon(Icons.clear),
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(const Size(50, 50)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            )
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.bold, 
                              color: Colors.black, 
                              fontSize: 28,
                            ),
                            text: 'Places',
                            children: [
                              TextSpan(
                                text: ' to visit',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal, 
                                  color: Colors.black
                                ),
                              ),
                            ]
                          ),
                        ),
                      ),
                    ),
                    if (widget.todolistItems.isNotEmpty) 
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                          child: ListView.separated(
                            separatorBuilder: (_, index) => const SizedBox(
                              height: 10,
                              child: Divider(),
                            ),
                            itemCount: widget.todolistItems.length,
                            itemBuilder: (_, index) => TodolistFilterItem(
                              model: widget.todolistItems[index],
                              controller: widget._controller,
                              index: index,
                            )
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget._controller.disposeTimerAndTextEditingController();

    super.dispose();
  }
}