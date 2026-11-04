*** Settings ***
Documentation       Cenarios de pre-cadatro de clientes

Library           Browser

Resource          ../resources/base.resource


*** Test Cases ***
Deve iniciar o cadatro de cliente
    
    ${account} =    Get Fake Account

    Start Session
    submit signup form    ${account}

    Wait For Elements State    
    ...    text=Falta pouco para fazer parte da família Smartbit!    
    ...    visible    5

Campo nome é obrigatório
    [Tags]    required
    ${account}    Create Dictionary    
    ...    name=${EMPTY}
    ...    email=isaltinabrizito@gmail.com
    ...    cpf=97250598082

    Start Session
    submit signup form    ${account}
    Notice should be    Por favor informe o seu nome completo

Campo email é obrigatório
    [Tags]    required
    ${account}    Create Dictionary    
    ...    name=Isaltina Pepete    
    ...    email=${EMPTY}    
    ...    cpf=97250598082

    Start Session
    submit signup form    ${account}
    Notice should be    Por favor, informe o seu melhor e-mail

Campo CPF é obrigatório
    [Tags]    required
    ${account}    Create Dictionary    
    ...    name=Isaltina Pepete
    ...    email=isaltinabrizito@gmail.com    
    ...    cpf=${EMPTY}

    Start Session
    submit signup form    ${account}
    Notice should be    Por favor, informe o seu CPF

Campo email invalido
    [Tags]    inv
    ${account}    Create Dictionary    
    ...    name=Isaltina Pepete
    ...    email=isaltina.pepete@    # email invalido
    ...    cpf=97250598082

    Start Session
    submit signup form    ${account}
    Notice should be    Oops! O email informado é inválido


CPF invalido
    [Tags]    inv
    ${account}    Create Dictionary    
    ...    name=Isaltina Pepete
    ...    email=isaltinabrizito@gmail.com
    ...    cpf=123.456.789-00    # CPF inválido

    Start Session    
    Submit signup form    ${account}
    Notice should be    Oops! O CPF informado é inválido


*** Keywords ***

Start Session
    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000

Submit signup form

    [Arguments]    ${account}

    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=email    ${account}[email]
    Fill Text    id=cpf    ${account}[cpf]

    Click    css=button >> text=Cadastrar

Notice should be
    [Arguments]    ${message}

    ${element}    Set Variable     css=form .notice
    Wait For Elements State    
    ...    ${element}
    ...    visible    5

    Get Text    ${element}    equal    ${message}