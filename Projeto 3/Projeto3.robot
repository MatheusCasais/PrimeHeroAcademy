*** Settings ***
Library               SeleniumLibrary
Test Setup            abrir o navegador
Test Teardown         fechar o navegador
Library    Collections

*** Variables ***
${BROWSER}            chrome
${URL}                http://automationpractice.com 


*** Test Cases ***
cenario de teste 01: Acessar a categoria WOMEN
    Acessar a página home do site Automation Practice
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se os produtos da sub-categoria"Summer Dresses" foram mostrados na página

    
*** Keywords ***
###setup
Abrir o navegador
    Open Browser        browser=${BROWSER}
    Maximize Browser Window
   
### Teardown
Fechar o navegador
    Close Browser

Acessar a página home do site Automation Practice
    Go To               ${URL}
    Wait Until Element Is Visible       xpath=//*[@id="block_top_menu"]/ul
    Title Should Be                     My Store


Passar o mouse por cima da categoria "Women" no menu principal superior de categorias 
    Mouse Over    xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/a
Clicar na sub categoria "Summer Dresses" 
    Wait Until Element Is Visible    xpath=//*[@title="Summer Dresses"]
    Click Element                    xpath=//*[@title="Summer Dresses"]
Conferir se os produtos da sub-categoria"Summer Dresses" foram mostrados na página
    Wait Until Element Is Visible    xpath=/html/body/div/div[2]/div/div[3]/div[2]/ul/li[1]/div/div[1]/div/a[1]/img
    Wait Until Element Is Visible    xpath=/html/body/div/div[2]/div/div[3]/div[2]/ul/li[2]/div/div[1]/div/a[1]/img
    Wait Until Element Is Visible    xpath=/html/body/div/div[2]/div/div[3]/div[2]/ul/li[3]/div/div[1]/div/a[1]/img