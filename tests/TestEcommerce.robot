*** Settings ***
Resource  ../resource/Resource.robot
Suite Setup     Abrir navegador
#Suite Teardown  Fechar navegador


*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente
    Acessar página home do site
    Digitar o nome do produto "Blouse" no campo de pesquisar
    Clicar no botão pesquisar
#    Conferir se o produto "Blouse" foi listado no site
#
#Caso de Teste 02: Pesquisar produto não existente
#    Acessar página home do site
#    Digitar o nome do produto "Produto não existe" no campo de pesquisar
#    Clicar no botão pesquisar
#    Conferir a mensagem de erro "No results were found for your search "Produto não existe""


*** Keywords ***

