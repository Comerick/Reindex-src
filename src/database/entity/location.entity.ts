import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'locations' })
export class LocationEntity {
  @PrimaryGeneratedColumn({
    name: 'id',
    type: 'bigint',
  })
  id: string;

  @Column({
    name: 'latitude',
    type: 'double',
    nullable: true,
  })
  latitude: number;

  @Column({
    name: 'longitude',
    type: 'double',
    nullable: true,
  })
  longitude: number;
}
