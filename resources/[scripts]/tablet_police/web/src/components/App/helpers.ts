export const generateTitleDialogCarry = (value: string) => {
  if (value === "remove") {
    return "Remover porte de armas";
  }

  if (value === "add") {
    return "Adicionar porte de armas";
  }

  return "";
};
