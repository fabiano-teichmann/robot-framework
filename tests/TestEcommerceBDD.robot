*** Settings ***
Resource  ../resource/Resource.robot
Suite Setup     Abrir navegador
Suite Teardown  Fechar navegador

*** Variables ***

${URL}  http://automationpractice.com
${BROWSER}  chrome

*** Test Cases ***
Cenario 01: Pesquisar produto existente

    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado da busca


Cenário 02: Pesquisar produto não existente

    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Produto não existe"
    Então a página deve exibir a mensagem "No results were found for your search "Produto não existe""


*** Keywords ***
Dado que estou na página home do site
    Acessar página home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisar
    Clicar no botão pesquisar

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Conferir se o produto "${PRODUTO}" foi listado no site

Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
    Conferir mensagem de erro "${MENSAGEM_ALERTA}"


