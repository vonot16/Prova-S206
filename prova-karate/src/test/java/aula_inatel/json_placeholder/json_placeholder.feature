Feature: Testando resources da API json placeholder

Background: Executa uma vez antes de cada teste
    * def url_base = 'https://gorest.co.in/public/v2'
    * def request_json = read("user_info.json")
    * def acces_token = 'Bearer 1704b2908a4444f437546397eea111ad1a6b47c75db8ae98540e8b03f5103f78'

Scenario: Pegando os usuarios da API
    Given url url_base
    And path '/users'
    When method get
    Then status 200
    And match $ == '#[]'
    And match each $ contains {id: '#number', name: '#string'}

    Scenario: Pegando os posts da API
        Given url url_base
        And path '/posts'
        When method get
        Then status 200
        And match $ == '#[]'

    Scenario: Pegando os usuarios da API
        Given url url_base
        And path '/users'
        When method get
        Then status 200
        And match $ == '#[]'
        And match each $ contains {id: '#number', name: '#string'}

Scenario: Pegando um usuario existente da API
        Given url url_base
        And path '/users/5502'
        When method get
        Then status 200

Scenario Outline: Criando um novo usuario usando o método POST
    Given header Autorizathion = acces_token
    Given url url_base
    And path '/users'
    And request <request_json>
    When method post
    Then status 201
    And match $.id == 3081
    And match $.email == '#string'
    And match $.gender == '#string'
    And match $.status == '#string'
    And match $.name == '#string'

    Examples:
    | request_json | body           |
    | request_json | body de teste  |
    | request_json2| body de teste2 |

