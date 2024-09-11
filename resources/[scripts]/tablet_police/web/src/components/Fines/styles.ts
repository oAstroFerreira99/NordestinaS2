import styled from "styled-components";

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
