import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { Telefone } from './telefone';
import { Ponto } from './pontos';
import { Ocorrencia } from './ocorrencias';
import { Atendimento } from './atendimento';
import { Profissional } from './profissional';

@Entity()
export class Funcionarios {
  @PrimaryGeneratedColumn()
  matricula: number;

  @Column({ length: 60 })
  nome: string;

  @Column({ length: 25, nullable: true })
  nomeSocial?: string;

  @Column({ length: 25 })
  nacionalidade: string;

  @Column()
  dataNasc: Date;

  @Column({ length: 45 })
  email: string;

  @Column({ length: 1 })
  genero: string;

  @Column({ length: 14, nullable: true })
  cpf?: string;

  @Column('decimal', { precision: 7, scale: 2, unsigned: true, zerofill: true })
  salario: number;

  @Column()
  ch: number;

  @Column()
  dataAdm: Date;

  @Column({ nullable: true })
  dataDem?: Date;

  @OneToMany(() => Telefone, telefone => telefone.funcionario)
  telefones: Telefone[];

  @OneToMany(() => Ponto, ponto => ponto.funcionario)
  pontos: Ponto[];

  @OneToMany(() => Ocorrencia, ocorrencia => ocorrencia.funcionario)
  ocorrencias: Ocorrencia[];

  @OneToMany(() => Atendimento, atendimento => atendimento.funcionario)
  atendimentos: Atendimento[];

  @OneToMany(() => Profissional, profissional => profissional.funcionario)
  profissionais: Profissional[];

  constructor(
    nome: string,
    nacionalidade: string,
    dataNasc: Date,
    email: string,
    genero: string,
    salario: number,
    ch: number,
    dataAdm: Date,
    nomeSocial?: string,
    cpf?: string,
    dataDem?: Date
  ) {
    this.nome = nome;
    this.nacionalidade = nacionalidade;
    this.dataNasc = dataNasc;
    this.email = email;
    this.genero = genero;
    this.salario = salario;
    this.ch = ch;
    this.dataAdm = dataAdm;
    this.nomeSocial = nomeSocial;
    this.cpf = cpf;
    this.dataDem = dataDem;
  }
}