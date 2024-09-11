import styled from "styled-components";

export const WrapperSelect = styled.div`
  width: 100%;

  .tablet_select__control {
    min-height: 45px;
    border-radius: 8px;
    border: none;
    background-color: #202024;
    box-shadow: 0px 0px 25px 0px rgba(0, 0, 0, 0.75);
    box-shadow: none;

    &:hover {
      border-color: #202024;
    }
  }

  .tablet_select__option {
    background-color: #202024;
    color: #fff;
    font-size: 14px;
    font-family: "Roboto" sans-serif;
    font-weight: 400;

    &--is-seleted,
    &--is-focused {
      background-color: #2e2e34;
    }
    &:active {
      background-color: #2e2e34;
    }
  }

  .tablet_select__menu-list {
    background-color: #202024;
    box-shadow: 0px 0px 25px 0px rgba(0, 0, 0, 0.75);
  }

  .tablet_select__placeholder {
    color: #6d6c6c;
    font-size: 14px;
    font-weight: bold;
  }

  .tablet_select__single-value {
    color: white;
    font-size: 14px;
    font-family: "Roboto" sans-serif;
    font-weight: 400;
  }

  .tablet_select__indicator-separator {
    display: none;
  }

  .tablet_select__menu {
    margin-top: -5px;
    box-shadow: none;
    border-bottom-left-radius: 8px;
    border-bottom-right-radius: 8px;
  }
`;
