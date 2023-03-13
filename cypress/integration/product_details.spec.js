describe('Add to cart', () => {
  beforeEach(() => {
      cy.visit('http://localhost:3000/')
  })

  it("There is products on the page", () => {
      cy.get(".products article").should("be.visible");
    });

    it("should navigate to product detail page", () => {
      cy.get('[alt="Cliff Collard"]').click();
      cy.get(".product-detail").should("exist");
    });

})