import { Entity, Column, ManyToOne, PrimaryColumn } from 'typeorm';
import { Servicos } from './servicos';
import { Atendimento } from './atendimento';
import { Funcionarios } from './Funcionarios';

@Entity()
export class ServicoPrestado {
  @PrimaryColumn()
  Servicos_idServico: number;

  @PrimaryColumn()
  Atendimento_idAtendimento: number;

  @PrimaryColumn()
  Funcionarios_matricula: number;

  @Column()
  quantidade: number;

  @Column('decimal', { precision: 6, scale: 2 })
  valor: number;

  @Column('decimal', { precision: 4, scale: 2, nullable: true })
  desconto?: number;

  @ManyToOne(() => Servicos, servico => servico.idServico)
  servico: Servicos;

  @ManyToOne(() => Atendimento, atendimento => atendimento.idAtendimento)
  atendimento: Atendimento;

  @ManyToOne(() => Funcionarios, funcionario => funcionario.matricula)
  funcionario: Funcionarios;

  constructor(
    servico: Servicos,
    atendimento: Atendimento,
    funcionario: Funcionarios,
    quantidade: number,
    valor: number,
    desconto?: number
  ) {
    this.Servicos_idServico = servico.idServico;
    this.Atendimento_idAtendimento = atendimento.idAtendimento;
    this.Funcionarios_matricula = funcionario.matricula;
    this.quantidade = quantidade;
    this.valor = valor;
    this.desconto = desconto;
  }
}