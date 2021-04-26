import { Column, Entity, Index, PrimaryGeneratedColumn } from 'typeorm';

@Entity('role')
export class RoleEntity {
  @PrimaryGeneratedColumn({
    name: 'id',
    type: 'bigint',
  })
  id: string;

  @Index({ unique: true })
  @Column({
    name: 'is_default',
    nullable: true,
    type: 'boolean',
    select: false,
  })
  public isDefault: boolean;
}
