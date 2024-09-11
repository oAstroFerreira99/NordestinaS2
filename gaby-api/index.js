const express = require("express");
const axios = require("axios");
const app = express();
const mysql = require("mysql2");
const config = require("./config.json");
const PORT = config.Server.Port;
const HOST = config.Server.Host;
app.use(express.json());

const clientid = config.Sound.ClientId;
const maxresults = config.Sound.MaxResults;

function getStr(string, start, end) {
  const str = string.split(start);
  const strEnd = str[1].split(end);
  return strEnd[0];
}

const connection = mysql.createConnection({
  host: config.Database.Host,
  user: config.Database.User,
  password: config.Database.Password,
  database: config.Database.Database,
});

connection.connect((err) => {
  if (err) {
    console.error("Erro ao conectar ao banco de dados:", err);
    return;
  }
  console.log("Conexão ao banco de dados estabelecida.");
  console.log('\n\x1B[97mAPI \x1B[93mv0.0.1\x1B[97m carregada com sucesso.');
});

app.get("/client/history", async (req, res) => {
  try {
    const x_player_id = req.headers["x-player-id"];

    // Busque o histórico no banco de dados
    const historyQuery = "SELECT * FROM download_history WHERE x_player_id = ?";
    connection.query(historyQuery, [x_player_id], (moyzhistoryErr, historyResults) => {
      if (moyzhistoryErr) {
        console.error("Erro ao buscar histórico do banco de dados:", moyzhistoryErr);
        res.status(500).json({
          error: "Ocorreu um erro ao buscar o histórico do banco de dados.",
        });
        return;
      }

      if (historyResults.length === 0) {
        res.status(200).json({ last_played: [] });
        return;
      }

      const moyzDownloadHistory = JSON.parse(historyResults[0].songs);

      moyzDownloadHistory.sort((a, b) => parseInt(a._id) - parseInt(b._id));

      const moyzHistorylmao = moyzDownloadHistory.map(entry => ({
        id: entry._id,
        type: "SONG",
      }));

      res.status(200).json({ last_played: moyzHistorylmao });
    });
  } catch (error) {
    console.error("Erro na requisição:", error);
    res.status(500).json({ error: "Ocorreu um erro na requisição." });
  }
});

app.post("/client/history", async (req, res) => {
  try {
    const x_player_id = req.headers["x-player-id"];

    const historyQuery = "SELECT * FROM download_history WHERE x_player_id = ?";
    connection.query(historyQuery, [x_player_id], (moyzhistoryErr, historyResults) => {
      if (moyzhistoryErr) {
        console.error("Erro ao buscar histórico do banco de dados:", moyzhistoryErr);
        res.status(500).json({
          error: "Ocorreu um erro ao buscar o histórico do banco de dados.",
        });
        return;
      }

      if (historyResults.length === 0) {
        res.status(200).json({ last_played: [] });
        return;
      }

      const moyzDownloadHistory = JSON.parse(historyResults[0].songs);

      moyzDownloadHistory.sort((a, b) => parseInt(a._id) - parseInt(b._id));

      const moyzHistorylmao = moyzDownloadHistory.map(entry => ({
        id: entry._id,
        type: "SONG",
      }));

      res.status(200).json({ last_played: moyzHistorylmao });
    });
  } catch (error) {
    console.error("Erro na requisição:", error);
    res.status(500).json({ error: "Ocorreu um erro na requisição." });
  }
});

