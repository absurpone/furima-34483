window.addEventListener('load', () => {

  const inputPrice = document.getElementById("item-price");
  inputPrice.addEventListener("keyup", () => {
    const inputValue = inputPrice.value;
    const taxPrice = document.getElementById("add-tax-price");
    taxPrice.innerHTML = (Math.floor(inputValue * 0.1));
    const profit = document.getElementById("profit");
    profit.innerHTML = (inputValue - taxPrice.innerHTML);
  })
});