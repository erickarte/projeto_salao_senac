import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { Atendimento } from './atendimento';
import { Agendamento } from './agendamento';

@Entity()
export class Clientes {
  @PrimaryGeneratedColumn()
  idCliente: number;

  @Column({ length: 45 })
  nome: string;

  @Column({ length: 45 })
  email: string;

  @Column({ length: 15 })
  telefone: string;

  @Column({ nullable: true })
  dataAniversario?: Date;

  @OneToMany(() => Atendimento, atendimento => atendimento.cliente)
  atendimentos: Atendimento[];

  @OneToMany(() => Agendamento, agendamento => agendamento.cliente)
  agendamentos: Agendamento[];

  constructor(nome: string, email: string, telefone: string, dataAniversario?: Date) {
    this.nome = nome;
    this.email = email;
    this.telefone = telefone;
    this.dataAniversario = dataAniversario;
  }
}