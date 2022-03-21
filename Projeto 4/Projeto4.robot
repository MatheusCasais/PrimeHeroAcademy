****settings***
Library        SeleniumLibrary
Library        FakerLibrary
Test Setup     Abrir o navegador   
Test Teardown  fechar o navegador

*** Variables ***
${BROWSER}          chrome
${URL}              http://automationpractice.com

*** Test Cases ***
caso de teste 01 : acessar a pagina home do site
    Acessar a página home do site Automation Practice
    clicar em "Sign-in"
    informar um e-mail válido
    clicar em "create an account"
    preencher os dados obrigatorios
    finalizando cadastro

*** Keywords ***
###setup
abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    
    ### Teardown
fechar o navegador
    Close Browser

acessar a página home do site Automation Practice
    Go To                               ${URL}
    Wait Until Element Is Visible       xpath=//*[@id="block_top_menu"]/ul
    Title Should Be                     My Store

Clicar em "Sign-in"
    Click Element                       xpath=//*[@title="Log in to your customer account"]
    Wait Until Element Is Visible       xpath=//*[@id="create-account_form"]

informar um e-mail válido
    ${EMAIL}            FakerLibrary.email
        Input Text                          //*[@id="email_create"]               ${EMAIL}

clicar em "create an account"
    Click Element                       xpath=//*[@class="icon-user left"]
    Wait Until Element Is Visible       xpath=//*[@class="page-heading"]
    Sleep    5s
    
preencher os dados obrigatorios
    ${NAME}             FakerLibrary.name
    ${LASTNAME}         FakerLibrary.lastname
    ${PASSWORD}         FakerLibrary.password
    ${RUA}              FakerLibrary.Address
    ${CIDADE}           FakerLibrary.City
    ${CODIGOPOSTAL}     FakerLibrary.Postalcode
    ${CELULAR}          FakerLibrary.Phone Number
    ${EMAIL}            FakerLibrary.email
    #nome
    Input Text                          xpath=//*[@id="customer_firstname"]   ${NAME}
    Input Text                          xpath=//*[@id="firstname"]            ${NAME}
    #################################################################################

    #sobrenome
    Input Text                          xpath=//*[@id="customer_lastname"]    ${LASTNAME}
    Input Text                          xpath=//*[@id="lastname"]             ${LASTNAME}
    #################################################################################

    #email
    Input Text                          xpath=//*[@id="email"]                ${EMAIL}
    #################################################################################

    #senha
    Input Password                      xpath=//*[@id="passwd"]               ${PASSWORD} 
    #################################################################################
    
    #endereco
    Input Text                          xpath=//*[@id="address1"]          ${RUA} 
    Input Text                          xpath=//*[@id="city"]                 ${CIDADE}
    Select From List By Index           xpath=//*[@id="id_state"]             44
    Input Text                          xpath=//*[@id="postcode"]             ${CODIGOPOSTAL}
    Select From List By Index           xpath=//*[@id="id_country"]            1
    Input Text                          xpath=//*[@id="alias"]                ${RUA}            
    #################################################################################
    #TELEFONE/CELULAR
    Input Text                          xpath=//*[@id="phone_mobile"]         ${CELULAR}
    #################################################################################

finalizando cadastro
    Click Button                        xpath=//*[@id="submitAccount"]
    Wait Until Element Is Visible       xpath=//*[@id="center_column"]
       