app.post("/client/likes/:id", async (req, res) => {
  try {
    const _id = req.params.id;
    const x_player_id = req.headers["x-player-id"];
    const url = `https://api-v2.soundcloud.com/tracks/${_id}?client_id=${clientid}`;
    const response = await axios.get(url);
    const { artwork_url, user, title, permalink_url } = response.data;
    const image_url = artwork_url || `https://picsum.photos/seed/${_id}/100`;
    const selectQuery = `SELECT * FROM curtidas WHERE x_player_id = ?`;

    connection.query(
      selectQuery,
      [x_player_id],
      async (selectErr, selectResults) => {
        if (selectErr) {
          console.error("Erro ao buscar informações de curtidas:", selectErr);
          res.status(500).json({
            error: "Ocorreu um erro ao buscar informações de curtidas.",
          });
          return;
        }

        let likedInfos = [];
        if (selectResults.length > 0) {
          likedInfos = JSON.parse(selectResults[0].infos);
        } else {
          const insertQuery = `INSERT INTO curtidas (x_player_id, infos) VALUES (?, ?)`;
          likedInfos.push({
            _id: _id,
            image_url: image_url,
            name: title,
            author: user.username,
            url: permalink_url,
          });

          connection.query(
            insertQuery,
            [x_player_id, JSON.stringify(likedInfos)],
            (insertErr) => {
              if (insertErr) {
                console.error(
                  "Erro ao inserir informações de curtidas:",
                  insertErr
                );
                res.status(500).json({
                  error: "Ocorreu um erro ao inserir informações de curtidas.",
                });
                return;
              }
              res.status(200).json(likedInfos);
            }
          );
          return;
        }

        const existingEntry = likedInfos.find((info) => info._id === _id);
        if (!existingEntry) {
          likedInfos.push({
            _id: _id,
            image_url: image_url,
            name: title,
            author: user.username,
            url: permalink_url,
          });

          const updateQuery = `UPDATE curtidas SET infos = ? WHERE x_player_id = ?`;

          connection.query(
            updateQuery,
            [JSON.stringify(likedInfos), x_player_id],
            (updateErr) => {
              if (updateErr) {
                console.error(
                  "Erro ao atualizar informações de curtidas:",
                  updateErr
                );
                res.status(500).json({
                  error:
                    "Ocorreu um erro ao atualizar informações de curtidas.",
                });
                return;
              }
              res.status(200).json(likedInfos);
            }
          );
        } else {
          res.status(200).json(likedInfos);
        }
      }
    );
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Ocorreu um erro ao processar o ID." });
  }
});

