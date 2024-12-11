import { Entity, PrimaryColumn, Column } from 'typeorm';

@Entity()
export class ContatoEmergencia {
  @PrimaryColumn({ length: 17 })
  numTelefone: string;

  @Column({ length: 45 })
  nome: string;

  @Column({ length: 45 })
  pais: string;

  @Column({ length: 45 })
  parentesco: string;

  constructor(numTelefone: string, nome: string, pais: string, parentesco: string) {
    this.numTelefone = numTelefone;
    this.nome = nome;
    this.pais = pais;
    this.parentesco = parentesco;
  }
}