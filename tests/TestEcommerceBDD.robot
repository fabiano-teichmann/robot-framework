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

Cenário 03: Listar Produtos
    Dado que estou na página home do site
    Quando passar o mouse na categoria "WOMEN"
    Então as sub categorias devem ser exibidas
    Quando clicar na sub categoria "Summer Dresses"
    Então uma página com os produtos da sub categoria "Summer Dresses" deve ser exibida
    

Cenário 04: Adicionar Produtos no Carrinho
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "t-shirt"
    Então o produto "Faded Short Sleeve T-shirts" deve ser listado na página de resultado da busca
    Clicar no botão "Add to cart" do produto
    Então uma tela de confirmação deve ser exibida
    Quando clicar no botão "Proceed to checkout"
    Então a tela do carrinho de compras deve ser exibido, juntamente com os dados do produto adicionado e os devidos valores

*** Keywords ***
Dado que estou na página home do site
    Acessar página home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisar
    Clicar no botão "submit_search"

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Conferir se o produto "${PRODUTO}" foi listado no site

Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
    Conferir mensagem de erro "${MENSAGEM_ALERTA}"

Clicar no botão "${BUTTON}" do produto
    Clicar no botão carrinho


