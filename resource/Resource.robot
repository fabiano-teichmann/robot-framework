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

