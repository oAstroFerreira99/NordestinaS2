import styled, { css } from "styled-components";
import { ButtonProps } from "./interfaces";

export const StyledButton = styled.button<Partial<ButtonProps>>`
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 8px;

  cursor: ${({ disabled }) => (disabled ? "not-allowed" : "pointer")};
  border-radius: 8px;
  background-color: #685c7e;

  color: #fff;
  font-size: 16px;
  font-weight: bold;
  flex-shrink: 0;
  width: ${({ width }) => (width ? width : "auto")};
  height: ${({ height }) => (height ? height : "auto")};
  max-width: ${({ maxWidth }) => (maxWidth ? maxWidth : "100%")};

  transition: background-color 100ms ease-in-out;
  transition: box-shadow 130ms ease-in-out;
  white-space: nowrap;

  &:hover {
    background-color: #685c7e;
    outline: none;
  }

  ${({ text }) =>
    text &&
    css`
      min-width: 0;
      min-height: 0;
      padding: 0;
      border: none;
      background-color: transparent;

      &:hover {
        box-shadow: none;
      }

      &:disabled {
        background-color: transparent;
      }
    `}
`;
