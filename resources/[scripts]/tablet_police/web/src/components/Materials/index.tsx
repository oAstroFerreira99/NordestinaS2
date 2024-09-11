import Iframe from "react-iframe";

import { WrapperPenalCode } from "./styles";
import SelectInput from "../SelectInput";
import { useCallback, useState } from "react";
import { optionsMaterials } from "./helpers";

export default function Materials() {
  const [materialSelected, setMaterialSelected] = useState("conduta");
  const [pdfUrl, setPdfUrl] = useState(
    "URLDODRIVEDECONDUTA"
  );

  const getFileId = (url: any) => {
    const match = url.match(/\/file\/d\/(.+?)\//);
    return match ? match[1] : null;
  };

  const handleChangeUrl = useCallback((value: string, link: string) => {
    setMaterialSelected(value);
    setPdfUrl(link);
  }, []);

  return (
    <WrapperPenalCode>
      <SelectInput
        onChange={(e: any) => handleChangeUrl(e.value, e.link)}
        value={optionsMaterials.find((i) => i.value === materialSelected)}
        placeholder="Selecione um material"
        options={optionsMaterials}
      />

      <Iframe
        url={`https://drive.google.com/file/d/${getFileId(pdfUrl)}/preview`}
        width="100%"
        height="100%"
        id="meuIframe"
        className="meuIframeClass"
        display="initial"
        position="relative"
      />
    </WrapperPenalCode>
  );
}
