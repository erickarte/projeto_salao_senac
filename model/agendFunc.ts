import { Entity, PrimaryColumn, ManyToOne } from 'typeorm';
import { Agendamento } from './agendamento';
import { Funcionarios } from './funcionario';

@Entity()
export class Agendamento_Funcionarios {
  @PrimaryColumn()
  Agendamento_idAgendamento: number;

  @PrimaryColumn()
  Funcionarios_matricula: number;

  @ManyToOne(() => Agendamento, agendamento => agendamento.idAgendamento)
  agendamento: Agendamento;

  @ManyToOne(() => Funcionarios, funcionario => funcionario.matricula)
  funcionario: Funcionarios;

  constructor(agendamento: Agendamento, funcionario: Funcionarios) {
    this.Agendamento_idAgendamento = agendamento.idAgendamento;
    this.Funcionarios_matricula = funcionario.matricula;
  }
}