# Sistema para Venda de Ingressos - Unidavi (Pascal)

## Sobre o Projeto

Durante a aula de Estrutura de Dados, foi desenvolvido este sistema com os seguintes requisitos:

## Contexto

O Santa Catarina, equipe de futebol de Rio do Sul, após fazer excelente campanha no campeonato catarinense, deseja aprimorar a venda de ingressos, tornando-a mais ágil. Pensando assim, a diretoria lhe contratou para prototipar um software com as seguintes condições:

### Regras do Sistema

1. Existem dois tipos de acomodação:
   - Arquibancada coberta
   - Geral
2. Regras de venda:
   - Arquibancada: sócios e torcedores do time
   - Geral: torcedores do time e torcedores visitantes
3. Capacidade:
   - Arquibancada: 1500 torcedores
   - Geral: 1200 torcedores (350 visitantes)
4. Ingressos são inseridos em **pilhas**, conforme regras
5. Torcedores usam **filas**:
   - Sócios (máx. 200) → apenas arquibancada
   - Visitantes → apenas geral
   - Normais → podem escolher
6. Após a compra, o torcedor escolhe o assento (lista de locais disponíveis)

### Valores dos Ingressos

- **Arquibancada:** R$ 150,00  
  - Sócios: R$ 70,00
- **Geral:** R$ 50,00  
  - Visitantes: R$ 100,00

## Objetivo

Prototipar e gerenciar o processo de venda de ingressos, informando o total arrecadado por tipo de ingresso e o total da renda.
