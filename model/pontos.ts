import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { Funcionarios } from './funcionario';

@Entity()
export class Ponto {
  @PrimaryGeneratedColumn()
  idPonto: number;

  @Column()
  dataHora: Date;

  @Column({ length: 1 })
  tipoES: string;

  @Column({ length: 45, nullable: true })
  validacao?: string;

  @ManyToOne(() => Funcionarios, funcionario => funcionario.pontos, { onDelete: 'CASCADE' })
  funcionario: Funcionarios;

  constructor(dataHora: Date, tipoES: string, funcionario: Funcionarios, validacao?: string) {
    this.dataHora = dataHora;
    this.tipoES = tipoES;
    this.funcionario = funcionario;
    this.validacao = validacao;
  }
}