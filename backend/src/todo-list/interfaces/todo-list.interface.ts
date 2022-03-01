export interface TodoList extends Document {
  readonly image: string;
  readonly title: string;
  readonly description: string;
  readonly isVisited: boolean;
}
