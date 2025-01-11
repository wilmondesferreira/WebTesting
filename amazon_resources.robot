*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                          https://www.amazon.com.br/
${MENU_ELETRONICOS}             //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')] 
${BARRA_DE_PESQUISA}            //input[contains(@type,'text')]
${HEADER_ELETRONICOS}          (//h2[contains(.,'Eletrônicos e Tecnologia')])[1]
${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia   

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Sleep    10s
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS} 

Verificar se aparece a frase "${frase}"
    Wait Until Page Contains    text=${frase} 
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITLE_PAGE}"
    Title Should Be    title=${TITLE_PAGE}

Verificar se aparece a categoria "${CATEGORIA}"
    Element Should Be Visible    locator=//span[@class='dcl-truncate'][contains(.,'${CATEGORIA}')]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}
 
Clicar no botão de pesquisa
    Click Button    locator=nav-search-submit-button

Verificar o resultado da pesquisa se esta listando o produto "${PRODUTO}"
    Wait Until Element Contains   locator=//span[contains(@data-component-type,'s-search-results')]    text=${PRODUTO}

# GHERKIN STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

E a categoria "Celulares e Comunicação"   
    Verificar se aparece a categoria "Celulares e Comunicação"
    
Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"
    
E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se esta listando o produto "Xbox Series S"


