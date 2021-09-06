*Settings*
Documentation           Ações da rota /characters


*Keywords*
POST New Character
    [Arguments]     ${payload}

    ${response}    POST
    ...            ${API_URL}/characters
    ...            json=${payload}
    ...            headers=${HEADERS}
    ...            expected_status=any

    [return]       ${response}  

GET Character By Id
    [Arguments]         ${character_id}

    ${response}     GET
    ...             ${API_URL}/characters/${character_id}
    ...             headers=${HEADERS}
    ...             expected_status=any

    [return]        ${response}

DELETE Character By Id
    [Arguments]         ${character_id}

    ${response}     DELETE
    ...             ${API_URL}/characters/${character_id}
    ...             headers=${HEADERS}
    ...             expected_status=any

    [return]        ${response}