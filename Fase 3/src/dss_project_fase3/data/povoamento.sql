USE armazem_dss;
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE IF NOT EXISTS paletes (
                    QR_CODE varchar(100) NOT NULL PRIMARY KEY,
                    MATERIAL varchar(45) DEFAULT NULL,
                    LOCALIZACAO varchar (20) DEFAULT NULL,
                    CORREDOR int DEFAULT NULL,
                    SETOR int DEFAULT NULL,
                    ID_ROBOT int DEFAULT NULL);
CREATE TABLE IF NOT EXISTS prateleiras (
                    CORREDOR int NOT NULL,
                    SETOR int NOT NULL,
                    PALETE varchar (100) DEFAULT NULL,
                    PRIMARY KEY (CORREDOR, SETOR),
                    FOREIGN KEY (PALETE) REFERENCES paletes(QR_CODE));
CREATE TABLE IF NOT EXISTS robots (
                    ID_ROBOT int NOT NULL PRIMARY KEY,
                    DISPONIVEL BOOLEAN NOT NULL,
                    QR_CODE varchar(100) DEFAULT NULL,
                    LOCALIZACAO_ORIGEM varchar (20) DEFAULT NULL,
                    CORREDOR_ORIGEM int DEFAULT NULL,
                    SETOR_ORIGEM int DEFAULT NULL,
                    LOCALIZACAO_DESTINO varchar (20) DEFAULT NULL,
                    CORREDOR_DESTINO int DEFAULT NULL,
                    SETOR_DESTINO int DEFAULT NULL);


DELETE FROM robots WHERE TRUE;
DELETE FROM prateleiras WHERE TRUE;
DELETE FROM paletes WHERE TRUE;

INSERT INTO robots (ID_ROBOT, DISPONIVEL, QR_CODE, LOCALIZACAO_ORIGEM, CORREDOR_ORIGEM, SETOR_ORIGEM, LOCALIZACAO_DESTINO, CORREDOR_DESTINO, SETOR_DESTINO)
VALUES (1, FALSE, 'QR_CODE_BEGIN&&Parafusos&&QR_CODE_END', 'ZONA_RECECAO', NULL, NULL, 'ZONA_ARMAZENAMENTO', 1, 3),
       (2, TRUE, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
       ;

INSERT INTO paletes (QR_CODE, MATERIAL, LOCALIZACAO, CORREDOR, SETOR, ID_ROBOT)
VALUES ('QR_CODE_BEGIN&&Gelado&&QR_CODE_END', 'Gelado', 'ZONA_ARMAZENAMENTO', 1, 1, NULL),
       ('QR_CODE_BEGIN&&Pregos&&QR_CODE_END', 'Pregos', 'ZONA_RECECAO', NULL, NULL, NULL),
       ('QR_CODE_BEGIN&&Parafusos&&QR_CODE_END', 'Parafusos', 'ROBOT', NULL, NULL, 1)
       ;

INSERT INTO prateleiras (CORREDOR, SETOR, PALETE)
VALUES (0, 0, NULL),
       (0, 1, NULL),
       (0, 2, NULL),
       (0, 3, NULL),
       (0, 4, NULL),
       (1, 0, NULL),
       (1, 1, 'QR_CODE_BEGIN&&Gelado&&QR_CODE_END'),
       (1, 2, NULL),
       (1, 3, NULL),
       (1, 4, NULL)
       ;