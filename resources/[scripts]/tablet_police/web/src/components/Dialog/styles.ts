import styled from "styled-components";
import * as Dialog from "@radix-ui/react-dialog";

export const Content = styled(Dialog.Content)<{
  height?: string;
  width?: string;
}>`
  position: fixed;
  top: 50%;
  left: 50%;

  border-radius: 8px;
  padding: 16px;

  height: ${(props) => (props.height ? props.height : "auto")};
  width: ${(props) => (props.width ? props.width : "400px")};

  transform: translate(-50%, -50%);
  background: rgb(24 24 26);
`;

export const Overlay = styled(Dialog.Overlay)`
  display: grid;
  place-items: center;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 1000px;
  height: 800px;

  background-color: #000000b2;

  @media screen {
    @media (min-width: 1300px) {
      width: 1200px;
    }
  }
`;

export const Root = styled(Dialog.Root)`
  height: 400px;
  width: 400px;
`;

export const Portal = styled(Dialog.Portal)``;

export const Title = styled(Dialog.Title)``;

export const Description = styled(Dialog.Description)``;

export const Close = styled(Dialog.Close)`
  position: absolute;
  top: 24px;
  right: 24px;

  margin-top: 0 !important;

  cursor: pointer;
`;

export const HeaderModal = styled.header`
  display: flex;
  justify-content: space-between;
  margin-bottom: 24px;
  width: 100%;

  > button {
    padding: 0;
    cursor: pointer;

    img {
      width: 16px;
      height: 16px;
    }
  }
`;