app.delete("/client/likes/:id", async (req, res) => {
  try {
    const _id = req.params.id;
    const x_player_id = req.headers["x-player-id"];

    const selectQuery = "SELECT * FROM curtidas WHERE x_player_id = ?";
    connection.query(selectQuery, [x_player_id], async (selectErr, selectResults) => {
      if (selectErr) {
        console.error("Erro ao buscar informações de curtidas:", selectErr);
        res.status(500).json({
          error: "Ocorreu um erro ao buscar informações de curtidas.",
        });
        return;
      }

      if (selectResults.length === 0) {
        res.status(404).json({ error: "Música não encontrada nas curtidas." });
        return;
      }

      let likedInfos = JSON.parse(selectResults[0].infos);
      const existingEntryIndex = likedInfos.findIndex((info) => info._id === _id);

      if (existingEntryIndex !== -1) {
        likedInfos.splice(existingEntryIndex, 1);

        const updateQuery = "UPDATE curtidas SET infos = ? WHERE x_player_id = ?";
        connection.query(updateQuery, [JSON.stringify(likedInfos), x_player_id], (updateErr) => {
          if (updateErr) {
            console.error("Erro ao atualizar informações de curtidas:", updateErr);
            res.status(500).json({
              error: "Ocorreu um erro ao atualizar informações de curtidas.",
            });
            return;
          }
          res.status(200).json(likedInfos);
        });
      } else {
        res.status(404).json({ error: "Música não encontrada nas curtidas." });
      }
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Ocorreu um erro ao processar o ID." });
  }
});

app.delete("/client/playlists/:id", async (req, res) => {
  try {
    const _id = req.params.id;
    const x_player_id = req.headers["x-player-id"];

    const selectQuery = "SELECT * FROM playlists WHERE x_player_id = ?";
    connection.query(selectQuery, [x_player_id], async (selectErr, selectResults) => {
      if (selectErr) {
        console.error("Erro ao buscar informações de playlists:", selectErr);
        res.status(500).json({
          error: "Ocorreu um erro ao buscar informações de playlists.",
        });
        return;
      }

      if (selectResults.length === 0) {
        res.status(404).json({ error: "Música não encontrada nas playlists." });
        return;
      }

      let playlistInfos = JSON.parse(selectResults[0].playlists);
      const existingEntryIndex = playlistInfos.findIndex((info) => info._id === _id);

      if (existingEntryIndex !== -1) {
        playlistInfos.splice(existingEntryIndex, 1);

        const updateQuery = "UPDATE playlists SET playlists = ? WHERE x_player_id = ?";
        connection.query(updateQuery, [JSON.stringify(playlistInfos), x_player_id], (updateErr) => {
          if (updateErr) {
            console.error("Erro ao atualizar informações de playlists:", updateErr);
            res.status(500).json({
              error: "Ocorreu um erro ao atualizar informações de playlists.",
            });
            return;
          }
          res.status(200).json(playlistInfos);
        });
      } else {
        res.status(404).json({ error: "Música não encontrada nas playlists." });
      }
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Ocorreu um erro ao processar o ID." });
  }
});

app.get("/client/playlist", async (req, res) => {
  try {
    const { songs } = req.query;
    if (!songs) {
      res.status(400).json({ error: 'Parâmetro "songs" é obrigatório.' });
      return;
    }
    const songIds = songs.split(",");
    const responses = [];
    await Promise.all(
      songIds.map(async (songId) => {
        const url = `https://api-v2.soundcloud.com/tracks/${songId}?client_id=${clientid}`;
        try {
          const response = await axios.get(url);
          const { id, artwork_url, title, user } = response.data;
          const image_url = artwork_url
            ? artwork_url
            : `https://picsum.photos/seed/${id}/100`;
          responses.push({
            _id: `${id}`,
            image_url,
            name: title,
            author: user.username,
          });
        } catch (error) {
          if (error.response && error.response.status === 404) {
            return;
          } else {
            console.error("Erro na requisição:", error);
          }
        }
      })
    );
    res.status(200).json(responses.filter(Boolean));
  } catch (error) {
    console.error("Erro na requisição:", error);
    res.status(500).json({ error: "Ocorreu um erro na requisição." });
  }
});

app.get("/client/likes", async (req, res) => {
  try {
    const x_player_id = req.headers["x-player-id"];
    const selectQuery = `SELECT infos FROM curtidas WHERE x_player_id = ?`;
    connection.query(selectQuery, [x_player_id], (selectErr, selectResults) => {
      if (selectErr) {
        console.error("Erro ao buscar informações de curtidas:", selectErr);
        res.status(500).json({
          error: "Ocorreu um erro ao buscar informações de curtidas.",
        });
        return;
      }
      if (selectResults.length === 0) {
        res.status(200).json([]);
        return;
      }
      const likedInfos = JSON.parse(selectResults[0].infos);
      const likedIds = likedInfos
        .filter((info) => info !== null)
        .map((info) => info._id);

      res.status(200).json(likedIds);
    });
  } catch (error) {
    console.error(error);
    res
      .status(500)
      .json({ error: "Ocorreu um erro ao buscar as músicas curtidas." });
  }
});

app.get("/client/playlists", async (req, res) => {
  try {
    const x_player_id = req.headers["x-player-id"];

    connection.query(
      "SELECT playlists FROM playlists WHERE x_player_id = ?",
      [x_player_id],
      (err, results) => {
        if (err) {
          console.error("Erro ao obter playlists:", err);
          res
            .status(500)
            .json({ error: "Ocorreu um erro ao obter as playlists." });
          return;
        }

        if (results.length === 0) {
          res.status(200).json([]);
        } else {
          const playlists = JSON.parse(results[0].playlists);
          res.status(200).json(playlists);
        }
      }
    );
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Ocorreu um erro ao obter as playlists." });
  }
});

app.post("/client/playlists", async (req, res) => {
  try {
    const x_player_id = req.headers["x-player-id"];
    const { name, image_url } = req.body;

    connection.query(
      "SELECT playlists FROM playlists WHERE x_player_id = ?",
      [x_player_id],
      (err, results) => {
        if (err) {
          console.error("Erro ao verificar as playlists existentes:", err);
          res.status(500).json({
            error: "Ocorreu um erro ao verificar as playlists existentes.",
          });
          return;
        }

        let playlistsArray = [];
        if (results.length > 0) {
          playlistsArray = JSON.parse(results[0].playlists);
        }

        const lastPlaylist = playlistsArray[playlistsArray.length - 1];
        const lastId = lastPlaylist ? lastPlaylist.id : 0;
        const nextId = lastId + 1;

        const newPlaylist = {
          id: nextId,
          _id: name,
          name,
          image_url,
          songs: [],
        };

        playlistsArray.push(newPlaylist);

        if (results.length === 0) {
          connection.query(
            "INSERT INTO playlists (x_player_id, playlists) VALUES (?, ?)",
            [x_player_id, JSON.stringify([newPlaylist])],
            (insertErr) => {
              if (insertErr) {
                console.error("Erro ao inserir a playlist:", insertErr);
                res
                  .status(500)
                  .json({ error: "Ocorreu um erro ao inserir a playlist." });
                return;
              }

              res.status(200).json(newPlaylist);
            }
          );
        } else {
          connection.query(
            "UPDATE playlists SET playlists = ? WHERE x_player_id = ?",
            [JSON.stringify(playlistsArray), x_player_id],
            (updateErr) => {
              if (updateErr) {
                console.error("Erro ao atualizar a playlist:", updateErr);
                res.status(500).json({
                  error: "Ocorreu um erro ao atualizar a playlist.",
                });
                return;
              }

              res.status(200).json(newPlaylist);
            }
          );
        }
      }
    );
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Ocorreu um erro ao salvar a playlist." });
  }
});

app.post("/client/play", async (req, res) => {
  try {
    const x_player_id = req.headers["x-player-id"];

    const moyzDownloadHistoryQuery = "SELECT * FROM download_history WHERE x_player_id = ?";
    connection.query(moyzDownloadHistoryQuery, [x_player_id], async (downloadErr, downloadResults) => {
      if (downloadErr) {
        console.error("Erro ao buscar histórico de download:", downloadErr);
        res.status(500).json({
          error: "Ocorreu um erro ao buscar o histórico de download.",
        });
        return;
      }

      let moyzDownloadHistory = [];
      if (downloadResults.length > 0) {
        moyzDownloadHistory = JSON.parse(downloadResults[0].songs);
      }

      const songsToPlay = req.body.songs;

      const playedAt = new Date().toISOString();
      for (const songId of songsToPlay) {
        if (!moyzDownloadHistory.some(entry => entry._id === `${songId}`)) {
          try {
            const url = `https://api-v2.soundcloud.com/tracks/${songId}?client_id=${clientid}`;
            const response = await axios.get(url);
            const { permalink_url } = response.data;
            const forhubUrl = "https://www.forhub.io/download.php";
            const forhubResponse = await axios.post(
              forhubUrl,
              `formurl=${permalink_url}`
            );
            const urltouse = getStr(forhubResponse.data, "downloadFile('", "'");
            const response2 = response.data;

            moyzDownloadHistory.push({
              _id: `${songId}`,
              url: urltouse,
              image_url: response2.artwork_url || "https://picsum.photos/200",
              name: response2.title,
              author: response2.user.username,
              played_at: playedAt,
            });

            if (moyzDownloadHistory.length > 6) {
              moyzDownloadHistory.shift();
            }
          } catch (error) {
            console.error("Erro ao processar música:", error);
          }
        }
      }

      moyzDownloadHistory.sort((a, b) => new Date(a.played_at) - new Date(b.played_at));

      const updateHistoryQuery = "UPDATE download_history SET songs = ? WHERE x_player_id = ?";
      connection.query(updateHistoryQuery, [JSON.stringify(moyzDownloadHistory), x_player_id], (updateErr) => {
        if (updateErr) {
          console.error("Erro ao atualizar o histórico de download:", updateErr);
        }
      });

      res.status(200).json(moyzDownloadHistory);
    });
  } catch (error) {
    console.error("Erro na requisição:", error);
    res.status(500).json({ error: "Ocorreu um erro na requisição." });
  }
});


app.get("/client/playlists", async (req, res) => {
  try {
    const x_player_id = req.headers["x-player-id"];

    connection.query(
      "SELECT playlists FROM playlists WHERE x_player_id = ?",
      [x_player_id],
      (err, results) => {
        if (err) {
          console.error("Erro ao obter playlists:", err);
          res
            .status(500)
            .json({ error: "Ocorreu um erro ao obter as playlists." });
          return;
        }

        if (results.length === 0) {
          res.status(200).json([]);
        } else {
          const playlists = JSON.parse(results[0].playlists);
          res.status(200).json(playlists);
        }
      }
    );
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Ocorreu um erro ao obter as playlists." });
  }
});

app.post("/client/playlists/:playlistId/:songId", async (req, res) => {
  try {
    const playlistId = req.params.playlistId;
    const songId = req.params.songId;

    connection.query(
      "SELECT playlists FROM playlists WHERE x_player_id = ?",
      [req.headers["x-player-id"]],
      (err, results) => {
        if (err) {
          console.error("Erro ao obter playlists:", err);
          res
            .status(500)
            .json({ error: "Ocorreu um erro ao obter as playlists." });
          return;
        }

        if (results.length === 0) {
          res.status(404).json({ error: "Playlist não encontrada." });
        } else {
          const playlists = JSON.parse(results[0].playlists);
          const targetPlaylist = playlists.find(
            (playlist) => playlist._id === playlistId
          );

          if (!targetPlaylist) {
            res.status(404).json({ error: "Playlist não encontrada." });
            return;
          }

          targetPlaylist.songs.push(songId);

          connection.query(
            "UPDATE playlists SET playlists = ? WHERE x_player_id = ?",
            [JSON.stringify(playlists), req.headers["x-player-id"]],
            (updateErr) => {
              if (updateErr) {
                console.error("Erro ao atualizar a playlist:", updateErr);
                res
                  .status(500)
                  .json({ error: "Ocorreu um erro ao atualizar a playlist." });
                return;
              }

              res.status(200).json(targetPlaylist);
            }
          );
        }
      }
    );
  } catch (error) {
    console.error(error);
    res
      .status(500)
      .json({ error: "Ocorreu um erro ao adicionar a música à playlist." });
  }
});

app.post("/client/download", async (req, res) => {
  const { songs } = req.body;
  const moyz = req.body.songs[0]

  if (!songs || !Array.isArray(songs)) {
    return res.status(400).json({
      error: 'O parâmetro "songs" deve ser um array de IDs de músicas.',
    });
  }

  try {
    const x_player_id = req.headers["x-player-id"];

    // Fetch the current download history
    const moyzDownloadHistoryQuery = "SELECT * FROM download_history WHERE x_player_id = ?";
    connection.query(moyzDownloadHistoryQuery, [x_player_id], async (downloadErr, downloadResults) => {
      if (downloadErr) {
        console.error("Erro ao buscar histórico de download:", downloadErr);
        res.status(500).json({
          error: "Ocorreu um erro ao buscar o histórico de download.",
        });
        return;
      }

      let moyzDownloadHistory = [];
      if (downloadResults.length > 0) {
        moyzDownloadHistory = JSON.parse(downloadResults[0].songs);
      }

      if (moyzDownloadHistory.length === 0) {
        const songId = songs[0];
        const url = `https://api-v2.soundcloud.com/tracks/${moyz}?client_id=${clientid}`;
        const response = await axios.get(url);
        const { permalink_url } = response.data;
        const forhubUrl = "https://www.forhub.io/download.php";
        const forhubResponse = await axios.post(
          forhubUrl,
          `formurl=${permalink_url}`
        );
        const urltouse = getStr(forhubResponse.data, "downloadFile('", "'");
        const response2 = response.data;

        moyzDownloadHistory.push({
          _id: `${moyz}`,
          url: urltouse,
          image_url: response2.artwork_url || "https://picsum.photos/200",
          name: response2.title,
          author: response2.user.username,
        });

        const insertQuery = "INSERT INTO download_history (x_player_id, songs) VALUES (?, ?)";
        connection.query(insertQuery, [x_player_id, JSON.stringify(moyzDownloadHistory)], (insertErr) => {
          if (insertErr) {
            console.error("Erro ao inserir a primeira música no histórico:", insertErr);
          }
        });
      } else {
        await Promise.all(
          songs.map(async (moyz) => {
            if (!moyzDownloadHistory.some(entry => entry._id === `${moyz}`)) {
              const url = `https://api-v2.soundcloud.com/tracks/${moyz}?client_id=${clientid}`;
              const response = await axios.get(url);
              const { permalink_url } = response.data;
              const forhubUrl = "https://www.forhub.io/download.php";
              const forhubResponse = await axios.post(
                forhubUrl,
                `formurl=${permalink_url}`
              );
              const urltouse = getStr(forhubResponse.data, "downloadFile('", "'");
              const response2 = response.data;

              moyzDownloadHistory.push({
                _id: `${moyz}`,
                url: urltouse,
                image_url: response2.artwork_url || "https://picsum.photos/200",
                name: response2.title,
                author: response2.user.username,
              });

              if (moyzDownloadHistory.length > 6) {
                moyzDownloadHistory.shift();
              }
            }
          })
        );

        moyzDownloadHistory.sort((a, b) => parseInt(a._id) - parseInt(b._id));

        const updateHistoryQuery = "UPDATE download_history SET songs = ? WHERE x_player_id = ?";
        connection.query(updateHistoryQuery, [JSON.stringify(moyzDownloadHistory), x_player_id], (updateErr) => {
          if (updateErr) {
            console.error("Erro ao atualizar o histórico de download:", updateErr);
          }
        });
      }

      res.status(200).json(moyzDownloadHistory);
    });
  } catch (error) {
    console.error("Erro na requisição:", error);
    res.status(500).json({ error: "Ocorreu um erro na requisição." });
  }
});

app.get("/client/search", async (req, res) => {
  const { title } = req.query;

  try {
    const response = await axios.get(
      `https://api-v2.soundcloud.com/search/tracks?q=${title}&client_id=${clientid}&limit=${maxresults}&app_locale=pt_BR`
    );
    const responseData = response.data.collection;
    const formattedData = responseData.map((result) => ({
      _id: `${result.id}`,
      image_url: result.artwork_url || "https://picsum.photos/200",
      name: result.title,
      author: result.user.username,
    }));

    res.json(formattedData);
  } catch (error) {
    console.error("Erro na requisição:", error);
    res.status(500).json({ error: "Ocorreu um erro na requisição." });
  }
});

app.listen(PORT, () => {
  console.log(`\x1B[97mAPI rodando em http://${HOST}:${PORT}`);
});