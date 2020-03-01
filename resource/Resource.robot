*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://automationpractice.com
${BROWSER}  chrome

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

Clicar no botão "${NAME}"
    Click Element   name=${NAME}

Clicar no botão carrinho
    Click Element   xpath=//*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]

Quando clicar no botão "Proceed to checkout"
    Click Element   xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a


Conferir se o produto "${PRODUTO}" foi listado no site
    wait until Element Is visible   css=#center_column > h1
    Title Should Be     Search - My Store
    Page Should Contain Link    xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]

Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be          xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    ${MENSAGEM_ALERTA}
    Element Text Should Be          xpath=//*[@id="center_column"]/h1/span      0 results have been found.

Quando passar o mouse na categoria "${CATEGORIA}"
    Wait Until Element is Visible   xpath=//*[@id="block_top_menu"]/ul//a[contains(text(),"Women")]
    Set Focus To Element            xpath=//*[@id="block_top_menu"]/ul//a[contains(text(),"Women")]
    Element Text Should Be          xpath=//*[@id="block_top_menu"]/ul//a[contains(text(),"Women")]    ${CATEGORIA}

Então as sub categorias devem ser exibidas
    Wait Until Element is Visible   xpath=//*[@id="block_top_menu"]/ul//a[contains(text(),"Women")]
    Element Should Be Visible    xpath=//*[@id="block_top_menu"]/ul/li[1]/ul//a[contains(text(), "Tops")]

Quando clicar na sub categoria "${SUB_CATEGORIA}"
    Wait Until Element is Visible   xpath=//*[@id="block_top_menu"]/ul/li[1]/ul//a[contains(text(), "Tops")]
    Click Link  xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a[contains(text(),"${SUB_CATEGORIA}")]

Então uma página com os produtos da sub categoria "${SUB CATEGORIA}" deve ser exibida
    Element Text Should Be  class=category-name    Summer Dresses

Então uma tela de confirmação deve ser exibida
    Wait Until Element is Visible    xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span[contains(text(), "Proceed to checkout")]
    Element Text Should Be  xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span    Proceed to checkout

Então a tela do carrinho de compras deve ser exibido, juntamente com os dados do produto adicionado e os devidos valores
    Wait Until Element is Visible       xpath=//*[@id="center_column"]/p[2]/a[1]/span
    Element Text Should Be      class=heading-counter   Your shopping cart contains: 1 Product
    Element Text Should Be      xpath=//*[@id="product_1_1_0_0"]/td[2]/p/a   Faded Short Sleeve T-shirts
    Element Text Should Be      id=total_price   $18.51

