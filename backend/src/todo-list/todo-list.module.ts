import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose/dist/mongoose.module';
import { TodoListSchema } from './interfaces/todo-list.schema';
import { TodoListController } from './todo-list.controller';
import { TodoListService } from './todo-list.service';

@Module({
  controllers: [TodoListController],
  providers: [TodoListService],
  imports: [
    MongooseModule.forFeature([{ name: 'Todolist', schema: TodoListSchema }]),
  ],
})
export class TodoListModule {}
