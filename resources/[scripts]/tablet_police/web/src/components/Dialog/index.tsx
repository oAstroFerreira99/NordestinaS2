import Text from "../Text";
import closeIcon from "../../assets/close.svg";

import { Root, Portal, Overlay, Content, HeaderModal } from "./styles";
import { DialogProps } from "./interfaces";

export default function Dialog({
  close,
  isOpenModal,
  title,
  height,
  width,
  children,
}: DialogProps) {
  return (
    <Root open={isOpenModal}>
      <Portal>
        <Overlay />
        <Content height={height} width={width}>
          <HeaderModal>
            <Text size="22px" weight="bold">
              {title}
            </Text>

            <button type="button" onClick={close}>
              <img src={closeIcon} alt="" />
            </button>
          </HeaderModal>

          {children}
        </Content>
      </Portal>
    </Root>
  );
}
