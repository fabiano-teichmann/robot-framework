*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://automationpractice.com
${BROWSER}  firefox

*** Keywords ***
Abrir navegador
    Open Browser    about:blank   ${BROWSER}


Fechar navegador
    Close Browser

Acessar página home do site
    Go To               ${URL}
    Title Should be     My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisar
    Input Text  id=search_query_top  ${PRODUTO}

Clicar no botão pesquisar
    Click Element   name=submit_search


Conferir se o produto "${PRODUTO}" foi listado no site
    wait until Element Is visible   css=#center_column > h1
    Title Should Be     Search - My Store
    Page Should Contain Image   xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Page Should Contain Link    xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"Blouse")]

Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be          xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    ${MENSAGEM_ALERTA}
    Element Text Should Be          xpath=//*[@id="center_column"]/h1/span      0 results have been found.