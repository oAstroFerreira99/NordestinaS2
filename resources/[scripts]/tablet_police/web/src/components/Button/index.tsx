import { memo } from "react";
import { ButtonProps } from "./interfaces";
import { StyledButton } from "./styles";

function Button({
  onClick,
  disabled,
  type = "button",
  text = false,
  children,
  ...props
}: ButtonProps) {
  return (
    <StyledButton
      type={type}
      disabled={disabled}
      onClick={!disabled ? onClick : undefined}
      {...props}
    >
      {children}
    </StyledButton>
  );
}

export default memo(Button);
