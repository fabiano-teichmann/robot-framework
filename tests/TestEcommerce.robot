*** Settings ***
Resource  ../resource/Resource.robot
Suite Setup     Abrir navegador
Suite Teardown  Fechar navegador


*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente
    [Tags]  search_prd
    Acessar página home do site
    Digitar o nome do produto "Blouse" no campo de pesquisar
    Clicar no botão "submit_search"
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    [Tags]  prd_not_exit
    Acessar página home do site
    Digitar o nome do produto "Produto não existe" no campo de pesquisar
    Clicar no botão "submit_search"
    Conferir mensagem de erro "No results were found for your search "Produto não existe""



