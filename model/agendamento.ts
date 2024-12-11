import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { Clientes } from './clientes';
import { Servicos } from './servicos';

@Entity()
export class Agendamento {
  @PrimaryGeneratedColumn()
  idAgendamento: number;

  @Column()
  Horario: Date;

  @ManyToOne(() => Clientes, cliente => cliente.idCliente)
  cliente: Clientes;

  @ManyToOne(() => Servicos, servico => servico.idServico)
  servico: Servicos;

  constructor(Horario: Date, cliente: Clientes, servico: Servicos) {
    this.Horario = Horario;
    this.cliente = cliente;
    this.servico = servico;
  }
}