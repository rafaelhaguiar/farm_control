# farm_control


Informaões:

    - App feito utilizando Flutter 3.13.6 e Dart 3.1.3;
    - Optei por não restringir como UNIQUE as TAGs por entender que dependendo do cenário tags podem ser reutilizados (pensando por exemplo se a tag for um RING RFID);
    - Criei script para que o App já tenha alguns dados populados no banco conforme: farm\assets\sql;
    - Adicionei recursos de internacionalização suporte Português e Inglês.


Pontos do desafio:
✅ - Tebelas com relacionamentos
✅ - CRUD de animais: Create na tela de criação, Read na Home e tela de Pesquisa, Update e Delete na tela do Animal selecionado,
✅ - Cadastramento em lote, INSERT configurado com TRANSACTION,
✅ - Contador de animais na Home com reatividade quando da remoção ou adiação de animais a partir de outras telas,
✅ - Testes unitário: Feitos.


Arquitetura do Projetos:

    O projeto implementa arquitetura limpa, onde temos as seguintes camadas:

    Domain: Camada responsável por armazenar nossos casos de usos e entidades, esta camada esta organizada para representar unidades de dominio como: Animais, fazendas e etc.

    Data: Camada responsável por armazenas nossos datasources, models e implementações do repositórios, assim como a camada acima esta camada esta organizada em unidades lógicas de dominio.

    Presenter: Camada responsável por armazenar nossos componentes de UI e gerenciadores de estado, esta camada esta organizada em agrupamentos de componentes de tela como home, farm e etc.


Recursos utilizados:
    Banco de dados: Sqflite.
    Gerência de estados:
    - Flutter Bloc para casos mais complexos;
    - ValueNotifer para coisas mais simples em memória.
    Flutter intl: Internacionazalição: Suporte a português e inglês.
    Testes: Mocktail.



