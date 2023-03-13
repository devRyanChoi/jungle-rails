describe('Add to cart', () => {
  beforeEach(() => {
      cy.visit('http://localhost:3000/')
  })

  it("There is products on the page", () => {
      cy.get(".products article").should("be.visible");
    });

    it("There are 12 products on the page", () => {
      cy.get(".products article").should("have.length", 12);
    });

    it('Clicking Add to Cart button increases the cart quantity by 1', () => {
      cy.get(".products article").should("be.visible")

      cy.get(".products article").eq(0).find('.btn').click({force: true})
      
      cy.get('.nav-item.end-0').should('not.have.value', 'My Cart (0)')
  })
})