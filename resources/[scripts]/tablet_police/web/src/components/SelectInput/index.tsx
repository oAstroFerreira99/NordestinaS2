import Select from "react-select";

import { WrapperSelect } from "./styles";

export default function SelectInput({ ...rest }) {
  return (
    <WrapperSelect>
      <Select
        hideSelectedOptions
        classNamePrefix="tablet_select"
        isSearchable={false}
        menuPlacement="top"
        name="reduction"
        {...rest}
      />
    </WrapperSelect>
  );
}
