import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { UpsertTodoListDTO } from './dtos/upsert-todo-list.dto';
import { TodoList } from './interfaces/todo-list.interface';

@Injectable()
export class TodoListService {
  constructor(
    @InjectModel('Todolist')
    private readonly todoListModel: Model<TodoList>,
  ) {}

  async createTodoList(
    upsertTodoListDTO: UpsertTodoListDTO,
  ): Promise<TodoList> {
    const newTodoList = new this.todoListModel(upsertTodoListDTO);
    return await newTodoList.save();
  }

  async getTodoList(): Promise<Array<TodoList>> {
    return await this.todoListModel.find().exec();
  }

  async updateTodoList(
    _id: string,
    upsertTodoListDTO: UpsertTodoListDTO,
  ): Promise<void> {
    const todoListData = await this.todoListModel
      .findOne({
        _id,
      })
      .exec();

    if (!todoListData) {
      throw new NotFoundException(`Item ${_id} não encontrado!`);
    }

    await this.todoListModel
      .findOneAndUpdate(
        {
          _id,
        },
        {
          $set: upsertTodoListDTO,
        },
      )
      .exec();
  }

  async deleteTodoList(_id: string): Promise<void> {
    const todoListData = await this.todoListModel
      .findOne({
        _id,
      })
      .exec();

    if (!todoListData) {
      throw new NotFoundException(`Item ${_id} não encontrado!`);
    }

    await this.todoListModel
      .findOneAndRemove({
        _id,
      })
      .exec();
  }
}
