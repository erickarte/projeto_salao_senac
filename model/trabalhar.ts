import { Entity, PrimaryColumn, Column, ManyToOne } from 'typeorm';
import { Funcionarios } from './funcionario';
import { Departamentos } from './departamentos';
import { Cargos } from './cargos';

@Entity()
export class Trabalhar {
  @PrimaryColumn()
  Funcionarios_matricula: number;

  @PrimaryColumn()
  Departamentos_idDepartamento: number;

  @PrimaryColumn({ length: 15 })
  Cargos_cbo: string;

  @Column()
  dataInicio: Date;

  @Column({ nullable: true })
  dataFim?: Date;

  @ManyToOne(() => Funcionarios, funcionario => funcionario.matricula)
  funcionario: Funcionarios;

  @ManyToOne(() => Departamentos, departamento => departamento.idDepartamento)
  departamento: Departamentos;

  @ManyToOne(() => Cargos, cargo => cargo.cbo)
  cargo: Cargos;

  constructor(
    funcionario: Funcionarios,
    departamento: Departamentos,
    cargo: Cargos,
    dataInicio: Date,
    dataFim?: Date
  ) {
    this.Funcionarios_matricula = funcionario.matricula;
    this.Departamentos_idDepartamento = departamento.idDepartamento;
    this.Cargos_cbo = cargo.cbo;
    this.dataInicio = dataInicio;
    this.dataFim = dataFim;
  }
}