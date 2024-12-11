import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { Funcionarios } from './funcionario';
import { Clientes } from './clientes';

@Entity()
export class Atendimento {
  @PrimaryGeneratedColumn()
  idAtendimento: number;

  @Column('decimal', { precision: 7, scale: 2 })
  valorFinal: number;

  @Column()
  data: Date;

  @Column({ length: 150 })
  cupomFiscal: string;

  @Column('decimal', { precision: 6, scale: 2 })
  imposto: number;

  @Column('decimal', { precision: 4, scale: 2, nullable: true })
  desconto?: number;

  @Column('decimal', { precision: 6, scale: 2, nullable: true })
  cashBack?: number;

  @ManyToOne(() => Funcionarios, funcionario => funcionario.atendimentos)
  funcionario: Funcionarios;

  @ManyToOne(() => Clientes, cliente => cliente.atendimentos)
  cliente: Clientes;

  constructor(
    valorFinal: number,
    data: Date,
    cupomFiscal: string,
    imposto: number,
    funcionario: Funcionarios,
    cliente: Clientes,
    desconto?: number,
    cashBack?: number
  ) {
    this.valorFinal = valorFinal;
    this.data = data;
    this.cupomFiscal = cupomFiscal;
    this.imposto = imposto;
    this.funcionario = funcionario;
    this.cliente = cliente;
    this.desconto = desconto;
    this.cashBack = cashBack;
  }
}