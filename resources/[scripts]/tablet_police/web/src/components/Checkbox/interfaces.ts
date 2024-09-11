export type CheckboxOnChangeType = (
  name: string,
  checked: boolean,
  services: number,
  fines: number,
  description: string
) => void;

export interface CheckboxProps {
  name: string;
  disabled?: boolean;
  onChange: CheckboxOnChangeType;
  isChecked?: boolean;
  services: number;
  fines: number;
  description: string;
}
