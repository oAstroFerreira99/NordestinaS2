import styled from "styled-components";
import * as Dialog from "@radix-ui/react-dialog";

export const WrapperPenalCode = styled.div`
  display: flex;
  gap: 16px;
  width: 100%;
  height: 100%;
`;

export const BodyLeftPrison = styled.div`
  display: flex;
  flex-direction: column;
  gap: 16px;
  width: 68%;
`;

export const BodyRightPrison = styled.div`
  display: flex;
  flex-direction: column;
  gap: 16px;
  width: 32%;

  > span {
    word-break: break-word;
  }
`;

export const BoxInputs = styled.div`
  display: flex;
  gap: 16px;
`;

export const BoxInputsBottom = styled.div`
  display: flex;
  flex-direction: column;
  width: 100%;
  gap: 16px;
`;

export const Form = styled.form`
  display: flex;
  flex-direction: column;
  gap: 16px;
  width: 100%;

  textarea {
    display: flex;
    justify-content: center;
    align-items: center;
    background: #202024;
    border: none;
    border-radius: 8px;
    outline: none;
    padding: 14px 8px;
    resize: none;
    color: #e1e1e6;

    &::placeholder {
      color: #6d6c6c;
      outline: none;
      font-size: 14px;
      font-weight: bold;
    }

    ::-webkit-scrollbar-track {
      background-color: #f4f4f4;
    }
    ::-webkit-scrollbar {
      width: 6px;
      background: #f4f4f4;
    }
    ::-webkit-scrollbar-thumb {
      background: #dad7d7;
    }
  }
`;

export const BoxButtons = styled.div`
  display: flex;
  gap: 16px;
  align-items: center;
  justify-content: flex-end;
`;

export const Content = styled(Dialog.Content)`
  position: fixed;
  top: 50%;
  left: 50%;

  border-radius: 8px;
  padding: 16px;

  height: 500px;
  width: 900px;

  transform: translate(-50%, -50%);
  background: #121214;
`;

export const Overlay = styled(Dialog.Overlay)`
  display: grid;
  place-items: center;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 1200px;
  height: 800px;

  background-color: #000000b2;
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
  margin-bottom: 32px;
  width: 100%;

  > button {
    padding: 0;
    cursor: pointer;
  }
`;

export const WrapperPrisonModal = styled.div`
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
  overflow-y: auto;
  max-height: calc(100% - 60px);
`;
export const BoxLeft = styled.div`
  display: flex;
  flex-direction: column;
  gap: 24px;
`;
export const PenalCodeCategory = styled.div`
  display: flex;
  flex-direction: column;
  gap: 16px;
`;
export const List = styled.div`
  display: flex;
  flex-direction: column;
  gap: 8px;
`;
export const ItemList = styled.div`
  display: flex;
  align-items: center;
  gap: 8px;
`;
export const BoxRight = styled.div``;
