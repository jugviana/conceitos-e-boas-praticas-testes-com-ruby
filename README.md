# Conceitos e Boas Práticas de Testes utilizando a Linguagem Ruby

## Introdução

Este projeto foi criado com a intenção de disseminar conceitos de implementação de testes utilizando a linguagem Ruby e suas bibliotecas.
Nele você encontrará explicações dos principais conceitos e implementações didáticas sobre a aplicação detes conceitos.

A biblioteca de testes escolhida para a execução dos testes foi a [Rspec](https://rspec.info/) devido sua alta adoção dentro da comunidade de desenvolvedores e de empresas que utilizam [Ruby](https://www.ruby-lang.org/pt/) como linguagem de programação.

Os testes elaborados neste projeto foram baseados em diversas fontes de estudo e deve continuar crescendo conforme o projeto trouxer mais informações sobre o tema.

-------------

## Índice
- [Fontes de estudo](#fontes-de-estudo)
- [Como executar o projeto](#como-executar-o-projeto)
- [Como a implementação do código está dividida](#como-a-implementacao-do-codigo-esta-divida)
- [Como a implementação dos testes está dividida](#como-a-implementacao-dos-testes-esta-divida)
- [Como posso aprender com o projeto](#como-posso-aprender-com-o-projeto)
- [Qual o foco dos testes de cada camada](#qual-o-foco-dos-testes-de-cada-camada)

-------------

<a id="fontes-de-estudo"></a>

## Fontes de estudo

- [Tipos e Níveis de Teste](https://medium.com/@ingrid.carvalho.mo/tipos-e-n%C3%ADveis-de-teste-faa9ae13861c)
- [Os Diferentes Tipos de Testes](https://medium.com/elefante-yogue/m1-aula-1-os-diferentes-tipos-de-testes-8943dfe1c476)
- [Principais Tipos de Teste de Software](https://medium.com/@anne_caroline/principais-tipos-de-teste-de-software-4aeeb7fd23f1)
- [Testes Unitários 101: Mocks, Stubs, Spies e todas essas palavras difíceis](https://medium.com/trainingcenter/testes-unit%C3%A1rios-mocks-stubs-spies-e-todas-essas-palavras-dif%C3%ADceis-f2765ac87cc8#:~:text=Um%20stub%20%C3%A9%20uma%20evolu%C3%A7%C3%A3o,chamada%20a%20uma%20API%20externa)
- [Abordagem de testes](https://medium.com/assertqualityassurance/abordagem-de-testes-212b6238f0c3)

-------------

<a id="como-executar-o-projeto"></a>

## Como executar o projeto

### Requisitos
1. [Bundler](https://bundler.io/)
2. [Linguagem Ruby](https://www.ruby-lang.org/pt/) a partir da versão 2.5.1

### Instalação das dependências
1. Executar comando: `bundle install`

### Execução dos testes
- Para executar todos os testes utilizar o comando `rspec`
- Para executar testes de apenas um arquivo de testes execute: `rspec <caminho relativo do arquivo>`. **Exemplo**: `rspec spec/integracao/cliente_controller_spec`

-------------

<a id="como-a-implementacao-do-codigo-esta-divida"></a>

## Como a implementação do código está dividida
Este projeto foi inspirado em uma implementação de API sem necessariamente respeitar todas as boas práticas de códificação para favorecer a didática do aprendizado dos conceitos de testes.

Para ter foco na didática e manter-se simples, este projeto tentou utilizar o mínimo de bibliotecas possíveis e criou camadas para forçar cenários de estudo.

Sendo assim, foram criadas 5 camadas:

### Controllers
Camada responsável por capitar a chamada externa, a tal requisição (request) de uma API.

### Validators
Camada com objetivo de validar dados vindo da chamada da API, via Controller.

### Repositories
Camada responsável para a manipulação de dados, seja simulando um banco de dados, uma chamada de API e até mesmo manipulação de arquivo. Num primeiro momento não importa a origem do dado e sim que esta camada é responsável por isso. Didaticamente, muitos destes dados podem estar sendo apenas simulados.

### Models
Esta camada representa as entidades do negócio, o alvo do tratamento da API. É a representação daquilo que se quer manipular do ponto de vista de neǵocio.

### Serializers
Sua responsabilidade é tratar os dados de saída em uma Controller. É esta camada que se preocupa em como os dados devem ser retornados ao ambiente externo da API.

-------------

<a id="como-a-implementacao-dos-testes-esta-divida"></a>

## Como a implementação dos testes está dividida
Todos os testes implementados estão dentro do diretório `spec` e existem 2 divisões didaticamente criadas:

### Integração
Aqui encontram-se os testes de integração que, de maneira simples, são teses que propositalmente não causam desvios em chamadas externas ao método testado a não ser que sejam recursos externos inalcansavéis ou inviáveis de alcançar.

Em outras palavras, este tipo de teste vai percorrer sua excução pelo código interno do projeto da sua chamada até seu retorno sem desvios.

Mais sobre testes de integração, na seção [Fontes de estudo](#fontes-de-estudo).

### Unitário
Nesta divisão serão encontrados os testes unitários ou testes de unidade. São testes que testam de maneira isolada apenas o conteúdo do método em questão. Com isso, são provocados desvios (*mocks*) para as chamadas externas ao método testado.

Aqui o objetivo principal é realizar testes profundos dentro do objetivo estabelecido no método.

Mais sobre testes de unitários, na seção [Fontes de estudo](#fontes-de-estudo).

<a id="como-posso-aprender-com-o-projeto"></a>

## Como posso aprender com o projeto
Acredito que  este projeto contenha diversas informações interessantes para o aprendizado sobre testes, porém é importante que exista algum roteiro para melhor aproveitá-lo. Então vai aqui uma indicação, especialmente se você sabe bem pouco sobre os temas abordados neste projeto.

1. **Leia as [Fontes de estudo](#fontes-de-estudo)**

As fontes indicadas neste documento contém bastante conhecimento básico e até avançado sobre o tema. Há conteúdos conceituais bem importantes e até exemplos bem legais sobre o assunto, além de vídeos. Então vale muito a pena começar consumindo-os.

2. **Entenda a implementação do projeto**

Para que os testes sejam realizados da maneira correta, precisamos entender quais são as regras estabelecidas pelo negócio. No caso deste projeto, é importante entender estas regras pela leitura da própria implementação. 
Então a dica aqui é tentar entender o que o código faz começando a leitura por um método de alguma classe Controller e ir aprofundando até a execução da Controller terminar em seu retorno ao mundo exterior.

3. **Entenda os testes de integração**

Agora que entendeu as regras de implementação do projeto, vale começar lendo o teste de integraçao correspondente ao método estudado.
Leia todas as condições de testes do método em questão e entenda o porquê de cada checagem e em quais camadas a execução entrou.
Realize a execução dos testes e perceba a exibição de algumas mensagens espalhadas pelo código para tentar exibir por onde a *execução* passou.

4. **Entenda os testes unitários**

Dado que você entendeu todas as passagens dos testes de integração, agora é importante o entendimento dos testes unitários. Perceba as passagens de verificação do método testado e quais os desvios (*mocks*) feitos para que o teste não seja dependente de chamadas externas ao método testado.
Perceba, também, que a rigorosidade dos testes unitários perante as checagens é diferente dos testes integrados.

<a id="qual-o-foco-dos-testes-de-cada-camada"></a>

## Qual o foco dos testes de cada camada
Os testes de cada camada da aplicação tem um foco de verificação.

### Controllers
De acordo com os parâmetros de entrada checar as saídas possíveis. Se houver regras de negócios implementadas nesta camada, as mesmas devem ser checadas através de contextos de testes apropriados.

### Validators
Dado os parâmetros de entrada checar todos os pontos de validações possíveis e os erros esperados. Também deve-se checar o contexto de sucesso da validação e seu retorno.

### Repositories
Dado o conjunto de informações validar se as manipulações previstas foram atendidas ou mesmo validar os erros esperados. Neste tipo de teste é comum criar desvios para não depender da existência de base de dados (banco de dados, arquivo, APIs).

### Serializers
Validar o formato das saídas previstas e suas variações.

--------------------------
