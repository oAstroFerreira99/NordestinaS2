import { useEffect, useState } from "react";
import Chart from "react-apexcharts";
import { fetchNui } from "../../utils/fetchNui";
import LoadingSpinner from "../LoadingSpinner";
import Text from "../Text";
import closeIcon from "../../assets/close.svg";
import { configTablet } from "../../../config";

import {
  BoxInfoPlayer,
  BoxRight,
  ImagePlayer,
  ItemList,
  ListWanted,
  WrapperModal,
  WrapperPenalCode,
  WrapperWanted,
  BoxButtons,
  BoxTop,
} from "./styles";
import { FeedbackUser } from "../App/styles";
import Dialog from "../Dialog";
import Button from "../Button";
import { useNuiEvent } from "../../hooks/useNuiEvent";

export default function Dashboard() {
  const [loading, setLoading] = useState(true);
  const [loadingWanted, setLoadingWanted] = useState(true);
  const [wanteds, setWanteds] = useState([]);
  const [dialogDelete, setDialogDelete] = useState(false);
  const [playerId, setPlayerId] = useState(null);
  const [graphicSettings, setGraphicSettings] = useState<any>({
    options: {
      chart: {
        id: "column-chart",
      },
      plotOptions: {
        bar: {
          colors: {
            ranges: [
              {
                from: 0,
                to: 1000,
                color: "#685c7e",
              },
              {
                from: 1001,
                to: 2000,
                color: "#F9E045",
              },
              {
                from: 2000,
                to: 30000,
                color: "#05ADCA",
              },
            ],
          },
        },
      },
      xaxis: {
        categories: configTablet.graphicMonths,
        position: "top",
        axisBorder: {
          show: false,
        },
        axisTicks: {
          show: false,
        },
        tooltip: {
          enabled: true,
        },
      },
      yaxis: {
        axisBorder: {
          show: false,
        },
        axisTicks: {
          show: false,
        },
      },
      title: {
        text: "Prisões",
        floating: true,
        offsetY: 540,
        style: {
          color: "#fff",
          textAlign: "center",
        },
      },
    },
  });

  useNuiEvent("updateWanted", () => {
    handleGetWanteds();
  });

  const handleGetGraphicData = async () => {
    setLoading(true);
    try {
      const res = await fetchNui("getGraphicData");

      setGraphicSettings((prevState: any) => ({
        ...prevState,
        series: [
          {
            name: "Prisões",
            data: res["result"].map((i: any) => Number(i.quantity)),
          },
        ],
      }));
      setLoading(false);
    } catch (error) {
      setLoading(false);
      console.log(error);
    }
  };

  const handleGetWanteds = async () => {
    setLoadingWanted(true);
    try {
      const res = await fetchNui("getWanted");
      setWanteds(res["result"]);
      setLoadingWanted(false);
    } catch (error) {
      setLoadingWanted(false);
      console.log(error);
    }
  };

  const handleDeleteWanted = async () => {
    if (!playerId) return;
    await fetchNui("removeWanted", parseInt(playerId));
    setDialogDelete(false);
  };

  useEffect(() => {
    handleGetGraphicData();
  }, []);

  useEffect(() => {
    handleGetWanteds();
  }, []);

  return (
    <>
      <WrapperPenalCode>
        {loading ? (
          <LoadingSpinner />
        ) : (
          <Chart
            options={graphicSettings.options}
            series={graphicSettings.series}
            type="bar"
            height={560}
            className="centered-chart"
          />
        )}

        {loadingWanted ? (
          <LoadingSpinner />
        ) : (
          <WrapperWanted>
            <Text size="22px" weight="bold">
              Procurados
            </Text>

            <ListWanted>
              {wanteds.length > 0 ? (
                <>
                  {wanteds.map((item: any) => (
                    <ItemList>
                      <BoxTop>
                        <ImagePlayer>
                          <img src={item.image} alt="" />
                        </ImagePlayer>

                        <BoxInfoPlayer>
                          <Text>
                            <strong>Passaporte:</strong> {item.nuser_id}
                          </Text>
                          <Text>
                            <strong>Nome:</strong> {item.nuser_name}
                          </Text>
                          <Text>
                            <strong>Data:</strong> {item.date}
                          </Text>
                        </BoxInfoPlayer>
                      </BoxTop>

                      <BoxRight>
                        <BoxInfoPlayer>
                          <Text>
                            <strong>Motivo:</strong> {item.description}
                          </Text>
                        </BoxInfoPlayer>

                        <button
                          type="button"
                          onClick={() => {
                            setDialogDelete(true);
                            setPlayerId(item.nuser_id);
                          }}
                        >
                          <img src={closeIcon} alt="" />
                        </button>
                      </BoxRight>
                    </ItemList>
                  ))}
                </>
              ) : (
                <FeedbackUser>
                  <Text textColor="#fff">
                    Não foi encontrado nenhum procurado
                  </Text>
                </FeedbackUser>
              )}
            </ListWanted>
          </WrapperWanted>
        )}
      </WrapperPenalCode>

      <Dialog
        title="Remover procurado"
        isOpenModal={dialogDelete}
        close={() => setDialogDelete(false)}
        width="500px"
      >
        <WrapperModal>
          <Text>
            Ao remover o procurado, você não poderá voltar atrás, tem certeza
            disso?
          </Text>

          <BoxButtons>
            <Button
              type="button"
              width="48%"
              height="45px"
              onClick={handleDeleteWanted}
            >
              Sim
            </Button>
            <Button
              type="button"
              width="48%"
              height="45px"
              onClick={() => setDialogDelete(false)}
            >
              Não
            </Button>
          </BoxButtons>
        </WrapperModal>
      </Dialog>
    </>
  );
}
