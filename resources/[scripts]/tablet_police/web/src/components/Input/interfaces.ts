import { InputHTMLAttributes } from "react";

export interface InputProps extends InputHTMLAttributes<HTMLInputElement> {
  disabled?: boolean;
  width?: string;
  height?: string;
  maxWidth?: string;
}
