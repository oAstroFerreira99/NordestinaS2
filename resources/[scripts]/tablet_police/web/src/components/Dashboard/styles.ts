import styled from "styled-components";

export const WrapperPenalCode = styled.div`
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 8px;
  max-width: 100%;
  height: 100%;
  box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.75);
  background: rgb(31, 30, 30);
  background: linear-gradient(
    170deg,
    rgba(31, 30, 30, 1) 0%,
    rgba(46, 45, 45, 1) 50%,
    rgba(31, 30, 30, 1) 100%
  );
  overflow-y: auto;
  border-radius: 8px;
  padding: 16px;

  > div {
    box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.75);
    background: rgb(31, 30, 30);
    background: linear-gradient(
      170deg,
      rgba(31, 30, 30, 1) 0%,
      rgba(46, 45, 45, 1) 50%,
      rgba(31, 30, 30, 1) 100%
    );
  }

  .apexcharts-toolbar {
    display: none !important;
  }

  .apexcharts-xaxis-label {
    color: #fff !important;
    fill: #fff !important;
  }

  .apexcharts-yaxis-label {
    color: #fff !important;
    fill: #fff !important;
  }

  .centered-chart .apexcharts-title-text {
    text-align: center;
    width: 100%;
    margin-left: 0 !important;
    margin-right: 0 !important;
    transform: translateX(40%);
    left: 50%;
    position: relative;
  }
`;

export const WrapperWanted = styled.div`
  display: flex;
  flex-direction: column;
  gap: 32px;
  padding: 8px 16px;
  overflow-y: auto;

  > span {
    text-align: center;
  }
`;

export const ListWanted = styled.div`
  display: flex;
  flex-direction: column;
  gap: 16px;
`;
export const ItemList = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  position: relative;
  padding: 16px;
  border: 1px solid #1e1b1b;
  border-radius: 8px;
  box-shadow: rgba(0, 0, 0, 0.75) 0px 0px 10px 0px;

  gap: 16px;
`;
export const BoxInfoPlayer = styled.div`
  display: flex;
  flex-direction: column;
  gap: 4px;
`;
export const ImagePlayer = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;

  img {
    min-width: 100px;
    min-height: 100px;
    max-height: 100px;
    max-width: 100px;
    border-radius: 50%;
    object-fit: cover;
  }
`;

export const BoxRight = styled.div`
  display: flex;
  justify-content: space-between;
  width: 100%;

  > button {
    padding: 0;
    cursor: pointer;
    position: absolute;
    top: 20px;
    right: 20px;

    img {
      width: 16px;
      height: 16px;
    }
  }
`;

export const WrapperModal = styled.div`
  display: flex;
  flex-direction: column;
  gap: 16px;
  width: 100%;
`;

export const BoxButtons = styled.div`
  display: flex;
  gap: 16px;
  width: 100%;
`;

export const BoxTop = styled.div`
  display: flex;
  align-items: center;
  justify-content: flex-start;
  gap: 8px;
  width: 100%;
`;
