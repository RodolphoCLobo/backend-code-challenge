# README

Resolução do teste de processo seletivo da Rakuten Brasil:

Foi utilizado o algoritmo de Dijkstra para solucionar o caso do melhor caminho, a lib criada não tem suporte em vértices com refências numéricas para seus nomes, o método que calcula o menor caminho é recursivo. Durante todo o projeto foi decidido usar Sinatra por ser uma API simples com apenas 2 rotas('/costs', '/distances').

# Using

* Versão do Ruby

  - 2.6.3

* Dependências do Sistema

  - PostgreSQL

* Configurações

  - utilize o comando `gem install bundle ; bundle install` no diretório da aplicação.

* Criar Banco de Dados

  - utilize o comando `rake db:create` no diretório da aplicação.

* Criar Banco de Dados para Test (caso o comando anterior nao crie automaticamente).

  - utilize o comando `rake db:create RACK_ENV=test` no diretório da aplicação.

* Criar Migration

  - utilize o comando `rake db:migrate` no diretório da aplicação.

* Criar Migration no Environment Test

  - utilize o comando `rake db:migrate RACK_ENV=test` no diretório da aplicação.

* Popular Banco de Dados

  - utilize o comando `rake db:seed` no diretório da aplicação.

* Testes

  - utilize o comando `bundle exec rspec spec` no diretório da aplicação.

  - após executar os testes será gerado uma análise de cobertura de testes, que pode ser acessada no navegador. Para isso, copie o path do arquivo gerado no diretorio './coverage/index.html' e cole no navegador.

* Iniciar Aplicação

  - utilize o comando `rackup -p PORTA_DESEJADA` no diretório da aplicação.

## Contribuidores

 - Rodolpho Corrêa Lobo de Azeredo
