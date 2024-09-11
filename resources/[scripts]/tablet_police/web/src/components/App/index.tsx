import React, { useCallback, useEffect, useState } from "react";
import { useNuiEvent } from "../../hooks/useNuiEvent";
import { useVisibility } from "../../providers/VisibilityProvider";
import { fetchNui } from "../../utils/fetchNui";
import { configTablet } from "../../../config";
import avatarPolice from "../../assets/avatar_police.png";
import {
  BodyLeft,
  BodyRight,
  BoxBottom,
  BoxButtonCarry,
  BoxButtons,
  BoxCenter,
  BoxInputSearch,
  BoxLeft,
  BoxNotFound,
  BoxPrison,
  BoxTop,
  ButtonCarry,
  ButtonText,
  CompleteData,
  Container,
  FeedbackUser,
  Header,
  InitialScreen,
  PersonData,
  Prisons,
  WrapperBody,
  WrapperModal,
} from "./styles";
import Text from "../Text";
import Button from "../Button";
import Input from "../Input";
import Separator from "../Separator";
import { formatNumber } from "../../utils/helpers";
import Dashboard from "../Dashboard";
import Prison from "../Prison";
import Fines from "../Fines";
import Dialog from "../Dialog";
import Materials from "../Materials";
import { generateTitleDialogCarry } from "./helpers";

