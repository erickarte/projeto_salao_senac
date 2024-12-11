import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity()
export class Servicos {
  @PrimaryGeneratedColumn()
  idServico: number;

  @Column({ length: 45 })
  nome: string;

  @Column('decimal', { precision: 6, scale: 2 })
  valor: number;

  constructor(nome: string, valor: number) {
    this.nome = nome;
    this.valor = valor;
  }
}