import { useCallback, useState } from "react";
import Button from "../Button";
import Input from "../Input";
import Separator from "../Separator";
import Text from "../Text";
import {
  BodyLeftPrison,
  BodyRightPrison,
  BoxButtons,
  BoxInputs,
  BoxLeft,
  Form,
  List,
  PenalCodeCategory,
  ItemList,
  WrapperPenalCode,
  WrapperPrisonModal,
  BoxRight,
  BoxInputsBottom,
} from "./styles";
import Checkbox from "../Checkbox";
import { configTablet } from "../../../config";
import { fetchNui } from "../../utils/fetchNui";
import SelectInput from "../SelectInput";
import Dialog from "../Dialog";
import { validateImage } from "./helpers";

export default function Prison() {
  const [isOpenModal, setIsOpenModal] = useState(false);
  const [selectedCrimes, setSelectedCrimes] = useState<
    { id: string; services: number; fines: number; description: string }[]
  >([]);
  const [prisonData, setPrisonData] = useState<{
    services: number | string;
    fines: number | string;
    description: string;
  }>({ services: "", fines: "", description: "" });
  const [contempt, setContempt] = useState("");
  const [disobedience, setDisobedience] = useState("");
  const [hostages, setHostages] = useState("");
  const [quantityDrugs, setQuantityDrugs] = useState("");
  const [passport, setPassport] = useState("");
  const [policeInvolved, setPoliceInvolved] = useState("");
  const [urlImage, setUrlImage] = useState("");
  const [selectedReduction, setSelectedReduction] = useState<string>("");
  const [backupData, setBackupData] = useState<{
    services: number | string;
    fines: number | string;
    description: string;
  }>({ services: "", fines: "", description: "" });

  const handleToggleSelectCrimes = useCallback(
    (
      name: string,
      services: number,
      fines: number,
      description: string,
      checked?: boolean
    ) => {
      var arr = [];
      setSelectedReduction("");

      if (checked) {
        setSelectedCrimes([
          ...selectedCrimes,
          { id: name, services, fines, description },
        ]);

        setPrisonData({
          services:
            backupData.services !== ""
              ? Number(backupData?.services) + services
              : services,
          fines:
            backupData.fines !== "" ? Number(backupData?.fines) + fines : fines,
          description:
            backupData.description !== ""
              ? `${backupData?.description}; ${description}`
              : description,
        });

        setBackupData({
          services:
            backupData.services !== ""
              ? Number(backupData?.services) + services
              : services,
          fines:
            backupData.fines !== "" ? Number(backupData?.fines) + fines : fines,
          description:
            backupData.description !== ""
              ? `${backupData?.description}; ${description}`
              : description,
        });
      } else {
        arr = selectedCrimes.filter((crime) => crime.id !== name);
        setSelectedCrimes(arr);
        const description = arr?.map((item) => item?.description);

        if (arr.length > 0) {
          setPrisonData({
            services: Number(backupData?.services) - services,
            fines: Number(backupData?.fines) - fines,
            description: description?.reduce((a, b) => {
              return `${a}; ${b}`;
            }),
          });

          setBackupData({
            services: Number(backupData?.services) - services,
            fines: Number(backupData?.fines) - fines,
            description: description?.reduce((a, b) => {
              return `${a}; ${b}`;
            }),
          });
        } else {
          setPrisonData({
            services:
              Number(prisonData.services) - services > 0
                ? Number(prisonData.services) - services
                : "",
            fines:
              Number(prisonData.fines) - fines > 0
                ? Number(prisonData.fines) - fines
                : "",
            description: "",
          });

          setBackupData({
            services:
              Number(prisonData.services) - services > 0
                ? Number(prisonData.services) - services
                : "",
            fines:
              Number(prisonData.fines) - fines > 0
                ? Number(prisonData.fines) - fines
                : "",
            description: "",
          });
        }
      }
    },
    [selectedCrimes, prisonData, backupData]
  );

  const handleChangeSummationServices = useCallback(
    (
      value: string | number,
      crime: string,
      funcSetState: any,
      servQuantity: number,
      finesQuantity: number,
      description: string
    ) => {
      setSelectedReduction("");
      if (Number(crime) > 0 && Number(value) === 0) {
        setPrisonData({
          ...backupData,
          services:
            backupData.services !== ""
              ? Number(backupData.services) - servQuantity * Number(crime)
              : Number(value),
          fines:
            backupData.fines !== ""
              ? Number(backupData.fines) - finesQuantity * Number(crime)
              : Number(value),
        });

        setBackupData({
          ...backupData,
          services:
            backupData.services !== ""
              ? Number(backupData.services) - servQuantity * Number(crime)
              : Number(value),
          fines:
            backupData.fines !== ""
              ? Number(backupData.fines) - finesQuantity * Number(crime)
              : Number(value),
        });
      } else if (Number(crime) === 0 && Number(value) > 0) {
        setPrisonData({
          services:
            backupData.services !== ""
              ? Number(backupData.services) + servQuantity * Number(value)
              : servQuantity,
          fines:
            backupData.fines !== ""
              ? Number(backupData.fines) + finesQuantity * Number(value)
              : finesQuantity,
          description:
            backupData.description !== ""
              ? `${backupData.description}; ${description}`
              : `${description}`,
        });
        setBackupData({
          services:
            backupData.services !== ""
              ? Number(backupData.services) + servQuantity * Number(value)
              : servQuantity,
          fines:
            backupData.fines !== ""
              ? Number(backupData.fines) + finesQuantity * Number(value)
              : finesQuantity,
          description:
            backupData.description !== ""
              ? `${backupData.description}; ${description}`
              : `${description}`,
        });
      } else {
        setPrisonData({
          ...backupData,
          services:
            backupData.services !== ""
              ? Number(backupData.services) -
                servQuantity * Number(crime) +
                servQuantity * Number(value)
              : Number(value),
          fines:
            backupData.fines !== ""
              ? Number(backupData.fines) -
                finesQuantity * Number(crime) +
                finesQuantity * Number(value)
              : Number(value),
        });
        setBackupData({
          ...backupData,
          services:
            backupData.services !== ""
              ? Number(backupData.services) -
                servQuantity * Number(crime) +
                servQuantity * Number(value)
              : Number(value),
          fines:
            backupData.fines !== ""
              ? Number(backupData.fines) -
                finesQuantity * Number(crime) +
                finesQuantity * Number(value)
              : Number(value),
        });
      }

      funcSetState(value);
    },
    [prisonData, backupData]
  );

  const handleApplyReduction = useCallback(
    (value: string, reductionPercentage: number) => {
      setSelectedReduction(value);
      setPrisonData({
        ...prisonData,
        services: Math.round(
          Number(backupData.services) -
            (Number(backupData.services) * reductionPercentage) / 100
        ),
        fines: Math.round(
          Number(backupData.fines) -
            (Number(backupData.fines) * reductionPercentage) / 100
        ),
      });
    },
    [prisonData, selectedCrimes, backupData]
  );

  const handleApplyPrison = useCallback(() => {
    if (
      Number(passport) !== 0 &&
      Number(prisonData.fines) !== 0 &&
      Number(prisonData.services) !== 0 &&
      prisonData.description !== "" &&
      policeInvolved !== "" &&
      urlImage !== ""
    ) {
      fetchNui("applyPrison", {
        passport: Number(passport),
        fines: Number(prisonData.fines),
        services: Number(prisonData.services),
        text: prisonData.description,
        polices: policeInvolved,
        image: validateImage(urlImage),
      }).then((data) => {
        if (data["result"]) {
          setPrisonData({ services: "", fines: "", description: "" });
          setBackupData({ services: "", fines: "", description: "" });
          setPoliceInvolved("");
          setSelectedReduction("");
          setUrlImage("");
          setPassport("");
          setSelectedCrimes([]);
          return;
        }
      });
    }
  }, [passport, urlImage, policeInvolved, prisonData]);

  return (
    <>
      <WrapperPenalCode>
        <BodyLeftPrison>
          <Text size="20px" weight="bold">
            Efetuar prisão
          </Text>

          <Form>
            <BoxInputs>
              <Input
                height="45px"
                width="100%"
                placeholder="Passaporte"
                type="number"
                value={passport}
                onChange={(e) => setPassport(e.target.value)}
              />
              <Input
                height="45px"
                width="100%"
                placeholder="Serviços"
                type="number"
                value={prisonData?.services}
                onChange={(e) => {
                  setPrisonData({
                    ...prisonData,
                    services: e.target.value,
                  });
                  setBackupData({
                    ...backupData,
                    services: e.target.value,
                  });
                }}
              />
              <Input
                height="45px"
                width="100%"
                placeholder="Multa"
                type="number"
                value={prisonData?.fines}
                onChange={(e) => {
                  setPrisonData({
                    ...prisonData,
                    fines: e.target.value,
                  });
                  setBackupData({
                    ...backupData,
                    fines: e.target.value,
                  });
                }}
              />
            </BoxInputs>
            <BoxInputsBottom>
              <Input
                height="45px"
                placeholder="QRA dos policiais envolvidos"
                value={policeInvolved}
                onChange={(e) => setPoliceInvolved(e.target.value)}
              />

              <Input
                height="45px"
                placeholder="Imagem do vagabundo (colocar URL do discord)"
                value={urlImage}
                onChange={(e) => setUrlImage(e.target.value)}
              />

              <textarea
                name="crimes"
                rows={16}
                cols={100}
                placeholder="Descreva todas as informações da prisão"
                value={prisonData?.description}
                onChange={(e) => {
                  setPrisonData({
                    ...prisonData,
                    description: e.target.value,
                  });
                  setBackupData({
                    ...backupData,
                    description: e.target.value,
                  });
                }}
              />
            </BoxInputsBottom>

            <BoxButtons>
              <SelectInput
                onChange={(e: any) =>
                  handleApplyReduction(e.value, e.reductionPercentage)
                }
                value={
                  configTablet.reductionOptions.find(
                    (item) => item.value === selectedReduction
                  ) ||
                  configTablet.reductionOptions.find(
                    (item) => item.value === "notReduction"
                  )
                }
                placeholder="Selecione uma redução"
                isDisabled={
                  Number(prisonData.services) <= 0 &&
                  Number(prisonData.fines) <= 0
                }
                options={configTablet.reductionOptions}
              />
              <Button
                onClick={() => setIsOpenModal(true)}
                height="45px"
                width="180px"
              >
                Selecionar Crimes
              </Button>
              <Button
                type="button"
                onClick={handleApplyPrison}
                height="45px"
                width="180px"
              >
                Prender
              </Button>
            </BoxButtons>
          </Form>
        </BodyLeftPrison>

        <Separator />

        <BodyRightPrison>
          <Text size="16px" weight="bold">
            Observações:
          </Text>
          <Text size="16px" weight="bold">
            1 - Antes de enviar o formulário verifique corretamente se todas as
            informações estão de acordo com o crime efetuado, você é responsável
            por todas as informações enviadas e salvas no sistema.
          </Text>
          <Text size="16px" weight="bold">
            2 - Ao preencher o campo de multas, verifique se o valor está
            correto, após enviar o formulário não será possível alterar ou
            remover a multa enviada.
          </Text>
          <Text size="16px" weight="bold">
            3 - Todas as prisões são salvas no sistema após o envio, então
            lembre-se que cada formulário enviado, o valor das multas, serviços
            e afins são somados com a ultima prisão caso o mesmo ainda esteja
            preso.
          </Text>
          <Text size="16px" weight="bold">
            4 - Não leitura da lei de miranda para um meliante, resultará em uma
            redução da PENA de 50%.
          </Text>
          <Text size="16px" weight="bold">
            5 - Caso o individuo for réu primário, a pena do mesmo deverá ser
            reduzida em 30%.
          </Text>
        </BodyRightPrison>
      </WrapperPenalCode>

      <Dialog
        title="Código Penal"
        isOpenModal={isOpenModal}
        close={() => setIsOpenModal(false)}
        width="900px"
        height="500px"
      >
        <WrapperPrisonModal>
          <BoxLeft>
            <PenalCodeCategory>
              <Text size="18px" weight="bold">
                Ações Fechadas:
              </Text>
              <List>
                {configTablet.penalCodePrison
                  .find((listFiltered) => listFiltered.id === 1)
                  ?.crimes.map((item) => (
                    <ItemList>
                      <Checkbox
                        name={String(item.id)}
                        onChange={(
                          name,
                          checked,
                          services,
                          fines,
                          description
                        ) =>
                          handleToggleSelectCrimes(
                            name,
                            services,
                            fines,
                            description,
                            checked
                          )
                        }
                        services={item.services}
                        fines={item.fine}
                        description={item.description}
                        isChecked={
                          selectedCrimes.find(
                            ({ id }) => id === String(item.id)
                          )
                            ? true
                            : false
                        }
                      />
                      <Text size="14px">{item.description}</Text>
                    </ItemList>
                  ))}
              </List>
            </PenalCodeCategory>
            <PenalCodeCategory>
              <Text size="18px" weight="bold">
                Infrações:
              </Text>
              <List>
                {configTablet.penalCodePrison
                  .find((listFiltered) => listFiltered.id === 2)
                  ?.crimes.map((item) => (
                    <ItemList>
                      <Checkbox
                        name={String(item.id)}
                        onChange={(
                          name,
                          checked,
                          services,
                          fines,
                          description
                        ) =>
                          handleToggleSelectCrimes(
                            name,
                            services,
                            fines,
                            description,
                            checked
                          )
                        }
                        services={item.services}
                        fines={item.fine}
                        description={item.description}
                        isChecked={
                          selectedCrimes.find(
                            ({ id }) => id === String(item.id)
                          )
                            ? true
                            : false
                        }
                      />
                      <Text size="14px">{item.description}</Text>
                    </ItemList>
                  ))}
              </List>
            </PenalCodeCategory>
            <PenalCodeCategory>
              <Text size="18px" weight="bold">
                Crimes somatórios:
              </Text>

              <Input
                height="45px"
                placeholder="Número de desacatos"
                type="number"
                value={contempt}
                onChange={(e) =>
                  handleChangeSummationServices(
                    e.target.value,
                    contempt,
                    setContempt,
                    15,
                    3000,
                    "Desacato(s)"
                  )
                }
              />
              <Input
                height="45px"
                placeholder="Número de desobediências"
                type="number"
                value={disobedience}
                onChange={(e) =>
                  handleChangeSummationServices(
                    e.target.value,
                    disobedience,
                    setDisobedience,
                    10,
                    3000,
                    "Desobediência(s)"
                  )
                }
              />
              <Input
                height="45px"
                placeholder="Número de reféns"
                type="number"
                value={hostages}
                onChange={(e) =>
                  handleChangeSummationServices(
                    e.target.value,
                    hostages,
                    setHostages,
                    50,
                    15000,
                    "Sequestro"
                  )
                }
              />
              <Input
                height="45px"
                placeholder="Quantidade de Drogas"
                type="number"
                value={quantityDrugs}
                onChange={(e) =>
                  handleChangeSummationServices(
                    e.target.value,
                    quantityDrugs,
                    setQuantityDrugs,
                    1,
                    25,
                    "Tráfico de drogas"
                  )
                }
              />
            </PenalCodeCategory>
          </BoxLeft>

          <BoxRight>
            <PenalCodeCategory>
              <Text size="18px" weight="bold">
                Crimes:
              </Text>
              <List>
                {configTablet.penalCodePrison
                  .find((listFiltered) => listFiltered.id === 3)
                  ?.crimes.map((item) => (
                    <ItemList>
                      <Checkbox
                        name={String(item.id)}
                        onChange={(
                          name,
                          checked,
                          services,
                          fines,
                          description
                        ) =>
                          handleToggleSelectCrimes(
                            name,
                            services,
                            fines,
                            description,
                            checked
                          )
                        }
                        services={item.services}
                        fines={item.fine}
                        description={item.description}
                        isChecked={
                          selectedCrimes.find(
                            ({ id }) => id === String(item.id)
                          )
                            ? true
                            : false
                        }
                      />
                      <Text size="14px">{item.description}</Text>
                    </ItemList>
                  ))}
              </List>
            </PenalCodeCategory>
          </BoxRight>
        </WrapperPrisonModal>
      </Dialog>
    </>
  );
}
