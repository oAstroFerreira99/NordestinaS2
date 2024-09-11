export interface DialogProps {
  close?: () => void;
  isOpenModal?: boolean;
  title: string;
  height?: string;
  width?: string;
  children: React.ReactNode;
}
