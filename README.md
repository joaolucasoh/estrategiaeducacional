# QA Engineer Challenge - Prática

## Instalando dependências para rodar o projeto

Antes de clonar o projeto, precisamos garantir que algumas dependências estejam instaladas em sua máquina.

Basicamente precisamos instalar:

* Ruby
* vscode
* chromedriver

## Tecnologias Utilizadas
O projeto utiliza as seguintes tecnologias:

* Ruby, Cucumber e Capybara

### Em cada link contém o passo a passo para instalação/download dos pré-requisitos:

* [Ruby](https://www.ruby-lang.org/pt/documentation/installation/) - versão utilizada no projeto 2.6.3
* [VScode](https://code.visualstudio.com/) - a 'ide' é bem particular, tem que curta o Sublime, Eclipse, Ruby Mine e etc.
* [Chromedriver](https://chromedriver.chromium.org/downloads) - a versão tem que estar de acordo com a versão do chrome.

### Clone o projeto:

https://github.com/joaolucasoh/estrategiaeducacional.git

### Primeiros passos:

Após instalar ruby e cia, em seu terminal de preferência digite os seguintes comandos:
  <b>gem install bundler</b>

Acessando a pasta do projeto já clonado, digitar o seguinte comando:
  <b>bundle install</b>

Todas gems contidas no arquivo Gemfile foram instaladas. :)

### Como rodar meus cenários?
* cucumber (roda todos cenários)
* cucumber <b>-t @nome_do_cenario</b> (roda um cenário em especifico de acordo com a tag)

### Pasta Log

A pasta log contém os reports após as execuções e um arquivo bugs.txt contendo sugestão de bugs e possíveis melhorias.