*** Settings ***
Library  Selenium

*** Variables ***
${URL}      http://automationpractice.com/
${BROWSER}      firefox

*** Keywords ***
Abrir navegador
    Open Browser    ${URL} ${BROWSER}

Fechar navegador
    Close Browser

