window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const tax = inputValue * 0.1;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = `${Math.floor(tax)}`;
    const profit = inputValue - tax;
    const salesProfit = document.getElementById("profit");
    salesProfit.innerHTML = `${profit}`;
  });
});