import { Entity, PrimaryColumn, Column } from 'typeorm';

@Entity()
export class Cargos {
  @PrimaryColumn({ length: 15 })
  cbo: string;

  @Column({ length: 45 })
  nome: string;

  constructor(cbo: string, nome: string) {
    this.cbo = cbo;
    this.nome = nome;
  }
}