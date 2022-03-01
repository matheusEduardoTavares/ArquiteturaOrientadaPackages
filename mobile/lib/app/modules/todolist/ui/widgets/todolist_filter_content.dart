import 'package:business_layer/business_layer.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/modules/todolist/ui/widgets/todolist_filter_item.dart';

class TodolistFilterContent extends StatelessWidget {
  const TodolistFilterContent({ 
    required this.todolistItems,
    Key? key
  }) : super(key: key);

  final List<TodolistModel> todolistItems;

  @override
  Widget build(BuildContext context) {
    if (todolistItems.isEmpty) {
      return const Center(
        child: Text('Nenhum item para ser exibido'),
      );
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: LayoutBuilder(
          builder: (_, constraints) {
            return SingleChildScrollView(
              child: SizedBox(
                height: constraints.maxHeight,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none
                              ),
                              prefixIcon: const Icon(Icons.search),
                              hintText: 'Search',
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {}, 
                          child: const Icon(Icons.menu),
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
                    Expanded(
                      child: ListView.builder(
                        itemCount: todolistItems.length,
                        itemBuilder: (_, index) => TodolistFilterItem(
                          model: todolistItems[index],
                        )
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}