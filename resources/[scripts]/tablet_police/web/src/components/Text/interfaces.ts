export interface TextProps {
  children: React.ReactNode;
  type?: "h1" | "h2" | "h3" | "h4" | "h5" | "h6" | "p" | "span";
  size?: string;
  textColor?: string;
  weight?: "regular" | "bold";
  className?: string;
  textTransform?: "uppercase" | "none" | "lowercase" | "capitalize";
  underline?: boolean;
}
