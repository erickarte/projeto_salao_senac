import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { Funcionarios } from './funcionario';

@Entity()
export class Ocorrencia {
  @PrimaryGeneratedColumn()
  idOcorrencia: number;

  @Column()
  dataHora: Date;

  @Column({ length: 45 })
  tipo: string;

  @Column({ nullable: true })
  qtdDias?: number;

  @Column({ length: 150, nullable: true })
  obs?: string;

  @ManyToOne(() => Funcionarios, funcionario => funcionario.ocorrencias, { onDelete: 'CASCADE' })
  funcionario: Funcionarios;

  constructor(dataHora: Date, tipo: string, funcionario: Funcionarios, qtdDias?: number, obs?: string) {
    this.dataHora = dataHora;
    this.tipo = tipo;
    this.funcionario = funcionario;
    this.qtdDias = qtdDias;
    this.obs = obs;
  }
}