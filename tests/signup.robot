*** Settings ***
Documentation       Cenarios de pre-cadatro de clientes

Library           Browser

Resource          ../resources/base.resource


*** Test Cases ***
Deve iniciar o cadatro de cliente
    
    ${account} =    Get Fake Account

    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000
    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=email    ${account}[email]
    Fill Text    id=document    ${account}[document]

    Click    css=button >> text=Cadastrar

    Wait For Elements State    
    ...    text=Falta pouco para fazer parte da família Smartbit!    
    ...    visible    5


Campo nome é obrigatório
    [Tags]    required
    ${account} =    Get Fake Account

    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000
    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=email    ${account}[email]
    Fill Text    id=document    ${account}[document]

    Click    css=button >> text=Cadastrar

    Wait For Elements State    
    ...    css=form .notice
    ...    visible    5

    Get Text    css=form .notice    equal    Por favor informe o seu nome completo



Campo email é obrigatório
    [Tags]    required
    ${account} =    Get Fake Account

    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000
    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=document    ${account}[document]

    Click    css=button >> text=Cadastrar

    Wait For Elements State    
    ...    css=form .notice
    ...    visible    5

    Get Text    css=form .notice    equal    Por favor, informe o seu melhor e-mail


Campo CPF é obrigatório
    [Tags]    required
    ${account} =    Get Fake Account

    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000
    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=email    ${account}[email]

    Click    css=button >> text=Cadastrar

    Wait For Elements State    
    ...    css=form .notice
    ...    visible    5

    Get Text    css=form .notice    equal    Por favor, informe o seu CPF


Campo email invalido
    [Tags]    inv
    ${account} =    Get Fake Account

    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000
    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=email    isaltina.pepete@    # email invalido
    Fill Text    id=document    ${account}[document]

    Click    css=button >> text=Cadastrar

    Wait For Elements State    
    ...    css=form .notice
    ...    visible    5

    Get Text    css=form .notice    equal    Oops! O email informado é inválido


CPF invalido
    [Tags]    inv
    ${account} =    Get Fake Account

    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000
    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=email    ${account}[email]
    Fill Text    id=document    123.456.789-00    # CPF inválido

    Click    css=button >> text=Cadastrar

    Wait For Elements State    
    ...    css=form .notice
    ...    visible    5

    Get Text    css=form .notice    equal    Oops! O CPF informado é inválido




