import * as CheckboxPrimitive from "@radix-ui/react-checkbox";
import { CheckboxProps } from "./interfaces";
import { Box, IconCheck, LabelField } from "./styles";

export interface ICheckboxProps extends CheckboxPrimitive.CheckboxProps {}

export default function Checkbox({
  onChange,
  name,
  disabled = false,
  isChecked,
  services,
  fines,
  description,
}: CheckboxProps) {
  return (
    <LabelField
      onClick={(e) => e.stopPropagation()}
      disabled={disabled}
      htmlFor={name}
    >
      <input
        id={name}
        type="checkbox"
        name={name}
        onChange={({ target: { name: nameTarget, checked } }) =>
          onChange(nameTarget, checked, services, fines, description)
        }
        checked={isChecked}
      />
      <Box
        id={name}
        disabled={disabled}
        role="checkbox"
        data-checked={isChecked}
      >
        {isChecked && <IconCheck />}
      </Box>
    </LabelField>
  );
}
