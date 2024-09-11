import styled, { css } from "styled-components";
import { TextProps } from "./interfaces";

const TextComponent = styled.span<Omit<TextProps, "children">>`
  color: ${({ textColor }) => (textColor ? textColor : "#fff")};
  font-size: ${({ size }) => (size ? size : "16px")};
  font-weight: ${({ weight }) => (weight ? weight : "regular")};
  ${({ underline }) =>
    underline &&
    css`
      text-decoration: underline;
    `}

  text-transform: ${({ textTransform }) =>
    textTransform ? textTransform : "none"};
`;

export default TextComponent;
