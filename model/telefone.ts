import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { Funcionarios } from './funcionario';

@Entity()
export class Telefone {
  @PrimaryGeneratedColumn()
  idTelefone: number;

  @Column({ length: 15 })
  numero: string;

  @ManyToOne(() => Funcionarios, funcionario => funcionario.telefones, { onDelete: 'CASCADE' })
  funcionario: Funcionarios;

  constructor(numero: string, funcionario: Funcionarios) {
    this.numero = numero;
    this.funcionario = funcionario;
  }
}