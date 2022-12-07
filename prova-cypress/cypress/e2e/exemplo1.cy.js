/// <reference types="cypress"/>

describe('Criando cenário de teste para o site globalsqa  banking', ()=> {

  it('Caso de teste: Logando)', () => {
    cy.visit('https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login')
    cy.get('.borderM > :nth-child(1) > .btn').click()
    cy.get('#userSelect').select("Harry Potter")
    cy.get('form.ng-valid > .btn').click()
  })


  it('Caso de teste: Sacar (falha)', () => {

   login()
   cy.get('[ng-class="btnClass3"]').click()
   cy.get('.form-control').type("100")
   cy.get('form.ng-dirty > .btn').click()
   cy.get('.error').should("contain.text", "Transaction Failed. You can not withdraw amount more than the balance.")

  })

it('Caso de teste: Depositar',()=>{
  login()
  cy.get('[ng-class="btnClass2"]').click()
  cy.get('.form-control').type("100")
  cy.get('form.ng-dirty > .btn').click()
  cy.get('.error').should("contain.text", "Deposit Successful")

})

})

function login(){

  cy.visit('https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login')
  cy.get('.borderM > :nth-child(1) > .btn').click()
  cy.get('#userSelect').select("Harry Potter")
  cy.get('form.ng-valid > .btn').click()
}