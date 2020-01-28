*** Settings ***
Resource  ../resource/Resource.robot
Suite Setup     Abrir navegador
Suite Setup     Fechar navegador


*** Test Cases ***
Cenario 01: Pesquisar produto existente

    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado da busca


Cenário 02: Pesquisar produto não existente

    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "produtoNãoExistente"
    Então a página deve exibir a mensagem "No results were found for your search "produtoNãoExistente""


*** Keywords ***

