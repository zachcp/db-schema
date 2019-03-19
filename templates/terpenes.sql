CREATE TABLE "{{DATABASE}}"."terpenes" (
    terpene_id	serial NOT NULL,
    name	text,
    description	text,
    CONSTRAINT terpene_pkey PRIMARY KEY (terpene_id)
);
COMMENT ON TABLE "{{DATABASE}}"."terpenes" IS
  'Terpene synthase types';


INSERT INTO "{{DATABASE}}"."terpenes" (name, description) VALUES
    ( 'STC', 'sesquiterpene synthase' ),
    ( 'MTC', 'monoterpene synthase' ),
    ( 'DTC', 'diterpene synthase' );
