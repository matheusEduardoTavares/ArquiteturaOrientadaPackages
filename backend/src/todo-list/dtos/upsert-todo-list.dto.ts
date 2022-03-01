import { IsBoolean, IsNotEmpty, IsString } from 'class-validator';

export class UpsertTodoListDTO {
  @IsString()
  @IsNotEmpty()
  title: string;

  @IsString()
  @IsNotEmpty()
  description: string;

  @IsString()
  @IsNotEmpty()
  image: string;

  @IsBoolean()
  isVisited: boolean;
}
