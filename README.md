# Atividade Avaliativa de Requisições em API usando Flutter

Um aplicativo Flutter minimalista que busca informações de usuários a partir da API pública [ReqRes](https://reqres.in). O app permite que o usuário insira um ID (entre 1 e 12) e, ao clicar em "Buscar", exibe os dados do usuário (nome, e-mail e foto) ou uma mensagem de erro caso o ID seja inválido.

## Funcionalidades

- **Busca de Usuário:** O usuário insere um ID (1-12) e o app realiza uma requisição à API.
- **Exibição de Informações:** Se encontrado, o app mostra o nome, e-mail e avatar do usuário.
- **Validação e Tratamento de Erros:** Mensagens apropriadas são exibidas para IDs inválidos e em caso de falha na requisição.

## Tecnologias Utilizadas

- [Flutter](https://flutter.dev/) para desenvolvimento do app.
- [Dart](https://dart.dev/) como linguagem de programação.
- [http](https://pub.dev/packages/http) para realizar requisições HTTP.
- [ReqRes API](https://reqres.in/) para fornecer os dados dos usuários.

## Instalação e Execução

1. **Clone o repositório**

   ```bash
   git clone https://github.com/giulliaVilanova/atividade_avaliativa_02.git
   cd atividade_avaliativa_02
   ```

2. **Instale as dependências**

   Execute o comando abaixo para baixar os pacotes necessários:

   ```bash
   flutter pub get
   ```

3. **Execute o app**

   Utilize o comando abaixo para rodar o aplicativo:

   ```bash
   flutter run
   ```