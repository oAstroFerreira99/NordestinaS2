-- Copiando estrutura para tabela vibe.vibe_carry
CREATE TABLE IF NOT EXISTS vibe_carry (
  id int(11) NOT NULL AUTO_INCREMENT,
  police varchar(255) DEFAULT '0',
  nuser_id int(11) NOT NULL DEFAULT 0,
  nuser_name varchar(255) DEFAULT '0',
  date text DEFAULT NULL,
  PRIMARY KEY (id),
  KEY id (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela vibe.vibe_prison
CREATE TABLE IF NOT EXISTS vibe_prison (
  id int(11) NOT NULL AUTO_INCREMENT,
  police varchar(255) DEFAULT '0',
  nuser_id int(11) NOT NULL DEFAULT 0,
  services int(11) NOT NULL DEFAULT 0,
  fines int(20) NOT NULL DEFAULT 0,
  text longtext DEFAULT NULL,
  ongoingServices int(11) NOT NULL DEFAULT 0,
  date text DEFAULT NULL,
  PRIMARY KEY (id),
  KEY id (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela vibe.vibe_wanted
CREATE TABLE IF NOT EXISTS vibe_wanted (
  id int(11) NOT NULL AUTO_INCREMENT,
  police varchar(255) DEFAULT '0',
  nuser_id int(11) NOT NULL DEFAULT 0,
  nuser_name varchar(50) DEFAULT 'Indigente',
  description longtext DEFAULT NULL,
  image varchar(255) DEFAULT NULL,
  date text DEFAULT NULL,
  PRIMARY KEY (id),
  KEY id (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;