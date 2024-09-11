export interface ButtonProps
  extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  children: React.ReactNode | string;
  disabled?: boolean;
  width?: string;
  text?: boolean;
  height?: string;
  maxWidth?: string;
  cursor?: "not-allowed" | "wait" | "pointer";
}
