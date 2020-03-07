# Projetos de Estudo com Flutter
Este repositório é um conjunto de pequenos apps desenvolvidos durante o curso [**A Complete Guide to the Flutter SDK & Flutter Framework**](https://www.udemy.com/share/1013o4BEccdllXR3o=/), realizado dentro da plataforma Udemy. 

No decorrer do curso foram desenvolvidos 06 pequenos apps com intuito de demonstrar e praticar conceitos sobre a linguagem Dart e o framework Flutter.

## Sobre os projetos
Todos os projetos foram desenvolvidos no decorrer do curso, alguns projetos se extendiam por mais de um módulo, e a evolução de cada app pode ser acompanhada pelos commits deste repositório, que numera a aula de inicio e fim realizada. 

Dentro da pasta de cada app há uma pasta ```/images``` contendo prints das telas.

Abaixo um breve descritivo de cada projeto e quais os principais assuntos abordados durante o desenvolvimento.

### Flutter Basics
  Nome da pasta: flutter_basics
  
  Este app trata-se de um quiz, com uma pergunta e 4 opcões de resposta. Sendo que ao final é exibido um 'score' das respostas do usuário e uma opção para reiniciar o questionario. É um app simples, utilizado principalmente para ensinar os conceitos básicos da linguagem e como o Flutter funciona, utilizando o Dart;
  
  Conceitos abordados:
  
    1. Estrutura da linguagem (classes, funções, tipos, objetos, condicionais, loops, etc);
    2. Widgets & Statefull e Stateless;
    3. Maps e Lists em Dart;
    4. DartDevTools e Emuladores.

### Flutter Expenses (Widgets)
  Nome da pasta: flutter_widgets_expenses
  
  Um app que realiza o registro dos gastos pessoais no período de uma semana, nele é possível cadastrar uma despesa e ao registra-la o gráfico semanal é atualizado automaticamente.
  
  Conceitos abordados:
  
    1. Principais widgets do Flutter (Columns, Rows, Containers, Buttons, Scrollables, Images, etc);
    2. Ciclo de vida do widget;
    3. Estilização e layout dos widgets (cores, alinhamento, tamanhos, margens, paddings, etc);
    4. Tema da aplição (cores principais e uso de fontes externas)
    5. Instalação de pacotes externos;
    6. Inputs de texto e data;
    7. Reagindo a interações do usuário;
    8. Layout Responsivo e Adaptativo;
    9. Widgets especificos iOS e Android.
    
### Flutter Meals (Navegaçao)
  Nome da pasta: flutter_navigation_meals
  
  Um app que contém uma série de receitas, separadas por categorias, e as exibe, mostrando os ingredientes e passo-a-passo da receita. É possível "favoritar" as receitas, que aparecem em uma aba separada após a seleção. Tambem há um menu lateral que permite acesso as configuracoes do app, onde é possivel incluir filtros para as receitas que aparecem na tela principal. Os dados utilizados neste app são todos estáticos, armazenados dentro do próprio projeto.
  
  Conceitos abordados:
  
    1. Telas, rotas e navegação;
    2. Registro de rotas da aplição (named routes) e rotas criadas em execução (on the fly);
    3. Transfêrencia de dados entre telas;
    3. Widgets relacionados a navegação (Tabs, TabBar, Bottom TabBar, Drawer)
    4. Novos widgets e mais estilização;
  
### Flutter Shop (Gerenciamento de Estado/State Management)
  Nome da pasta: flutter_state_shop
  
  Um app simulando o funcionamento de uma loja, onde é possível visualizar, cadastrar e criar pedidos de produtos. Assim como uma loja é necessária a autenticação do usuário. Neste app, como no anterior, e possível marcar produtos como favoritos e filtrar os itens que aparecem na tela inicial. Neste app é utilizado o Google Firebase como banco de dados/api;
  
  Conceitos abordados:
  
    1. Novos widgets e mais estilização;
    2. Navegação entre telas;
    3. Pacote Provider e gerenciamento de estados da aplicação;
    4. Formulários, inputs do usuário e validação;
    5. Requisições HTTP (pacote http);
    6. Futures e Async & Await;
    7. Tratamento de exceções;
    8. Interface Otimista (Optimistic UI);
    9. Autenticação de usuarios;
    10. Animações (manuais e com widgets do Flutter);
    
### Flutter Places (Funcionalidades do Disposito)
  Nome da pasta: flutter_native_code
  
  Um app criado para utilizar funcionalidades do aparelho celular, neste caso a câmera e o GPS. Trata-se de um app que permite cadastrar locais favoritos, incluindo um título, imagem e localização. Nesta aplicação as informações do aplicativo são armazenadas numa base de dados da própria aplicação utilizando SQLite.
  
  Conceitos abordados:
  
    1. Utilizacao da câmera e acesso à galeria de imagens do dispositivo;
    2. SQLite;
    3. Utilizacao do GPS;
    4. Google Maps;
    5. Nome do app, icone e splash screen;
  
### Flutter Battery (Código Nativo)
  Nome da pasta: flutter_native_code
  
  Um app simples que mostra o nível de bateria do dispositivo, utilizando Java e Swift, linguagem nativa dos sistemas Android e iOS, respectivamente. O exemplo foi retirado diretamente da documentação do Flutter;
  
  Conceitos abordados:
  
    1. Integração de código nativo com Flutter;
