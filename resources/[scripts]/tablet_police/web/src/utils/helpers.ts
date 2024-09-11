export const formatNumber = (n: any) => {
  var n = n.toString();
  var r = "";
  var x = 0;

  for (var i = n.length; i > 0; i--) {
    r += n.substr(i - 1, 1) + (x == 2 && i != 1 ? "." : "");
    x = x == 2 ? 0 : x + 1;
  }

  return r.split("").reverse().join("");
};

export const toCurrency = (value?: string | number) => {
  if (value === undefined || value === null) return undefined;

  const currencyConfig = {
    style: "currency",
    currency: "USD",
  };

  let currencyValue = Number(value).toLocaleString("en-US", currencyConfig);

  currencyValue = currencyValue.replace(/\s/g, "");

  if (!Number.isFinite(Number(value)))
    return Number(0)
      .toLocaleString("en-US", currencyConfig)
      .replaceAll(String.fromCharCode(160), " ");

  return currencyValue.replaceAll(String.fromCharCode(160), " ");
};
