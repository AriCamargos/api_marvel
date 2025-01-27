# Projeto Marvel API

Este é um projeto que utiliza a **Marvel API** para exibir informações sobre personagens, quadrinhos, e outras entidades do universo Marvel.

## Funcionalidades

- Exibe uma lista de personagens da Marvel.
- Mostra detalhes de cada personagem selecionado.
- Integração com a API da Marvel para buscar dados em tempo real.
- Exibe informações sobre biografia do personagem, nome, e imagens.

## Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento mobile (Android/iOS).
- **Marvel API**: API pública da Marvel para acessar informações sobre personagens, quadrinhos, e muito mais.
- **Dart**: Linguagem de programação utilizada no Flutter.

## Como Instalar e Configurar

### 1. Clone o Repositório

Clone o repositório para sua máquina local usando o seguinte comando:

git clone https://github.com/usuário/nome-do-repositorio.git
cd nome-do-repositorio

### 2. Instale as Dependências
Caso esteja utilizando Flutter, basta executar o comando abaixo para instalar as dependências:

flutter pub get
Se estiver usando Node.js ou outra stack backend, siga as instruções específicas dessa tecnologia para instalar as dependências.

### 3. Obtenha uma Chave de API da Marvel
Para poder consumir dados da API da Marvel, você precisa de uma chave de API. Siga os passos abaixo para obter sua chave:

1. Acesse Marvel Developer e crie uma conta.
2. Após se registrar, vá para Account Settings e gere uma chave de API (API Key).
3. Copie a chave gerada.
   
### 4. Configure a API Key
Agora que você tem a chave de API, você precisa configurá-la no projeto. Para isso, siga os passos:

Crie uma classe com a chave pra se reutilizada no enpoint, copie o caminho do arquivo no gitignore para que não seja visto
ao subir seu código no github.

Gere a chave ts pelo dartPad; 
Gere a hash Md5 no gerador https://www.md5hashgenerator.com/ inserindo ts+privateKey+publicKey;

### 5. Configuração de API Base URL
Sugiro abrir o Postman ou Insomnia para verificar o retorno da API: 

KEY_TS = gerado pelo dartPad
PRIVATE_KEY = sua chave privada Marvel
HASH_GERADA_PELO_MD5 = hash gerada pelo site https://www.md5hashgenerator.com/ - inserindo ts+privateKey+publicKey;

A URL base da API da Marvel segue o como o passo 4
http://gateway.marvel.com/v1/public/comics?ts=KEY_TS&apikey=PRIVATE_KEY&hash=HASH_GERADA_PELO_MD5

Com essas informações você conseguirá gerar o endpoint com sucesso.

### 6. Rodando o Aplicativo
Agora, você está pronto para rodar o aplicativo localmente.

- Para rodar com Flutter (Android/iOS):
flutter run

Para rodar o aplicativo em um dispositivo ou emulador:

### 7. Testar a API
Após rodar o aplicativo, você deve conseguir visualizar os personagens da Marvel. Caso algum erro ocorra relacionado à API Key ou ao endpoint, verifique a configuração da chave de API e a URL base.

## Versões Utilizadas
Aqui estão as versões das ferramentas e bibliotecas que o projeto utiliza:

Flutter: 3.22.3
Dart: 3.4.4
Marvel API: v1.0 (API pública da Marvel)
- Pacotes Flutter:
- http: ^1.3.0
- crypto: ^3.0.1
- equatable: ^2.0.7
- flutter_modular: ^5.0.3

Licença
Este projeto está licenciado sob a MIT License.
