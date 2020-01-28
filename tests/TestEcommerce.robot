*** Settings ***
Resource  ../resource/Resource.robot
Suite Setup     Abrir navegador
Suite Setup     Fechar navegador


*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente
    Acessar página home do site
    Conferir se a página home foi exibida
    Digitar o nome do produto "Blouse" no campo de pesquisar
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    Acessar página home do site
    Conferir se a página home foi exibida
    Digitar o nome do produto "Produto não existe" no campo de pesquisar
    Clicar no botão pesquisar
    Conferir a mensagem de erro "No results were found for your search "Produto não existe""


*** Keywords ***

