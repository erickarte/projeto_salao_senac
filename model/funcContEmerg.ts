import { Entity, PrimaryColumn, ManyToOne } from 'typeorm';
import { Funcionarios } from './funcionario';
import { ContatoEmergencia } from './contatoEmergencia';

@Entity()
export class Funcionarios_ContatoEmergencia {
  @PrimaryColumn()
  Funcionarios_matricula: number;

  @PrimaryColumn({ length: 17 })
  ContatoEmergencia_numTelefone: string;

  @ManyToOne(() => Funcionarios, funcionario => funcionario.matricula)
  funcionario: Funcionarios;

  @ManyToOne(() => ContatoEmergencia, contato => contato.numTelefone)
  contatoEmergencia: ContatoEmergencia;

  constructor(funcionario: Funcionarios, contatoEmergencia: ContatoEmergencia) {
    this.Funcionarios_matricula = funcionario.matricula;
    this.ContatoEmergencia_numTelefone = contatoEmergencia.numTelefone;
  }
}