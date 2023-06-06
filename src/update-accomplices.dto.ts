import { IsInt, ArrayNotEmpty, IsArray } from 'class-validator';

export class UpdateAccomplicesDto {
  @IsInt()
  characterId: number;

  @IsArray()
  @ArrayNotEmpty()
  accompliceIds: number[];
}
