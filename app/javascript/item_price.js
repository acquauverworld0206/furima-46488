// 価格計算の処理を関数として定義
const calculatePrice = () => {
  // 価格入力欄の要素を取得
  const priceInput = document.getElementById("item-price");

  // 価格入力欄が存在しないページでは、処理を中断
  if (!priceInput) {
    return;
  }

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    const commission = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = commission;

    const profit = inputValue - commission;
    profitDom.innerHTML = profit;
  });
};

// turbo:load と turbo:render の両方のイベントで関数を実行
document.addEventListener("turbo:load", calculatePrice);
document.addEventListener("turbo:render", calculatePrice);