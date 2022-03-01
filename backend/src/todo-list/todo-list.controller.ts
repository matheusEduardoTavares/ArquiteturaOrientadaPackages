import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
  UsePipes,
  ValidationPipe,
} from '@nestjs/common';
import { UpsertTodoListDTO } from './dtos/upsert-todo-list.dto';
import { TodoList } from './interfaces/todo-list.interface';
import { TodoListService } from './todo-list.service';

@Controller('todo-list')
export class TodoListController {
  constructor(private readonly todoListService: TodoListService) {}

  @Post()
  @UsePipes(ValidationPipe)
  async createTodoList(
    @Body() upsertTodoListDTO: UpsertTodoListDTO,
  ): Promise<TodoList> {
    return await this.todoListService.createTodoList(upsertTodoListDTO);
  }

  @Get()
  async getTodoList(): Promise<Array<TodoList>> {
    return await this.todoListService.getTodoList();
  }

  @Put('/:_id')
  @UsePipes(ValidationPipe)
  async updateTodoList(
    @Body() upsertTodoListDTO: UpsertTodoListDTO,
    @Param('_id') _id: string,
  ): Promise<void> {
    await this.todoListService.updateTodoList(_id, upsertTodoListDTO);
  }

  @Delete('/:_id')
  async deleteTodoList(@Param('_id') _id: string): Promise<void> {
    await this.todoListService.deleteTodoList(_id);
  }
}
