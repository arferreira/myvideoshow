# CAOS:

- App onde as pessoas podem carregar vídeos através de uma autenticação
- Usar materialize
- O usuário poderá subir seus vídeos através de seu login
- O vídeo precisa ter um nome e URL (URL precisa finalizar com a extensão m3u8)
- Tela inicial mostrará o acervo de vídeos que a app tem
- Tela para visualização do vídeo poderá ser acessada por qualquer pessoa e terá um player para o vídeo o nome do vídeo e a quantidade de visualizações
- Contabilizar a view do vídeo após disparar o evento start do player
- Contabilizar as views que o vídeo teve
- Deployar no heroic
- Configurar autoplay no vídeo
- Utilizar o Postgresql


# ORDEM (Planejamento Criativo):
 * Separando o CAOS em passos que levará ao desenvolvimento total da app

- Sintetização da idéia: 
Um app para que as pessoas possam realizar uploads de vídeos, onde deverão ser enviados vídeos m3u8. No app as pessoas podem visualizar vários vídeos enviados pelos usuários, como também podem criar suas próprias contas e enviar os seus próprios vídeos também.

- Sintetização das funções da App:
* Realização de criação de conta e login de usuários registrados
* Realização de upload de vídeo para usuários registrados
* Visualização dos vídeos no acervo geral

# ORDEM (Planejamento Técnico):

- Mapeamento das actions da App:
* Pages:
- Home
* Vídeos:
- Show
- List
- Create
- Update
- Destroy


# Criação dos Wireframes:


# Definição do Stack do Projeto


* Repositório
-  Github

* Desenvolvimento
-  Ruby on Rails
    * Bibliotecas
    -  Materialize
    -  Devise
    -  Rspec Rails
    -  Factory Girl Rails
    -  Ffaker
    -  PostgresSQL

