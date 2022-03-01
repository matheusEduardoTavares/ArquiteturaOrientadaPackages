import { Schema } from 'mongoose';

export const TodoListSchema = new Schema(
  {
    image: {
      type: String,
    },
    title: {
      type: String,
    },
    description: {
      type: String,
    },
    isVisited: {
      type: Boolean,
    },
  },
  {
    timestamps: true,
    collection: 'todolist',
  },
);
