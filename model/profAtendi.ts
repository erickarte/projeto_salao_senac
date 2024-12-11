import { Entity, PrimaryColumn, ManyToOne } from 'typeorm';
import { Profissional } from './profissional';
import { Atendimento } from './atendimento';

@Entity()
export class Profissional_Atendimento {
  @PrimaryColumn()
  Profissional_Funcionarios_matricula: number;

  @PrimaryColumn()
  Atendimento_idAtendimento: number;

  @ManyToOne(() => Profissional, profissional => profissional.funcionario)
  profissional: Profissional;

  @ManyToOne(() => Atendimento, atendimento => atendimento.idAtendimento)
  atendimento: Atendimento;

  constructor(profissional: Profissional, atendimento: Atendimento) {
    this.Profissional_Funcionarios_matricula = profissional.funcionario.matricula;
    this.Atendimento_idAtendimento = atendimento.idAtendimento;
  }
}