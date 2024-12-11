import { Entity, PrimaryColumn, Column, ManyToOne } from 'typeorm';
import { Funcionarios } from './funcionario';

@Entity()
export class Profissional {
  @PrimaryColumn()
  Funcionarios_matricula: number;

  @Column({ length: 45 })
  especialidade: string;

  @Column({ length: 15, nullable: true })
  conselho?: string;

  @ManyToOne(() => Funcionarios, funcionario => funcionario.profissionais, { onDelete: 'CASCADE' })
  funcionario: Funcionarios;

  constructor(funcionario: Funcionarios, especialidade: string, conselho?: string) {
    this.Funcionarios_matricula = funcionario.matricula;
    this.especialidade = especialidade;
    this.conselho = conselho;
  }
}