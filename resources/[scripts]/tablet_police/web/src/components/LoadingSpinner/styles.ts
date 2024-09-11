import styled from "styled-components";

export const WrapperLoadingSpinner = styled.div`
  display: grid;
  justify-content: center;
  align-items: center;
  width: 100%;
`;

export const Loading = styled.div`
  @keyframes spinner {
    0% {
      transform: rotate(0deg);
    }
    100% {
      transform: rotate(360deg);
    }
  }

  width: 50px;
  height: 50px;
  border-top: 5px solid #685c7e;
  border-radius: 50%;
  animation: spinner 1.5s linear infinite;
`;