const App: React.FC = () => {
  const [connected, setConnected] = useState(false);
  const [userConnected, setUserConnected] = useState<any>(null);
  const [passport, setPassport] = useState("");
  const [userFound, setUserFound] = useState<any>(null);
  const [selectedTab, setSelectedTab] = useState("dashboard");
  const [openDialogWanted, setOpenDialogWanted] = useState(false);

  const [dialogCarry, setDialogCarry] = useState("");

  const [messageWanted, setMessageWanted] = useState("");
  const [passportWanted, setPassportWanted] = useState("");
  const [imageWanted, setImageWanted] = useState("");

  const { visible, setVisible } = useVisibility();

  useNuiEvent("open", () => {
    setVisible(true);
  });

  useNuiEvent("close", () => {
    setVisible(false);
    setConnected(false);
    setSelectedTab("dashboard");
    setPassport("");
    setUserFound(null);
  });

  useNuiEvent("updateSearch", () => {
    handleFindUser();
  });

  const handleSetWanted = useCallback(async () => {
    if (!messageWanted || !imageWanted || !passportWanted) return;

    fetchNui("setWanted", {
      passport: Number(passportWanted),
      image: imageWanted,
      text: messageWanted,
    }).then(() => {
      setOpenDialogWanted(false);
      setImageWanted("");
      setMessageWanted("");
      setPassportWanted("");
      return;
    });
  }, [messageWanted, imageWanted, passportWanted]);

  const handleConnectUser = async () => {
    try {
      const res = await fetchNui("getUser");
      setUserConnected(res);
      setConnected(true);
    } catch (error) {
      console.log(error);
    }
  };

  const handleFindUser = useCallback(async () => {
    if (passport !== "") {
      try {
        const res = await fetchNui("getUserByPassport", parseInt(passport));
        setUserFound(res);
      } catch (error) {
        console.log("error");
      }
    }
  }, [passport]);

  const handleChangeCarry = useCallback(async () => {
    if (userFound["result"][7].length === 0) {
      await fetchNui("setCarry", parseInt(userFound["result"][6]));
    } else {
      await fetchNui("removeCarry", parseInt(userFound["result"][6]));
    }
    setDialogCarry("");
  }, [userFound]);

  const handleKeyUp = (e: any) => {
    if (e.keyCode === 27) {
      fetchNui("closeTablet");
    }
  };

  useEffect(() => {
    document.addEventListener("keyup", (e) => handleKeyUp(e));
    return () => {
      document.removeEventListener("keyup", () => {});
    };
  }, []);

  return (
    <>
      {visible && (
        <Container>
          {!connected && (
            <InitialScreen>
              <img src={configTablet.logoPolice} alt="" />
              <Button
                height="60px"
                width="280px"
                type="button"
                onClick={handleConnectUser}
              >
                CONECTAR
              </Button>
            </InitialScreen>
          )}

          {connected && userConnected && (
            <>
              <Header>
                <BoxLeft>
                  <img src={configTablet.logoPolice} alt="" />

                  <Text weight="bold">Sistema policial</Text>
                </BoxLeft>

                <BoxCenter>
                  <ButtonText
                    type="button"
                    onClick={() => {
                      setSelectedTab("prison");
                      setUserFound(null);
                    }}
                  >
                    Prisão
                  </ButtonText>
                  <ButtonText
                    type="button"
                    onClick={() => {
                      setSelectedTab("fines");
                      setUserFound(null);
                    }}
                  >
                    Multa
                  </ButtonText>
                  <ButtonText
                    type="button"
                    onClick={() => {
                      setOpenDialogWanted(true);
                    }}
                  >
                    Procurado
                  </ButtonText>
                  <ButtonText
                    type="button"
                    onClick={() => {
                      setSelectedTab("materials");
                      setUserFound(null);
                    }}
                  >
                    Materiais
                  </ButtonText>
                  <ButtonText
                    type="button"
                    onClick={() => {
                      setSelectedTab("dashboard");
                      setUserFound(null);
                    }}
                  >
                    Dashboard
                  </ButtonText>

                  <ButtonText type="button" className="button-name">
                    <Text weight="bold">{userConnected["result"][0]}</Text>
                    <div>
                      <img src={avatarPolice} alt="" />
                    </div>
                  </ButtonText>
                </BoxCenter>
              </Header>

              <WrapperBody>
                <BodyLeft userFound={userFound && userFound["result"][0]}>
                  <BoxInputSearch>
                    <Input
                      height="45px"
                      width="100%"
                      type="number"
                      placeholder="Consulte o passaporte..."
                      onChange={(e) => setPassport(e.target.value)}
                      value={passport}
                    />

                    <Button
                      height="45px"
                      width="150px"
                      type="button"
                      onClick={handleFindUser}
                    >
                      Buscar
                    </Button>
                  </BoxInputSearch>

                  {!userFound && selectedTab === "dashboard" && <Dashboard />}

                  {!userFound && selectedTab === "fines" && <Fines />}

                  {!userFound && selectedTab === "prison" && <Prison />}

                  {!userFound && selectedTab === "materials" && <Materials />}

                  {userFound && userFound["result"][0] && (
                    <PersonData>
                      <Text weight="bold" size="20px">
                        {userFound["result"][1]}
                      </Text>

                      <CompleteData>
                        <Text textColor="#fff">
                          <strong>Passaporte:</strong>{" "}
                          <Text textColor="#fff">
                            {formatNumber(userFound["result"][6])}
                          </Text>
                        </Text>
                        <Text textColor="#fff">
                          <strong>Nome:</strong>{" "}
                          <Text textColor="#fff">{userFound["result"][1]}</Text>
                        </Text>
                        <Text textColor="#fff">
                          <strong>Telefone:</strong>{" "}
                          <Text textColor="#fff">{userFound["result"][2]}</Text>
                        </Text>
                        <Text textColor="#fff">
                          <strong>Multas:</strong>{" "}
                          <Text textColor="#fff">
                            ${formatNumber(userFound["result"][3])}
                          </Text>
                        </Text>
                        <BoxButtonCarry>
                          <Text textColor="#fff">
                            <strong>Porte de armas:</strong>{" "}
                            <ButtonCarry
                              type="button"
                              collorButton={
                                userFound["result"][7].length > 0 ? true : false
                              }
                              onClick={() => {
                                if (userFound["result"][7].length > 0) {
                                  setDialogCarry("remove");
                                } else {
                                  setDialogCarry("add");
                                }
                              }}
                            >
                              {userFound["result"][7].length > 0
                                ? "SIM"
                                : "NÃO"}
                            </ButtonCarry>
                          </Text>
                        </BoxButtonCarry>
                        {userFound["result"][5].length > 0 && (
                          <Text weight="bold" textColor="#ce0404">
                            PROCURADO
                          </Text>
                        )}
                      </CompleteData>

                      <Text weight="bold" size="20px">
                        Histórico de prisões
                      </Text>

                      <Prisons>
                        {userFound["result"][4].length > 0 ? (
                          <>
                            {userFound["result"][4].map((item: any) => (
                              <BoxPrison>
                                <BoxTop>
                                  <Text textColor="#fff">
                                    <strong>Policial:</strong>{" "}
                                    <Text textColor="#fff">
                                      {item["Policia"]}
                                    </Text>
                                  </Text>
                                  <Text textColor="#fff">
                                    <strong>Serviços:</strong>{" "}
                                    <Text textColor="#fff">
                                      {item["services"]}
                                    </Text>
                                  </Text>
                                  <Text textColor="#fff">
                                    <strong>Multa:</strong>{" "}
                                    <Text textColor="#fff">
                                      $ {formatNumber(item["fines"])}
                                    </Text>
                                  </Text>
                                  <Text weight="bold" textColor="#fff">
                                    {item["date"]}
                                  </Text>
                                </BoxTop>
                                <BoxBottom>
                                  <Text textColor="#fff">{item["text"]}</Text>
                                </BoxBottom>
                              </BoxPrison>
                            ))}
                          </>
                        ) : (
                          <FeedbackUser>
                            <Text textColor="#fff">
                              Não foi encontrado nenhum registro de prisão
                            </Text>
                          </FeedbackUser>
                        )}
                      </Prisons>
                    </PersonData>
                  )}

                  {userFound && !userFound["result"][0] && (
                    <BoxNotFound>
                      <Text weight="bold" size="20px">
                        Nenhuma pessoa foi encontrada com esse passaporte!
                      </Text>
                    </BoxNotFound>
                  )}
                </BodyLeft>

                {userFound && userFound["result"][0] && (
                  <>
                    <Separator />

                    <BodyRight>
                      <Text size="16px" weight="bold">
                        Observações:
                      </Text>
                      <Text size="16px" weight="bold">
                        1 - Todas as informações encontradas são de uso
                        exclusivo policial, tudo que for encontrado na mesma são
                        informações em tempo real
                      </Text>
                      <Text size="16px" weight="bold">
                        2 - Nunca forneça qualquer informação dessa página para
                        outra pessoa, apenas se a pessoa for o proprietário ou o
                        advogado do mesmo
                      </Text>
                    </BodyRight>
                  </>
                )}
              </WrapperBody>

              <Dialog
                title="Sistema de procurado"
                isOpenModal={openDialogWanted}
                close={() => setOpenDialogWanted(false)}
                width="500px"
              >
                <WrapperModal>
                  <Text>Preencha os campos abaixo</Text>

                  <Input
                    placeholder="Informe o passaporte"
                    height="45px"
                    onChange={(e) => setPassportWanted(e.target.value)}
                    value={passportWanted}
                  />

                  <Input
                    placeholder="Informe a url da imagem"
                    height="45px"
                    onChange={(e) => setImageWanted(e.target.value)}
                    value={imageWanted}
                  />

                  <textarea
                    name="crimes"
                    rows={8}
                    cols={100}
                    placeholder="Informe o motivo"
                    onChange={(e) => setMessageWanted(e.target.value)}
                    value={messageWanted}
                  />

                  <Button
                    type="button"
                    width="100%"
                    height="45px"
                    onClick={handleSetWanted}
                  >
                    Confirmar
                  </Button>
                </WrapperModal>
              </Dialog>

              <Dialog
                title={generateTitleDialogCarry(dialogCarry)}
                isOpenModal={dialogCarry !== ""}
                close={() => setDialogCarry("")}
                width="500px"
              >
                <WrapperModal>
                  <Text>
                    {dialogCarry === "remove"
                      ? "Você tem certeza que deseja remover o porte de armas?"
                      : "Você tem certeza que deseja adicionar o porte de armas?"}
                  </Text>

                  <BoxButtons>
                    <Button
                      type="button"
                      width="48%"
                      height="45px"
                      onClick={handleChangeCarry}
                    >
                      Sim
                    </Button>
                    <Button
                      type="button"
                      width="48%"
                      height="45px"
                      onClick={() => setDialogCarry("")}
                    >
                      Não
                    </Button>
                  </BoxButtons>
                </WrapperModal>
              </Dialog>
            </>
          )}
        </Container>
      )}
    </>
  );
};

export default App;
