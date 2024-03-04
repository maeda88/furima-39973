window.addEventListener('turbo:load',() => {
  const itemPrice = document.getElementById("item-price");
  

  itemPrice.addEventListener("input", () => {
    const inputValue = itemPrice.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)

    const profit = document.getElementById("profit");
    profit.innerHTML = inputValue - parseFloat(addTaxDom.innerHTML);
  });

  
});