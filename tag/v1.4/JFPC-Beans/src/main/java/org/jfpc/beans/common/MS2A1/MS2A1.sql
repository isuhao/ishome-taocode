CREATE TABLE ms2a1
(
    puk VARCHAR(24) DEFAULT '0' NOT NULL,
    k01_jsbh VARCHAR(24),
    k02_zzjgid VARCHAR(24) DEFAULT 'SYSTEM',
    f01_jsmc VARCHAR(40),
    f02_plsx VARCHAR(4),
    f03_jslx VARCHAR(20),
    bbb VARCHAR(200),
    fb1 VARCHAR(40),
    fb2 VARCHAR(80),
    fb3 VARCHAR(20),
    fb4 VARCHAR(20),
    fb5 VARCHAR(20),
    eb1 VARCHAR(40),
    eb2 VARCHAR(80),
    eb3 VARCHAR(20),
    eb4 VARCHAR(20),
    eb5 VARCHAR(24),
    ggg VARCHAR(24) DEFAULT 'SYSTEM',
    ppp VARCHAR(24) DEFAULT 'SYSTEM',
    ddd VARCHAR(4) DEFAULT '0' NOT NULL,
    cc1 VARCHAR(24) DEFAULT '2014/2/8' NOT NULL,
    cc2 VARCHAR(24) DEFAULT 'SYSTEM' NOT NULL,
    uu1 VARCHAR(24),
    uu2 VARCHAR(24),
PRIMARY KEY (puk)
)