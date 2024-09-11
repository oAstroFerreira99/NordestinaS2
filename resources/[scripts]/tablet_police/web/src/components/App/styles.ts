import styled from "styled-components";

export const Container = styled.div`
  top: 50%;
  left: 50%;
  position: absolute;
  transform: translate(-50%, -50%);
  overflow: hidden;

  width: 1000px;
  height: 800px;

  border: 3px solid black;
  border-radius: 8px;
  background: rgb(24 24 26);
  box-shadow: 0px 0px 25px 0px rgba(0, 0, 0, 0.75);

  @media screen {
    @media (min-width: 1300px) {
      width: 1200px;
    }
  }
`;

export const InitialScreen = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;

  height: 100%;
  width: 100%;
  gap: 24px;

  > img {
    max-height: 400px;
    max-width: 400px;
  }
`;

export const Header = styled.header`
  display: flex;
  align-items: center;
  position: relative;
  height: 80px;
  padding: 0 20px;
  border-bottom: 1px solid #6d6c6c;

  .button-name {
    display: flex;
    gap: 20px;
    cursor: default;
    position: absolute;
    right: 20px;

    > div {
      border-radius: 9999px;

      img {
        max-width: 40px;
        max-height: 40px;
        border-radius: 9999px;
      }
    }
  }
`;

export const ButtonText = styled.button`
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  color: #fff;
  font-weight: bold;
  font-size: 16px;
  padding: 0;
`;

export const BoxLeft = styled.div`
  display: flex;
  align-items: center;
  gap: 20px;
  margin-right: 40px;
  padding-right: 40px;
  border-right: 1px solid #6d6d6c;

  img {
    max-width: 60px;
    max-height: 60px;
  }
`;

export const BoxCenter = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 40px;
`;

export const BoxRight = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 20px;

  > div {
    border-radius: 9999px;

    img {
      max-width: 40px;
      max-height: 40px;
      border-radius: 9999px;
    }
  }
`;

export const WrapperBody = styled.div`
  display: flex;
  gap: 16px;
  height: calc(100% - 120px);
  max-width: 100%;
  padding: 20px;
`;

export const BodyLeft = styled.div<{ userFound: boolean }>`
  display: flex;
  flex-direction: column;
  gap: 24px;
  width: ${(props) => (props.userFound ? "68%" : "100%")};
`;

export const BoxInputSearch = styled.div`
  display: flex;
  gap: 20px;
`;

export const BodyRight = styled.div`
  display: flex;
  flex-direction: column;
  height: 100%;
  gap: 16px;
  width: 32%;

  > span {
    word-break: break-word;
  }
`;

export const PersonData = styled.div`
  display: flex;
  flex-direction: column;
  overflow: hidden;
  gap: 16px;
`;

export const CompleteData = styled.div`
  display: flex;
  flex-direction: column;
  padding: 16px 8px;
  border-radius: 8px;
  gap: 4px;

  border: 5px solid rgb(29, 29, 29);
  box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.75);
  background: rgb(31, 30, 30);
  background: linear-gradient(
    170deg,
    rgba(31, 30, 30, 1) 0%,
    rgba(46, 45, 45, 1) 50%,
    rgba(31, 30, 30, 1) 100%
  );
`;

export const Prisons = styled.div`
  display: flex;
  flex-direction: column;
  overflow-y: auto;
  padding-right: 6px;
  gap: 16px;
`;

export const BoxPrison = styled.div`
  display: flex;
  flex-direction: column;
  border-radius: 8px;
  padding: 16px 8px;

  background: linear-gradient(
    42deg,
    rgba(13, 13, 13, 1) 0%,
    rgba(31, 30, 30, 1) 50%,
    rgba(31, 30, 30, 1) 100%
  );
  box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.75);

  &:nth-child(odd) {
    background: linear-gradient(
      42deg,
      rgba(31, 30, 30, 1) 0%,
      rgba(31, 30, 30, 1) 50%,
      rgba(13, 13, 13, 1) 100%
    );
  }
`;

export const BoxTop = styled.div`
  display: flex;
  justify-content: space-between;

  margin-bottom: 10px;
  padding-bottom: 10px;
  border-bottom: 1px solid #202024;
`;

export const BoxBottom = styled.div``;

export const BoxNotFound = styled.div``;

export const FeedbackUser = styled.div`
  height: 400px;
  display: flex;
  align-items: center;
  justify-content: center;
`;

export const WrapperModal = styled.div`
  display: flex;
  flex-direction: column;
  width: 100%;
  gap: 24px;

  > button {
    color: #fff;
  }

  textarea {
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #202024;
    border: none;
    border-radius: 8px;
    outline: none;
    padding: 14px 8px;
    resize: none;
    color: #fff;
    font-family: sans-serif;

    &::placeholder {
      color: #6d6c6c;
      outline: none;
      font-size: 14px;
      font-weight: bold;
    }

    ::-webkit-scrollbar-track {
      background-color: #fff;
    }
    ::-webkit-scrollbar {
      width: 6px;
      background: #fff;
    }
    ::-webkit-scrollbar-thumb {
      background: #e1e1e6;
    }
  }
`;

export const BoxButtonCarry = styled.div`
  display: flex;
  gap: 8px;
`;

export const ButtonCarry = styled.button<{ collorButton: boolean }>`
  cursor: pointer;
  padding: 4px 12px;
  border-radius: 4px;
  background-color: ${({ collorButton }) =>
    collorButton ? "#086602" : "#a8010f"};
  color: #fff;
`;

export const BoxButtons = styled.div`
  display: flex;
  gap: 16px;
  width: 100%;
`;
