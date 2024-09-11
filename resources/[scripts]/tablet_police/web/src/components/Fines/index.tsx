import Button from "../Button";
import Input from "../Input";
import Separator from "../Separator";
import Text from "../Text";
import { Formik } from "formik";
import {
  BodyLeftPrison,
  BodyRightPrison,
  BoxButtons,
  BoxInputs,
  Form,
  WrapperPenalCode,
} from "./styles";
import { fetchNui } from "../../utils/fetchNui";

export default function Fines() {
  return (
    <WrapperPenalCode>
      <BodyLeftPrison>
        <Text size="20px" weight="bold">
          Aplicar multa
        </Text>

        <Formik
          initialValues={{ passport: "", fines: "", text: "" }}
          onSubmit={({ passport, fines, text }, { resetForm }) => {
            fetchNui("applyFine", {
              passport: parseInt(passport),
              fines: parseInt(fines),
              text,
            }).then((data) => {
              if (data["result"]) {
                resetForm();
                return;
              }
            });
          }}
        >
          {(props) => {
            const { values, handleChange, handleSubmit } = props;
            return (
              <Form onSubmit={handleSubmit}>
                <BoxInputs>
                  <Input
                    id="passport"
                    value={values.passport}
                    height="45px"
                    width="100%"
                    onChange={handleChange}
                    placeholder="Passaporte"
                    required
                    type="number"
                  />
                  <Input
                    id="fines"
                    value={values.fines}
                    onChange={handleChange}
                    height="45px"
                    width="100%"
                    placeholder="Multa"
                    required
                    type="number"
                  />
                </BoxInputs>

                <textarea
                  id="text"
                  value={values.text}
                  onChange={handleChange}
                  rows={16}
                  cols={100}
                  required
                  placeholder="Descreva todas as informações da multa"
                />

                <BoxButtons>
                  <Button type="submit" height="45px" width="180px">
                    Multar
                  </Button>
                </BoxButtons>
              </Form>
            );
          }}
        </Formik>
      </BodyLeftPrison>

      <Separator />

      <BodyRightPrison>
        <Text size="16px" weight="bold">
          Observações:
        </Text>
        <Text size="16px" weight="bold">
          1 - Antes de enviar o formulário verifique corretamente se todas as
          informações estão de acordo com a multa, você é responsável por todas
          as informações enviadas e salvas no sistema.
        </Text>
        <Text size="16px" weight="bold">
          2 - Ao preencher o campo de multas, verifique se o valor está correto,
          após enviar o formulário não será possível alterar ou remover a multa
          enviada.
        </Text>
      </BodyRightPrison>
    </WrapperPenalCode>
  );
}
