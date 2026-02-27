Feature: Pruebas de API de Registro y Login para Demoblaze

  Background:
    * url 'https://api.demoblaze.com'
    # Generamos un usuario aleatorio para garantizar que la creación sea exitosa
    * def randomUser = 'testuser_' + java.util.UUID.randomUUID().toString()
    * def existingUser = 'usuario_existente_12345'
    * def defaultPassword = 'password123'

  Scenario: 1. Crear un nuevo usuario en signup
    Given path 'signup'
    And request { username: '#(randomUser)', password: '#(defaultPassword)' }
    When method POST
    Then status 200
    And print 'string vacío cuando la creación es exitosa'
    And print 'Respuesta de creación exitosa: ', response

  Scenario: 2. Intentar crear un usuario ya existente
    Given path 'signup'
    And request { username: '#(existingUser)', password: '#(defaultPassword)' }
    When method POST
    And print 'Ahora intentamos crearlo de nuevo para forzar el error'
    Given path 'signup'
    And request { username: '#(existingUser)', password: '#(defaultPassword)' }
    When method POST
    Then status 200
    And match response.errorMessage == 'This user already exist.'
    And print 'Respuesta de usuario ya existente: ', response

  Scenario: 3. Usuario y password correcto en login
    Given path 'login'
    And request { username: '#(existingUser)', password: '#(defaultPassword)' }
    When method POST
    Then status 200
    And match response contains 'Auth_token:'
    And print ' SESION INICIADA YA QUE GENERA TOKEN '
    And print 'Token de acceso generado: ', response

  Scenario: 4. Usuario y password incorrecto en login
    Given path 'login'
    And request { username: '#(existingUser)', password: 'clave_equivocada' }
    When method POST
    Then status 200
    And match response.errorMessage == 'Wrong password.'
    And print ' ERROR POR CREDENCIALES '
    And print 'Respuesta de credenciales incorrectas: ', response