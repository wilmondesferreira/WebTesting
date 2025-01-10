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
    Sleep    15s
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS} 
Verificar se aparece a frase "${frase}"
    Wait Until Page Contains    text=${frase} 
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}
Verificar se o título da página fica "${TITLE_PAGE}"
    Title Should Be    title=${TITLE_PAGE}
Verificar se aparece a categoria "${CATEGORIA}"
    Element Should Be Visible    locator=//span[@class='dcl-truncate'][contains(.,'Computadores e Informática')]
   