*Settings*
Documentation       Suite de teste do cadastro de personagens na API da Marvel


Library                RequestsLibrary
Library                Collections    
Resource               ${EXECDIR}/resources/Base.robot                                                                           
Library                ${EXECDIR}/resources/factories/Thanos.py                                                                            


*Test Cases*
Deve cadastrar um personagem 

    Set Client Key     laylla1@gmail.com

    &{personagem}       Factory Thanos

    ${response}     POST
    ...             ${BASE_URI}/characters/
    ...             json=${personagem}
    ...             headers=${headers}
    ...             expected_status=any  


    Status Should Be        200        ${response}

Não deve cadastrar com o mesmo nome

    # Dado que Thanos ja existe no sistema

    ${personagem}       Factory Thanos

    POST        ${BASE_URI}/characters
    ...         json=${personagem}
    ...         headers=${HEADERS}
    ...         expected_status=any  


    # Quando faço uma requisição POST para a rota characters

    ${response}     POST
    ...             ${BASE_URI}/characters/
    ...             json=${personagem}
    ...             headers=${headers}
    ...             expected_status=any  

    # Então o código de retorno deve ser 409
    
    Status Should Be        409        ${response}



