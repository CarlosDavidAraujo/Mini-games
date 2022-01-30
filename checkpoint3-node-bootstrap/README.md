# Projeto Integrado I - Levináticos

PARTICIPANTES: </br>
Carlos David Araújo Ventura </br>
Nillia Sousa da Silva </br>
Victor Emanuel Pegado De Lima </br>
Vinícius dos Santos Batista </br>

CLIENTE: </br>
Instituto Social para o Desenvolvimento de Potencialidades Humanas - IDEP Social

DESCRIÇÃO DO PROJETO: </br>
O IDEP é uma organização da sociedade civil - OSC, independente e sem fins lucrativos, fundada em 2012
a partir da idealização de um instituto que trabalhasse com a crença no potencial criativo e
inovador das pessoas, dando ênfase às temáticas relacionadas ao mundo do trabalho e aos
Direitos Humanos. Atualmente o Instituto trabalha principalmente com a administração de estágios e
jovens aprendizes. Nosso projeto tem como objetivo melhorar o processo de seleção
desses jovens para a entrada no mercado de trabalho, criando uma plataforma onde a
instituição possa divulgar as vagas em aberto naquele momento e os jovens possam
visualizar essas oportunidades e se inscreverem nas quais mais se identificam.

|                                            |   Tabela de requisitos e suas respectivas funções/classes    |                                           |  
|--------------------------------------------|--------------------------------------------------------------|-------------------------------------------|
| Código                                     | Funcionalidade                                               | Local                                     |
| RF0001                                     | Acessar a página inicial                                     |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/1084f65d74896ed6cced74e7a647ac5939c47a8f/checkpoint3-node-bootstrap/routes/vaga-route.js#L10">código</a>                                         |
| RF0002                                     | Visualizar vagas mais recentes na tela inicial               |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/1084f65d74896ed6cced74e7a647ac5939c47a8f/checkpoint3-node-bootstrap/functions/Vaga.js#L58-L67">código</a>                              |
| RF0003                                     | Visualizar vagas disponíveis no sistema                      |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/1084f65d74896ed6cced74e7a647ac5939c47a8f/checkpoint3-node-bootstrap/functions/Vaga.js#L48-L56">código</a>                                            |
| RF0004                                     | Ver detalhes das vagas                                       |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/views/partials/modalVaga.hbs#L1-L93">código</a>                                           |
| RF0005                                     | Pesquisar por vagas                                          |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/views/paginas/vaga/index.hbs#L117-L131">código</a>                              |
| RF0006                                     | Visualizar empresas parceiras da OSC na tela inicial         |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/views/partials/parceiros.hbs#L1-L16">código</a>                              |
| RF0007                                     | Visualizar descrição sobre as modalidades na tela inicial    |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/views/partials/modalidades.hbs#L1-L53">código</a>                              |
| RF0008                                     | Visualizar mapa com local da OSC na tela inicial             |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/views/partials/mapa.hbs#L1-L23">código</a>                              |
| RF0009                                     | Cadastrar-se no sistema (Candidato)                          |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/functions/User.js#L210-L222">código</a>                                           |
| RF0010                                     | Fazer login                                                  |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/functions/User.js#L206-L208">código</a>                                           |
| RF0011                                     | Fazer logout                                                 |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/functions/User.js#L224-L226">código</a>                                           |
| RF0012                                     | Alterar e-mail                                               |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/functions/User.js#L232-L234">código</a>                                           |
| RF0013                                     | Alterar senha                                                |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/functions/User.js#L260-L265">código</a>                                           |
| RF0014                                     | Candidatar-se à uma vaga                                     |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/functions/User.js#L267-L272">código</a>                                           |
| RF0015                                     | Cancelar candidatura                                         |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/functions/User.js#L284-L287">código</a>                                           |
| RF0016                                     | Visualizar vagas submetidas no perfil                        |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/functions/User.js#L274-L282">código</a>                                           |
| RF0017                                     | Ver detalhes de progresso e informações das vagas submetidas |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/views/paginas/perfil/index.hbs#L12-L169">código</a>                                           |
| RF0018                                     | Editar dados de cadastro                                     |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/functions/User.js#L228-L249">código</a>                                           |
| RF0019                                     | Fazer login como administrador                               |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/middlewares/autenticacao.js#L27-L33">código</a>                              |
| RF0020                                     | Adicionar vaga                                               |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/functions/Vaga.js#L98-L122">código</a>                                           |
| RF0021                                     | Editar vagas                                                 |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/functions/Vaga.js#L128-L146">código</a>                              |
| RF0022                                     | Fechar vagas                                                 |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/functions/Vaga.js#L124-L126">código</a>                              |
| RF0023                                     | Visualizar vagas fechadas                                    |CANCELADO                             |
| RF0024                                     | Visualizar candidatos                                        |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/functions/User.js#L195-L204">código</a>                              |
| RF0025                                     | Buscar candidatos por vaga com uso de filtro                 |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/functions/User.js#L325-L334">código</a>                              |
| RF0026                                     | Alterar status dos candidatos                                |CANCELADO                              |
| RF0027                                     | Gerar gráfico com panorama de perfis dos usuários            |<a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/functions/User.js#L289-L323">código</a>, <a href="https://github.com/nillias/projetoIntegrado1_Levinaticos/blob/e44b8b8fa7eb0e42dbbef731d2ff247ce1ae5e39/checkpoint3-node-bootstrap/views/partials/graficoIdade.hbs#L1-L52">código</a>                              |

