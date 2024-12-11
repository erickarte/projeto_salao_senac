import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { Funcionarios } from './funcionario';

@Entity()
export class Departamentos {
  @PrimaryGeneratedColumn()
  idDepartamento: number;

  @Column({ length: 45 })
  nome: string;

  @Column({ length: 15 })
  telefone: string;

  @Column({ length: 45 })
  local: string;

  @ManyToOne(() => Funcionarios, funcionario => funcionario.matricula, { nullable: true })
  gerente?: Funcionarios;

  constructor(nome: string, telefone: string, local: string, gerente?: Funcionarios) {
    this.nome = nome;
    this.telefone = telefone;
    this.local = local;
    this.gerente = gerente;
  }
}