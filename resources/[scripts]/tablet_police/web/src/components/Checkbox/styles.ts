import styled, { css } from "styled-components";
import * as CheckboxPrimitive from "@radix-ui/react-checkbox";
import { Check } from "phosphor-react";

export const Root = styled(CheckboxPrimitive.Root)`
  width: 24px;
  height: 24px;
  background-color: #202024;
  border-radius: 4px;
  padding: 2px;
`;
export const Indicator = styled(CheckboxPrimitive.Indicator)``;
export const IconCheck = styled(Check)`
  height: 20px;
  width: 20px;
  color: #fff;
`;

export const LabelField = styled.label<{ disabled?: boolean }>`
  display: flex;
  gap: 8px;
  white-space: nowrap;

  input[type="checkbox"] {
    width: 0;
    height: 0;
    padding: 0;
    margin: 0;
    opacity: 0;
    margin-left: -8px;
  }

  ${({ disabled }) =>
    disabled &&
    css`
      pointer-events: none;
    `}
`;

export const Box = styled.div<Partial<any>>`
  display: flex;
  justify-content: center;
  align-items: center;

  border-radius: 4px;
  background-color: #202024;
  padding: 2px;

  width: 24px;
  height: 24px;

  cursor: pointer;

  ${({ disabled }) =>
    disabled &&
    css`
      background-color: red;
      border-color: blue;
      cursor: not-allowed;
      color: yellow;
    `}
`;
