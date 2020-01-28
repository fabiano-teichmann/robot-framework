*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://automationpractice.com
${BROWSER}  firefox

*** Keywords ***
Abrir navegador
    Open Browser    ${URL}  ${BROWSER}


Fechar navegador
    Close Browser

Acessar página home do site
    Title Should be     My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisar
    Input Text  id=search_query_top  ${PRODUTO}

Clicar no botão pesquisar
    Click Element   name=submit_search


