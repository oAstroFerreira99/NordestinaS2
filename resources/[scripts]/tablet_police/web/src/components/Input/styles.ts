import styled from "styled-components";
import { InputProps } from "./interfaces";

export const StyledInput = styled.input<InputProps>`
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #202024;
  width: ${({ width }) => (width ? width : "auto")};
  height: ${({ height }) => (height ? height : "auto")};
  max-width: ${({ maxWidth }) => (maxWidth ? maxWidth : "100%")};
  border-radius: 8px;
  outline: none;
  border: 0;
  color: #e1e1e6;
  padding: 0 8px;

  &::placeholder {
    color: #6d6c6c;
    outline: none;
    font-size: 14px;
    font-weight: bold;
  }
`;
