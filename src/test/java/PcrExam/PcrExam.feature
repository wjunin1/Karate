Feature: test api PCR Exam

  Scenario: API professions
    Given url 'https://api.whenisthenextboardexam.com/exams/upcoming'
    When method Get
    Then status 200

    Scenario: 
      Given


