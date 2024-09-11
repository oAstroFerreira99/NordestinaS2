import { Loading, WrapperLoadingSpinner } from "./styles";

export default function LoadingSpinner() {
  return (
    <WrapperLoadingSpinner className="spinner-container">
      <Loading className="loading-spinner" />
    </WrapperLoadingSpinner>
  );
}
